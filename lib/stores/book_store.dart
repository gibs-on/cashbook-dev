import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/api_helpers/books_api_helper.dart';
import 'package:cashbook/helpers/api_helpers/transactions_api_helper.dart';
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/models/book.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/home/no_book_screen.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../service_locator.dart';
import 'cash_category_store.dart';
import 'payment_mode_store.dart';

part 'book_store.g.dart';

class BookStore = _BookStore with _$BookStore;

abstract class _BookStore with Store {
  late final DbHelper _dbHelper;
  late final BooksApiHelper _booksApiHelper;
  late final TransactionsApiHelper _transactionsApiHelper;
  late final TransactionStore _transactionStore;
  late final PaymentModeStore _paymentModeStore;
  late final CashCategoryStore _cashCategoryStore;
  late final SharedPreferencesHelper _sharedPreferencesHelper;

  _BookStore(
      this._dbHelper,
      this._booksApiHelper,
      this._transactionsApiHelper,
      this._transactionStore,
      this._paymentModeStore,
      this._cashCategoryStore,
      this._sharedPreferencesHelper);

  //Book Observables

  @observable
  // ignore: prefer_final_fields
  ObservableList<Book> bookList = ObservableList<Book>.of([]);
  @observable
  // ignore: prefer_final_fields
  ObservableList<int> downloadedBookList = ObservableList<int>.of([]);
  @observable
  Book? selectedBook;
  @observable
  bool isLoading = false;
  @observable
  String currentBookTitle = 'Undefined';
  // @observable
  // double balance = 0;
  // @observable
  // double totalCashIn = 0.0;
  // @observable
  // double totalCashOut = 0.0;

  @action
  void changeIsLoading(bool _val) {
    isLoading = _val;
    // print('Book Loading $isLoading');
  }

  //Book actions

  @action
  Future<void> changeBook(Book? _book) async {
    selectedBook = _book ?? bookList[0];
    currentBookTitle = selectedBook!.title;
    await _sharedPreferencesHelper.setCurrentBook(selectedBook!.id);
    await _transactionStore.fetchAndSetTransactions();
  }

  @action
  Future<FunctionResponse> fetchAndSetBooks(BuildContext context) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    // print('fetching books');

    changeIsLoading(true);
    // get raw data from db
    final dbBooks = await _dbHelper.getDbBooks();
    // print('books from db ${dbBooks.length}');

    // Clear the memory bookList
    bookList.clear();
    // get each row from db & add in memory bookList
    for (var element in dbBooks) {
      bookList.add(Book(
        id: element.id,
        title: element.title,
      ));
    }

    // If there is no book in db, create one. P.S. => there must be 1 book atleast
    if (bookList.isEmpty) {
      print('------ No book found moving to nobookscreen');
      Navigator.of(context).pushNamedAndRemoveUntil(
          NoBookScreen.routeName, (Route<dynamic> route) => false);
      _fResponse.success = false;
      _fResponse.data = 'NoBook';
    } else {
      _fResponse = await _sharedPreferencesHelper.getCurrentBook();
      print(
          'current book response : ${_fResponse.message}. success: ${_fResponse.success} book : ${_fResponse.data}');
      if (_fResponse.success) {
        try {
          Book _persistantBook =
              bookList.firstWhere((element) => element.id == _fResponse.data);
          await changeBook(_persistantBook);
        } catch (e) {
          print('Error setting current book : $e');
        }
      }

      //set selected book to the first book if null. =>first time run scenario
      if (selectedBook == null) {
        await changeBook(bookList[0]);
        print(
            'changed selectedBook to id: ${selectedBook!.id} name: ${selectedBook!.title}');
      }
      _fResponse.success = true;

      //fetch paymentmodes and cashCategories as this might be the app start
      await _paymentModeStore.fetchAndSetPaymentModes();
      await _cashCategoryStore.fetchAndSetCashCategories();
    }
    changeIsLoading(false);
    return _fResponse;
  }

  @action
  Future<FunctionResponse> addNewBook(String? _val) async {
    _val = _val ?? 'undefined';
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final int? _apiBookId = await _booksApiHelper.uploadSingleBook(_val);

      print('Id recieved from add new book API $_apiBookId');

      if (_apiBookId != null) {
        int? bookId = await _dbHelper.dbAddNewBook(
          id: _apiBookId,
          title: _val,
        );
        print('Id recieved from add new book API $bookId');

        if (bookId != null) {
          bookList.add(Book(
            id: _apiBookId,
            title: _val,
          ));

          _fResponse.success = true;
          _fResponse.message = 'New Book Added';
        } else {
          print('Error adding new book to database');
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error Adding New Book : $e';
    }
    if (bookList.length == 1) {
      await changeBook(null);
    }

    return _fResponse;
  }

  @action
  Future<FunctionResponse> editBookTitle(String? val, Book previousBook) async {
    val = val ?? 'undefined';

    FunctionResponse _fResponse = getIt<FunctionResponse>();
    final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();
    FunctionResponse functionResponse =
        await _connectivityHelper.checkInternetConnection();
    if (functionResponse.success) {
      try {
        bool? isUpdatedOnServer =
            await _booksApiHelper.updateBook(val, previousBook);
        if (isUpdatedOnServer ?? false) {
          // find index where current value resides
          int insertIndex =
              bookList.indexWhere((element) => element.id == previousBook.id);

          //Edit title in DB
          _fResponse = await _dbHelper.updateDbBook(
            id: previousBook.id,
            title: val,
          );
          if (_fResponse.success) {
            //Memory DELETE 'Book'
            bookList.removeAt(insertIndex);
            // Memory ADD renamed 'Book'
            bookList.insert(
                insertIndex,
                Book(
                  id: previousBook.id,
                  title: val,
                ));
            //if 'selectedBook' is renamed, UPDATE memory
            if (previousBook.id == selectedBook?.id) {
              selectedBook?.title = val;
              currentBookTitle = val;
            }
            selectedBook = selectedBook;
            _fResponse.success = true;
            _fResponse.message = 'Book edited successfully';
            return _fResponse;
          }
        } else {
          _fResponse.success = false;
          _fResponse.message = 'Couldn\'t update book on server';
          return _fResponse;
        }
      } catch (e) {
        _fResponse.success = false;
        _fResponse.message = 'Error editing book : $e';
      }

      return _fResponse;
    } else {
      // no internet. do nothing.
      _fResponse.success = false;
      _fResponse.message = 'No Internet Connection';
      return _fResponse;
    }
  }

  @action
  Future<FunctionResponse> deleteBook(int id) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _booksApiHelper.deleteBookApi(id);
      print('delete book api success');
      if (_fResponse.success) {
        _fResponse = await _dbHelper.deleteDbBook(id: id);
        if (_fResponse.success) {
          print('delete book db success');
          //delete from memory
          bookList.removeWhere((element) => element.id == id);
          print('books left after delete ${bookList.length}');

          _transactionStore.clearTransactions();
          _fResponse.success = true;
          _fResponse.message = 'Book Deleted';

          //if the book deleted was = selected. Move selectin Pointer to 1st Book in BookList.
          if (selectedBook?.id == id) {
            if (bookList.isNotEmpty) {
              await changeBook(bookList[0]);
            } else {
              _fResponse = await _sharedPreferencesHelper.removeCurrentBook();

              // print('delete current book response : ${_fResponse.message}');
              _fResponse.data = 'NoBook';
              selectedBook = null;
            }
          }
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error deleting book';
    }
    return _fResponse;
  }
}
