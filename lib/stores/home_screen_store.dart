import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/api_helpers/api_helper.dart';
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/models/book.dart';
import 'package:cashbook/models/cash_category.dart';
import 'package:cashbook/models/graphs/chart_data.dart';
import 'package:cashbook/models/graphs/column_chart_data.dart';
import 'package:cashbook/models/payment_mode.dart';
import 'package:cashbook/models/transaction.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/reporting_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../ui/home/time_filters.dart' show TimeFilter;

import '../ui/home/respective_filters.dart' show EntryTypeFilter;
import '../service_locator.dart';

import 'book_store.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  final BookStore bookStore;
  final SharedPreferencesHelper sharedPreferencesHelper;
  final TransactionStore transactionStore;
  final CashCategoryStore categoryStore;
  final DbHelper dbHelper;
  final ApiHelper apiHelper;
  final ReportingStore reportingStore;
  final PaymentModeStore paymentModeStore;

  _HomeScreenStore(
    this.bookStore,
    this.sharedPreferencesHelper,
    this.transactionStore,
    this.categoryStore,
    this.reportingStore,
    this.dbHelper,
    this.apiHelper,
    this.paymentModeStore,
  ) {
    init();
  }

  init() {
    transactionStore.getSelectedCurrency();
  }

  bool syncPopupIsCurrentlyOpen = false;

  //Screen UI
  @observable
  double balance = 0;
  @observable
  double totalCashIn = 0.0;
  @observable
  double totalCashOut = 0.0;
  @observable
  int checker = 0;
  @observable
  bool isUploading = false;
  @observable
  bool isDownloadingAllData = false;
  @observable
  bool needDataDownload = false;
  @observable
  bool isBuildingPdf = false;
  @observable
  int needSync = 0;
  @observable
  String lastSync = 'No record';

  //Pie chart
  @observable
  ObservableList<ChartData> cashInChartData = ObservableList<ChartData>.of([]);
  @observable
  ObservableList<ChartData> cashOutChartData = ObservableList<ChartData>.of([]);

  //Bar Chart
  @observable
  ObservableList<ColumnChartData> columnChartData =
      ObservableList<ColumnChartData>.of([]);

  //Filteres
  @observable
  String searchTerm = '';

  @observable
  // ignore: prefer_final_fields
  ObservableList<Transaction> filteredTransactions =
      ObservableList<Transaction>.of([]);

  // @ac_homeScreenStore.bookStore.selectedBook? selectedBook() => bookStore.selectedBook;

  @action
  String selectedCurrency() {
    var s = transactionStore.selectedCurrency;
    print('selected currency: $s');
    return s;
  }

  @action
  String? timeFilterIndicator() => transactionStore.timeFilterIndicator;

  @action
  bool filterIndicator() => transactionStore.filterIndicator;

  @action
  selectedTransactionCategoryType(bool value) {
    return categoryStore.selectedTransactionCategoryType = value;
  }

  @action
  CashCategory findCashCategoryById(int _id, bool _isCashIn) {
    return categoryStore.findCashCategoryById(_id, _isCashIn);
  }

  @action
  PaymentMode findPaymentModeById(int _id) {
    return paymentModeStore.findPaymentModeById(_id);
  }

  @action
  setTransactionDefaults(
      bool isCashIn1,
      DateTime? transactionDate1,
      TimeOfDay? transactionTime1,
      String? remarks,
      CashCategory? selectedCategory1,
      PaymentMode? selectedPaymentMode1,
      String? imagePath1) {
    transactionStore.setDefaults(isCashIn1, transactionDate1, transactionTime1,
        remarks, selectedCategory1, selectedPaymentMode1, imagePath1);
  }

  //Filters
  @action
  void changeSearchTerm(String val) {
    searchTerm = val;
  }

  @action
  FunctionResponse clearFilters() {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      searchTerm = '';
      transactionStore.entryTypeFilter = EntryTypeFilter.all;
      transactionStore.categoryFilter = null;
      transactionStore.paymentFilter = null;
      transactionStore.setFilterIndicator();

      filterTransactions();
      _fResponse.success = true;
      _fResponse.message = 'All filters Removed';
    } catch (e) {
      _fResponse.message = 'Error Removing Filters : $e';
    }

    return _fResponse;
  }

  //PDF loading status
  @action
  void changeBuildingPdfStatus(bool val) {
    isBuildingPdf = val;
  }

  @action
  void filterTransactions() {
    try {
      // print('filtering transactions ');

      // get raw transactions data from transactions store
      final List<Transaction> _rawTransactions = transactionStore.transactions;

      // print('Got ${_rawTransactions.length} from transactions store');
      //clear local transactions before populating
      filteredTransactions.clear();

      //apply filters and populate local transactions
      for (var element in _rawTransactions) {
        bool flag = true;

        if (searchTerm.isNotEmpty) {
          String _elementRemarks = element.remarks;
          _elementRemarks = _elementRemarks.trimLeft().trimRight();
          _elementRemarks = _elementRemarks.toLowerCase();
          searchTerm = searchTerm.toLowerCase().trimLeft();

          print('Searched : $searchTerm');
          if (!_elementRemarks.contains(searchTerm)) {
            flag = false;
          }
        }

        // Apply Time Filters
        switch (transactionStore.timeFilter) {
          case TimeFilter.allTime:
            {
              break;
            }
          case TimeFilter.today:
            {
              if (!(element.date.day == DateTime.now().day)) {
                flag = false;
              }
              break;
            }
          case TimeFilter.yesterday:
            {
              if (!(element.date.day == DateTime.now().day - 1)) {
                flag = false;
              }
              break;
            }

          case TimeFilter.thisMonth:
            {
              if (!(element.date.month == DateTime.now().month)) {
                flag = false;
              }
              break;
            }
          case TimeFilter.lastMonth:
            {
              if (!(element.date.month == DateTime.now().month - 1)) {
                flag = false;
              }
              break;
            }
          case TimeFilter.singleDay:
            {
              if (!(element.date.day ==
                      transactionStore.timeFilterSingleDate.day &&
                  element.date.month ==
                      transactionStore.timeFilterSingleDate.month &&
                  element.date.year ==
                      transactionStore.timeFilterSingleDate.year)) {
                flag = false;
              }
              break;
            }
          case TimeFilter.dateRange:
            {
              if (!(element.date.isAfter(transactionStore.timeFilterRangeStart
                      .subtract(const Duration(days: 1))) &&
                  element.date.isBefore(transactionStore.timeFilterRangeEnd
                      .add(const Duration(days: 1))))) {
                flag = false;
              }
              break;
            }
          default:
            {
              break;
            }
        }

        //Apply Entry Type filters
        switch (transactionStore.entryTypeFilter) {
          case EntryTypeFilter.all:
            {
              break;
            }

          case EntryTypeFilter.cashIn:
            {
              if (!element.isCashIn) {
                flag = false;
              }

              break;
            }
          case EntryTypeFilter.cashOut:
            {
              if (element.isCashIn) {
                flag = false;
              }
              break;
            }
          default:
            {
              break;
            }
        }

        //Apply Category Filters

        if (transactionStore.categoryFilter != null) {
          if (element.category != transactionStore.categoryFilter!.id) {
            flag = false;
          }
        }
        //Apply Payment Mode Filters

        if (transactionStore.paymentFilter != null) {
          if (element.paymentMode != transactionStore.paymentFilter!.id) {
            flag = false;
          }
        }

        if (flag) {
          filteredTransactions.add(Transaction(
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

      setBookBalanceStatus(filteredTransactions);
      columnChartData.clear();
      cashInChartData.clear();
      cashOutChartData.clear();
      prepareBarChart();
      preparePieChartData(true);
      preparePieChartData(false);
      reportingStore.changeSelectedScreen(reportingStore.selectedScreen);
      // print(
      //     'Filtered to ${filteredTransactions.length} transactions from transactions store');
    } catch (e) {
      // print('Error fetching transactions from transactions store : $e');
    }
  }

  @action
  void setBookBalanceStatus(List<Transaction> _transactions) {
    // print('Setting book balances');
    try {
      double _totalIn = 0;
      double _totalOut = 0;

      for (Transaction _transaction in _transactions) {
        if (_transaction.isCashIn) {
          _totalIn += _transaction.amount;
        } else {
          _totalOut += _transaction.amount;
        }
      }
      totalCashIn = _totalIn;
      totalCashOut = _totalOut;
      balance = _totalIn - _totalOut;
      // print(
      //     'balance; $balance, totalIn : $totalCashIn  totalOut: $totalCashOut');
    } catch (e) {
      print('Error setting book balanes : $e');
    }
    isDownloadingAllData = false;
  }

  @action
  FunctionResponse findBalanceStatusByDate(String _date) {
    FunctionResponse _fResponse = FunctionResponse();
    _fResponse.data = 0;
    try {
      List<Transaction> _thisDateTransactions = filteredTransactions
          .where(
              (element) => DateFormat('d MMM y').format(element.date) == _date)
          .toList();

      _fResponse.count = _thisDateTransactions.length;

      for (Transaction _transaction in _thisDateTransactions) {
        if (_transaction.isCashIn) {
          _fResponse.data += _transaction.amount;
        } else {
          _fResponse.data -= _transaction.amount;
        }
      }
      _fResponse.success = true;
    } catch (e) {
      _fResponse.message = 'Error getting balance status : $e';
    }

    return _fResponse;
  }

  //Reporting
  @action
  double preparePieChartData(bool isCashIn) {
    cashInChartData.clear();
    cashOutChartData.clear();
    double total = 0.0;

    for (var element in filteredTransactions) {
      if (element.isCashIn == isCashIn) {
        total += element.amount;
      }
    }

    for (CashCategory _category in isCashIn
        ? categoryStore.cashInCategoryList
        : categoryStore.cashOutCategoryList) {
      double value = 0;
      print('filtered transaction got1 yay: \n\n\n');
      for (Transaction _transaction in filteredTransactions) {
        if (_transaction.isCashIn == false) {
          print(
              'filtered transaction got1 yay: ${_transaction.category} -- ${_transaction.amount}');
        }

        if (_transaction.category == _category.id &&
            _transaction.isCashIn == isCashIn) {
          print(
              'filtered transaction got: ${_transaction.category} -- ${_transaction.amount}');
          value += _transaction.amount;
        }
      }
      if (value > 0) {
        String percentage = ((value * 100) / total).toStringAsFixed(0);

        if (isCashIn) {
          cashInChartData.add(ChartData(
            value,
            _category,
            '$percentage %',
          ));
        } else {
          print('percentage calculated: $_category -- $percentage');
          cashOutChartData.add(ChartData(
            value,
            _category,
            '$percentage %',
          ));
        }
      }
    }
    return total;
  }

  @action
  void prepareBarChart() {
    columnChartData.clear();
    List<DateTime> uniqueDates = [];
    double count = 0;

    for (Transaction transaction in filteredTransactions) {
      if (!uniqueDates.contains(transaction.date)) {
        uniqueDates.add(transaction.date);
      }
    }

    for (DateTime date in uniqueDates) {
      String formattedDate = DateFormat('d MMM y').format(date);
      FunctionResponse fResponse = findBalanceStatusByDate(formattedDate);
      if (fResponse.success) {
        count += 0;
        columnChartData.add(ColumnChartData(
            DateFormat('MMM-d').format(date), fResponse.data, count));
      }
    }
  }

  // Upload /Logout

  @action
  void changeUploadingStatus(bool val) {
    isUploading = val;
    print('changed is uploading in to $isUploading');
  }

  @action
  Future<FunctionResponse> userLogout() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //delete data in db, shared preferences .
      print('Logout called');

      await uploadAllData();
      _fResponse = await sharedPreferencesHelper.removeCurrentBook();
      print(_fResponse.message);
      _fResponse = await sharedPreferencesHelper.removeCurrentCurrency();
      print(_fResponse.message);
      _fResponse = await sharedPreferencesHelper.removeUser();
      print(_fResponse.message);
      _fResponse = await sharedPreferencesHelper.removeLastSync();
      print(_fResponse.message);
      _fResponse = await dbHelper.deleteAllDatabase();
      print(_fResponse.message);

      //set needDataDownload status to true so data gets downloaded in future when user reaches HomeScreen
      needDataDownload = true;
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error logging out $e';
    }
    return _fResponse;
  }

  @action
  Future<void> downloadAllData(BuildContext context) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    isDownloadingAllData = true;
    // print('Downloading : $isDownloading');
    try {
      //Download data if needsDataDownload is true
      if (needDataDownload) {
        print('starting to download all data');
        await apiHelper.downloadData();
      }
      try {
        _fResponse = await dbHelper
            .needSyncStatus(); // getting if the user has some un-synced or some edited entries
        print(_fResponse.message);
        print(_fResponse.data);
        if (_fResponse.success) {
          if (_fResponse.data) {
            _fResponse = await sharedPreferencesHelper
                .getLastSync(); // if the user has sync already before, we get the time from here
            print(_fResponse.message);
            if (_fResponse.success) {
              // user has already synced. now just check the last sync time and if one day has passed, show the dialog again
              // Important: we show this time on the dialog
              lastSync = _fResponse.data;
              DateTime date =
                  DateFormat('h:mm a d MMM y').parse(_fResponse.data);
              bool hasOneDayPassedSinceLastSync = date
                  .isBefore(DateTime.now().subtract(const Duration(days: 1)));
              if (hasOneDayPassedSinceLastSync) {
                needSync = needSync + 1;
              }
              print(date);
              print('need sync : $needSync');
            } else {
              print('double popup issue: inside un-synced block');
              // we check the last date/time when the popup was shown (in this case, we have another shared pref value
              // that tells the last time popup was shown. )
              // Important: we dont show this time on the dialog, so user presses the sync later, we don't show popup for this too
              FunctionResponse functionResponse = getIt<FunctionResponse>();
              functionResponse =
                  await sharedPreferencesHelper.getLastSyncPopUpSown();

              if (functionResponse.success) {
                // we already shown the popup but the user pressed sync later, so now we check again for one day and show
                print(
                    'date found for last shown popup - ${functionResponse.data}');

                DateTime date =
                    DateFormat('h:mm a d MMM y').parse(functionResponse.data);
                print('date found for last shown popup - $date');

                bool hasOneDayPassedSinceLastSync = date
                    .isBefore(DateTime.now().subtract(const Duration(days: 1)));
                if (hasOneDayPassedSinceLastSync) {
                  needSync = needSync + 1;
                }
              } else {
                //we are showing popup the very first time
                needSync = needSync + 1;
                await sharedPreferencesHelper.setNoSyncPopUpShownDate(
                    DateFormat('h:mm a d MMM y').format(DateTime.now()));
              }

              print('double popup issue: inside !needSync block');
            }
          } /*  else {
          if (needSync) needSync = false;
        } */
        }
      } catch (e) {
        print(e);
      }

      //Set to false as we do not need to download data now.
      needDataDownload = false;

      await bookStore.fetchAndSetBooks(context);

      isDownloadingAllData = false;
    } catch (e) {
      print('Error downloading api data $e');
    }
    // print('Downloading : $isDownloading');

    isDownloadingAllData = false;
  }

  @action
  Future<void> uploadAllData() async {
    print('Uploading Data');
    await apiHelper.uploadData();
    await apiHelper.uploadLastSyncTimeAndDate();
  }

  @action
  isTutorialShown() async {
    return await sharedPreferencesHelper.isTutorialShown();
  }

  @action
  setTutorialShown() {
    sharedPreferencesHelper.setTutorialShown();
  }

  @action
  clearAllTransactions() {
    transactionStore.clearTransactions();
  }

  @action
  clearDownloadBookList() {
    bookStore.downloadedBookList.clear();
  }

  @action
  setLastSync() {
    sharedPreferencesHelper.setLastSync(
      DateFormat('h:mm a d MMM y').format(
        DateTime.now(),
      ),
    );
  }

  @action
  fetchAndSetTranasctions() {
    transactionStore.fetchAndSetTransactions();
  }
}
