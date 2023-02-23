// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookStore on _BookStore, Store {
  final _$bookListAtom = Atom(name: '_BookStore.bookList');

  @override
  ObservableList<Book> get bookList {
    _$bookListAtom.reportRead();
    return super.bookList;
  }

  @override
  set bookList(ObservableList<Book> value) {
    _$bookListAtom.reportWrite(value, super.bookList, () {
      super.bookList = value;
    });
  }

  final _$downloadedBookListAtom = Atom(name: '_BookStore.downloadedBookList');

  @override
  ObservableList<int> get downloadedBookList {
    _$downloadedBookListAtom.reportRead();
    return super.downloadedBookList;
  }

  @override
  set downloadedBookList(ObservableList<int> value) {
    _$downloadedBookListAtom.reportWrite(value, super.downloadedBookList, () {
      super.downloadedBookList = value;
    });
  }

  final _$selectedBookAtom = Atom(name: '_BookStore.selectedBook');

  @override
  Book? get selectedBook {
    _$selectedBookAtom.reportRead();
    return super.selectedBook;
  }

  @override
  set selectedBook(Book? value) {
    _$selectedBookAtom.reportWrite(value, super.selectedBook, () {
      super.selectedBook = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_BookStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$currentBookTitleAtom = Atom(name: '_BookStore.currentBookTitle');

  @override
  String get currentBookTitle {
    _$currentBookTitleAtom.reportRead();
    return super.currentBookTitle;
  }

  @override
  set currentBookTitle(String value) {
    _$currentBookTitleAtom.reportWrite(value, super.currentBookTitle, () {
      super.currentBookTitle = value;
    });
  }

  final _$changeBookAsyncAction = AsyncAction('_BookStore.changeBook');

  @override
  Future<void> changeBook(Book? _book) {
    return _$changeBookAsyncAction.run(() => super.changeBook(_book));
  }

  final _$fetchAndSetBooksAsyncAction =
      AsyncAction('_BookStore.fetchAndSetBooks');

  @override
  Future<FunctionResponse> fetchAndSetBooks(BuildContext context) {
    return _$fetchAndSetBooksAsyncAction
        .run(() => super.fetchAndSetBooks(context));
  }

  final _$addNewBookAsyncAction = AsyncAction('_BookStore.addNewBook');

  @override
  Future<FunctionResponse> addNewBook(String? _val) {
    return _$addNewBookAsyncAction.run(() => super.addNewBook(_val));
  }

  final _$editBookTitleAsyncAction = AsyncAction('_BookStore.editBookTitle');

  @override
  Future<FunctionResponse> editBookTitle(String? val, Book previousBook) {
    return _$editBookTitleAsyncAction
        .run(() => super.editBookTitle(val, previousBook));
  }

  final _$deleteBookAsyncAction = AsyncAction('_BookStore.deleteBook');

  @override
  Future<FunctionResponse> deleteBook(int id) {
    return _$deleteBookAsyncAction.run(() => super.deleteBook(id));
  }

  final _$_BookStoreActionController = ActionController(name: '_BookStore');

  @override
  void changeIsLoading(bool _val) {
    final _$actionInfo = _$_BookStoreActionController.startAction(
        name: '_BookStore.changeIsLoading');
    try {
      return super.changeIsLoading(_val);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bookList: ${bookList},
downloadedBookList: ${downloadedBookList},
selectedBook: ${selectedBook},
isLoading: ${isLoading},
currentBookTitle: ${currentBookTitle}
    ''';
  }
}
