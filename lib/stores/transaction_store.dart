import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/helpers/api_helpers/auth_api_helper.dart';
import 'package:cashbook/helpers/api_helpers/transactions_api_helper.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/models/cash_category.dart';
import 'package:cashbook/models/payment_mode.dart';
import 'package:cashbook/stores/book_store.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/remarks_store.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:intl/intl.dart';
import '../helpers/db_helper.dart';

import 'package:cashbook/utils/locale_helper.dart';
import '../service_locator.dart';
import '../ui/home/time_filters.dart' show TimeFilter;
import '../ui/home/filters_sheet.dart' show GeneralFilter;
import '../ui/home/respective_filters.dart' show EntryTypeFilter;

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../models/transaction.dart' as transaction;
import 'home_screen_store.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

final SharedPreferencesHelper _sharedPreferencesHelper =
    getIt<SharedPreferencesHelper>();

final BookStore _bookStore = getIt<BookStore>();
final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();
final PaymentModeStore _paymentModeStore = getIt<PaymentModeStore>();
final CashCategoryStore _cashCategoryStore = getIt<CashCategoryStore>();

// to get default currency
CustomLocaleHelper customLocaleHelper = CustomLocaleHelper();

abstract class _TransactionStore with Store {
  final DbHelper _dbHelper;
  final TransactionsApiHelper _transactionsApiHelper;
  final RemarksStore _remarkStore;
  _TransactionStore(
      this._dbHelper, this._transactionsApiHelper, this._remarkStore);

  //UI observables
  @observable
  bool isLoading = false;

  @observable
  bool isFetching = false;

  //Time Filter observables
  @observable
  TimeFilter? timeFilter = TimeFilter.allTime;
  @observable
  DateTime timeFilterSingleDate = DateTime.now();
  @observable
  DateTime timeFilterRangeStart = DateTime.now();
  @observable
  DateTime timeFilterRangeEnd = DateTime.now();
  @observable
  String? timeFilterIndicator;

  //General Filter Observables
  @observable
  GeneralFilter generalFilter = GeneralFilter.entryType;
  @observable
  EntryTypeFilter entryTypeFilter = EntryTypeFilter.all;
  @observable
  CashCategory? categoryFilter;
  @observable
  PaymentMode? paymentFilter;
  @observable
  bool filterIndicator = true;

  //Currency observables
  @observable
  String selectedCurrency = 'KES';

  //Manage Transaction Observables
  @observable
  String currentRemark = '';

  //Transaction observables
  @observable
  DateTime transactionDate = DateTime.now();
  @observable
  TimeOfDay transactionTime = TimeOfDay.now();

  @observable
  String? imagePath;

  @observable
  // ignore: prefer_final_fields
  ObservableList<transaction.Transaction> _transactions =
      ObservableList<transaction.Transaction>.of([]);

  @computed
  get bookList {
    return [..._bookStore.bookList];
  }

  @computed
  get transactions {
    if (_bookStore.selectedBook == null) {
      // print('No Book selected');
      return [];
    }
    return [
      ..._transactions
          .where((element) => element.bookId == _bookStore.selectedBook!.id)
    ];
  }

  // TimeFilter Actions
  @action
  void changeTimeFilter(TimeFilter? val) {
    timeFilter = val ?? TimeFilter.allTime;

    switch (timeFilter) {
      case TimeFilter.allTime:
        {
          timeFilterIndicator = 'All Time';
          break;
        }
      case TimeFilter.today:
        {
          timeFilterIndicator = 'Today';
          break;
        }
      case TimeFilter.yesterday:
        {
          timeFilterIndicator = 'Yesterday';
          break;
        }

      case TimeFilter.thisMonth:
        {
          timeFilterIndicator = 'This month';
          break;
        }
      case TimeFilter.lastMonth:
        {
          timeFilterIndicator = 'Last Month';
          break;
        }
      case TimeFilter.singleDay:
        {
          timeFilterIndicator =
              DateFormat('d MMM').format(timeFilterSingleDate);
          break;
        }
      case TimeFilter.dateRange:
        {
          timeFilterIndicator =
              '${DateFormat('d MMM').format(timeFilterRangeStart)} to ${DateFormat('d MMM').format(timeFilterRangeEnd)}';

          break;
        }
      default:
        {
          break;
        }
    }
    _homeScreenStore.filterTransactions();
  }

  @action
  void changetimeFilterSingleDate(DateTime? val) {
    timeFilterSingleDate = val ?? DateTime.now();
    timeFilterIndicator = DateFormat('d MMM').format(timeFilterSingleDate);
    _homeScreenStore.filterTransactions();
  }

  @action
  void changetimeFilterRange(DateTime? val, bool isStartDate) {
    if (isStartDate) {
      timeFilterRangeStart = val ?? DateTime.now();
      timeFilterIndicator =
          '${DateFormat('d MMM').format(timeFilterRangeStart)} to ${DateFormat('d MMM').format(timeFilterRangeEnd)}';
      _homeScreenStore.filterTransactions();
      return;
    }

    timeFilterRangeEnd = val ?? DateTime.now();
    timeFilterIndicator =
        '${DateFormat('d MMM').format(timeFilterRangeStart)} to ${DateFormat('d MMM').format(timeFilterRangeEnd)}';

    fetchAndSetTransactions();
  }

  //General FIlter Actions
  @action
  void changeGeneralFilter(GeneralFilter val) {
    generalFilter = val;
  }

  @action
  void changeEntryTypeFilter(EntryTypeFilter? val) {
    entryTypeFilter = val ?? EntryTypeFilter.all;
    setFilterIndicator();
    _homeScreenStore.filterTransactions();
  }

  @action
  void changeCategoryFilter(CashCategory? val) {
    categoryFilter = val;
    setFilterIndicator();
    _homeScreenStore.filterTransactions();
  }

  @action
  void changePaymentFilter(PaymentMode? val) {
    paymentFilter = val;
    setFilterIndicator();
    _homeScreenStore.filterTransactions();
  }

  @action
  void setFilterIndicator() {
    filterIndicator = false;
    if (entryTypeFilter == EntryTypeFilter.all &&
        categoryFilter == null &&
        paymentFilter == null) {
      filterIndicator = true;
    }
  }

  //Currency Actions
  @action
  Future<void> changeSelectedCurrency(String val) async {
    FunctionResponse _fResponse = FunctionResponse();
    selectedCurrency = val;
    _fResponse =
        await _sharedPreferencesHelper.setCurrentCurrency(selectedCurrency);
    print(_fResponse.message);
  }

  @action
  Future<void> getSelectedCurrency() async {
    FunctionResponse _fResponse = FunctionResponse();

    _fResponse = await _sharedPreferencesHelper.getCurrentCurrency();
    print(_fResponse.message);
    if (_fResponse.success) {
      changeSelectedCurrency(_fResponse.data);
    }
  }

  @action
  void clearTransactions() {
    _transactions.clear();
    _homeScreenStore.filterTransactions();
    print('transactions in transaction store : ${_transactions.length}');
  }

  //Transaction Actions
  @action
  Future<void> fetchAndSetTransactions() async {
    isFetching = true;
    try {
      // print('fetch and set transaction');

      //TODO: get this data from database
      //get Transactions for the changed book.
      if (_bookStore.selectedBook?.id != null) {
        if (!_bookStore.downloadedBookList
            .contains(_bookStore.selectedBook!.id)) {
          await _transactionsApiHelper
              .getTransactions(_bookStore.selectedBook!.id);
          _bookStore.downloadedBookList.add(_bookStore.selectedBook!.id);
        } else {
          // print(
          //     'Transactions already downloaded for Book : ${_bookStore.selectedBook!.id} ${_bookStore.selectedBook!.title} from API');
        }
      }
      _homeScreenStore.clearFilters();

      // get raw transactions data from database
      final dbTransactions = await _dbHelper.getDbTransactions();
      // print('transactions from database : ${dbTransactions.length}');

      //clear local transactions before populating
      _transactions.clear();

      //populate local transactions
      for (var element in dbTransactions) {
        //Make sure transactions belong to the current book
        if (element.bookId == _bookStore.selectedBook?.id) {
          _transactions.add(transaction.Transaction(
            id: element.id,
            bookId: element.bookId,
            remarks: element.remarks,
            category: element.category,
            amount: element.amount,
            paymentMode: element.paymentMode,
            date: element.date,
            isCashIn: element.isCashIn,
            imagePath: element.imagePath,
            isSynced: element.isSynced,
            isEdited: element.isEdited,
          ));
        }
      }
      // print('Got ${_transactions.length} transactions from database');
      await getSelectedCurrency();
      _homeScreenStore.filterTransactions();
    } catch (e) {
      print('Error fetching transactions from database : $e');
    }
    isFetching = false;
  }

  @action
  void updateRemaks(String remarks) {
    currentRemark = remarks;
    print('new remarks $currentRemark');
  }

  @action
  Future<FunctionResponse> addTransaction(
      {required transaction.Transaction formData, bool isCashIn = true}) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      DateTime date = DateTime(
          transactionDate.year,
          transactionDate.month,
          transactionDate.day,
          transactionTime.hour,
          transactionTime.minute,
          transactionDate.second);

      //DB Add 'Transaction'
      _fResponse = await _dbHelper.addNewDbTransaction(
        id: null,
        bookId: _bookStore.selectedBook!.id,
        remarks: formData.remarks,
        category: _cashCategoryStore.selectedCategory?.id ?? 0,
        amount: formData.amount,
        paymentMode: _paymentModeStore.selectedPaymentMode?.id ?? 0,
        date: date,
        imagePath: imagePath,
        // balanceLeft: balanceLeft,
        isCashIn: isCashIn,
        isSynced: false,
        isEdited: false,
      );

      //Memory Add 'Transaction' at first Location
      if (_fResponse.success) {
        final int transactionId = _fResponse.data;
        _transactions.insert(
          0,
          transaction.Transaction(
            id: transactionId,
            bookId: _bookStore.selectedBook!.id,
            remarks: formData.remarks,
            category: _cashCategoryStore.selectedCategory?.id ?? 0,
            amount: formData.amount,
            paymentMode: _paymentModeStore.selectedPaymentMode?.id ?? 0,
            date: date,
            imagePath: imagePath,
            isCashIn: isCashIn,
            isSynced: false,
            isEdited: false,
          ),
        );

        _fResponse = await _remarkStore.addOrUpdateRemark(
            _bookStore.selectedBook!.id, formData.remarks, isCashIn);
        print(_fResponse.message);

        print('after adding remarks');
        await fetchAndSetTransactions();
        _homeScreenStore.filterTransactions();
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error adding new transaction: $e';
    }
    return _fResponse;
  }

  @action
  Future<FunctionResponse> editTransaction({
    required transaction.Transaction formData,
  }) async {
    FunctionResponse _fResponse = FunctionResponse();

    print('edit called for ${formData.id} isSynced: ${formData.isSynced}');

    try {
      // CONVERT ('Date' & 'Time') into 'DateTime'
      DateTime date = DateTime(
          transactionDate.year,
          transactionDate.month,
          transactionDate.day,
          transactionTime.hour,
          transactionTime.minute,
          transactionDate.second);
      final transaction.Transaction _newTransaction = transaction.Transaction(
        id: formData.id,
        bookId: formData.bookId,
        remarks: formData.remarks,
        category: _cashCategoryStore.selectedCategory?.id ?? 3,
        amount: formData.amount,
        paymentMode: _paymentModeStore.selectedPaymentMode?.id ?? 1,
        date: date,
        isCashIn: _cashCategoryStore.selectedTransactionCategoryType,
        imagePath: imagePath,
        isSynced: formData.isSynced,
        isEdited: true,
      );

      // if (_newTransaction.isSynced) {
      //   _fResponse =
      //       await _transactionsApiHelper.editTransactionApi(_newTransaction);
      // }

      // if (_fResponse.success || !_newTransaction.isSynced) {
      //DB UPDATE 'Transaction'
      _fResponse = await _dbHelper.updateDbTransaction(
        id: _newTransaction.id,
        bookId: _newTransaction.bookId,
        remarks: _newTransaction.remarks,
        category: _newTransaction.category,
        amount: _newTransaction.amount,
        paymentMode: _newTransaction.paymentMode,
        date: date,
        imagePath: _newTransaction.imagePath,
        isCashIn: _newTransaction.isCashIn,
        isSynced: _newTransaction.isSynced,
        isEdited: true,
      );

      if (_fResponse.success) {
        //Memory UPDATE 'Transaction'

        final insertIndex = _transactions
            .indexWhere((element) => element.id == _newTransaction.id);

        _transactions[insertIndex] = _newTransaction;
      }
      // }
      await _remarkStore.addOrUpdateRemark(_bookStore.selectedBook!.id,
          _newTransaction.remarks, _newTransaction.isCashIn);

      await fetchAndSetTransactions();
      _homeScreenStore.filterTransactions();
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error adding transaction : $e';
    }
    return _fResponse;
  }

  @action
  Future<void> deleteTransaction(transaction.Transaction transaction) async {
    try {
      if (transaction.isSynced) {
        // call the api here.

        ConnectivityHelper connectivityHelper = getIt<ConnectivityHelper>();
        final AuthResponse? _userData =
            await getIt<AuthApiHelper>().getCurrentUser();

        FunctionResponse internetConnectionResponse =
            await connectivityHelper.checkInternetConnection();
        if (internetConnectionResponse.success) {
          ApiClient _apiClient = await getIt<AuthApiHelper>().getNewToken();
          final _response = await _apiClient
              .apiCashBookDeleteCashbookTransactionBusinessidBookIdDelete(
            businessid: _userData!.businessId,
            bookId: transaction.bookId.toString(),
            body: [LedgerBookDTODelete(id: transaction.id)],
          );
          if (_response.isSuccessful) {
            print('transaction deleted - ${_response.body.toString()}');
          }
        }
      }

      final deleteIndex =
          _transactions.indexWhere((element) => element.id == transaction.id);
      if (deleteIndex == -1) {
        return;
      }

      // DB DELETE 'Transaction'
      _dbHelper.deleteDbTransaction(id: transaction.id);

      // Memory DELETE 'Transaction'
      _transactions.removeAt(deleteIndex);

      _homeScreenStore.filterTransactions();
    } catch (e) {
      print(e);
    }
  }

  //Set Defaults in form fields before add/edit transaction
  @action
  void setDefaults(
      bool isCashIn1,
      DateTime? transactionDate1,
      TimeOfDay? transactionTime1,
      String? remarks,
      CashCategory? selectedCategory1,
      PaymentMode? selectedPaymentMode1,
      String? imagePath1) {
    transactionDate = transactionDate1 ?? DateTime.now();
    transactionTime = transactionTime1 ?? TimeOfDay.now();
    currentRemark = remarks ?? '';
    _paymentModeStore.selectedPaymentMode =
        selectedPaymentMode1 ?? _paymentModeStore.paymentModeList[0];
    imagePath = imagePath1;
    _cashCategoryStore.selectedCategory = selectedCategory1 ??
        (isCashIn1
            ? _cashCategoryStore.cashInCategoryList[0]
            : _cashCategoryStore.cashOutCategoryList[0]);

    print('Image from transaction $imagePath');
  }

  @action
  void setImagePath(String? val) {
    imagePath = val;
    print('Image for transaction details view $imagePath');
  }

  @action
  void removeImage() {
    imagePath = null;
  }

  @action
  void setTransactionDate(DateTime? _val) {
    transactionDate = _val ?? DateTime.now();
  }

  @action
  void setTransactionTime(TimeOfDay? val) {
    transactionTime = val ?? TimeOfDay.now();
  }
}
