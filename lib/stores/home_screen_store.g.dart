// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenStore on _HomeScreenStore, Store {
  final _$balanceAtom = Atom(name: '_HomeScreenStore.balance');

  @override
  double get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(double value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$totalCashInAtom = Atom(name: '_HomeScreenStore.totalCashIn');

  @override
  double get totalCashIn {
    _$totalCashInAtom.reportRead();
    return super.totalCashIn;
  }

  @override
  set totalCashIn(double value) {
    _$totalCashInAtom.reportWrite(value, super.totalCashIn, () {
      super.totalCashIn = value;
    });
  }

  final _$totalCashOutAtom = Atom(name: '_HomeScreenStore.totalCashOut');

  @override
  double get totalCashOut {
    _$totalCashOutAtom.reportRead();
    return super.totalCashOut;
  }

  @override
  set totalCashOut(double value) {
    _$totalCashOutAtom.reportWrite(value, super.totalCashOut, () {
      super.totalCashOut = value;
    });
  }

  final _$checkerAtom = Atom(name: '_HomeScreenStore.checker');

  @override
  int get checker {
    _$checkerAtom.reportRead();
    return super.checker;
  }

  @override
  set checker(int value) {
    _$checkerAtom.reportWrite(value, super.checker, () {
      super.checker = value;
    });
  }

  final _$isUploadingAtom = Atom(name: '_HomeScreenStore.isUploading');

  @override
  bool get isUploading {
    _$isUploadingAtom.reportRead();
    return super.isUploading;
  }

  @override
  set isUploading(bool value) {
    _$isUploadingAtom.reportWrite(value, super.isUploading, () {
      super.isUploading = value;
    });
  }

  final _$isDownloadingAllDataAtom =
      Atom(name: '_HomeScreenStore.isDownloadingAllData');

  @override
  bool get isDownloadingAllData {
    _$isDownloadingAllDataAtom.reportRead();
    return super.isDownloadingAllData;
  }

  @override
  set isDownloadingAllData(bool value) {
    _$isDownloadingAllDataAtom.reportWrite(value, super.isDownloadingAllData,
        () {
      super.isDownloadingAllData = value;
    });
  }

  final _$needDataDownloadAtom =
      Atom(name: '_HomeScreenStore.needDataDownload');

  @override
  bool get needDataDownload {
    _$needDataDownloadAtom.reportRead();
    return super.needDataDownload;
  }

  @override
  set needDataDownload(bool value) {
    _$needDataDownloadAtom.reportWrite(value, super.needDataDownload, () {
      super.needDataDownload = value;
    });
  }

  final _$isBuildingPdfAtom = Atom(name: '_HomeScreenStore.isBuildingPdf');

  @override
  bool get isBuildingPdf {
    _$isBuildingPdfAtom.reportRead();
    return super.isBuildingPdf;
  }

  @override
  set isBuildingPdf(bool value) {
    _$isBuildingPdfAtom.reportWrite(value, super.isBuildingPdf, () {
      super.isBuildingPdf = value;
    });
  }

  final _$needSyncAtom = Atom(name: '_HomeScreenStore.needSync');

  @override
  int get needSync {
    _$needSyncAtom.reportRead();
    return super.needSync;
  }

  @override
  set needSync(int value) {
    _$needSyncAtom.reportWrite(value, super.needSync, () {
      super.needSync = value;
    });
  }

  final _$lastSyncAtom = Atom(name: '_HomeScreenStore.lastSync');

  @override
  String get lastSync {
    _$lastSyncAtom.reportRead();
    return super.lastSync;
  }

  @override
  set lastSync(String value) {
    _$lastSyncAtom.reportWrite(value, super.lastSync, () {
      super.lastSync = value;
    });
  }

  final _$cashInChartDataAtom = Atom(name: '_HomeScreenStore.cashInChartData');

  @override
  ObservableList<ChartData> get cashInChartData {
    _$cashInChartDataAtom.reportRead();
    return super.cashInChartData;
  }

  @override
  set cashInChartData(ObservableList<ChartData> value) {
    _$cashInChartDataAtom.reportWrite(value, super.cashInChartData, () {
      super.cashInChartData = value;
    });
  }

  final _$cashOutChartDataAtom =
      Atom(name: '_HomeScreenStore.cashOutChartData');

  @override
  ObservableList<ChartData> get cashOutChartData {
    _$cashOutChartDataAtom.reportRead();
    return super.cashOutChartData;
  }

  @override
  set cashOutChartData(ObservableList<ChartData> value) {
    _$cashOutChartDataAtom.reportWrite(value, super.cashOutChartData, () {
      super.cashOutChartData = value;
    });
  }

  final _$columnChartDataAtom = Atom(name: '_HomeScreenStore.columnChartData');

  @override
  ObservableList<ColumnChartData> get columnChartData {
    _$columnChartDataAtom.reportRead();
    return super.columnChartData;
  }

  @override
  set columnChartData(ObservableList<ColumnChartData> value) {
    _$columnChartDataAtom.reportWrite(value, super.columnChartData, () {
      super.columnChartData = value;
    });
  }

  final _$searchTermAtom = Atom(name: '_HomeScreenStore.searchTerm');

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  final _$filteredTransactionsAtom =
      Atom(name: '_HomeScreenStore.filteredTransactions');

  @override
  ObservableList<Transaction> get filteredTransactions {
    _$filteredTransactionsAtom.reportRead();
    return super.filteredTransactions;
  }

  @override
  set filteredTransactions(ObservableList<Transaction> value) {
    _$filteredTransactionsAtom.reportWrite(value, super.filteredTransactions,
        () {
      super.filteredTransactions = value;
    });
  }

  final _$userLogoutAsyncAction = AsyncAction('_HomeScreenStore.userLogout');

  @override
  Future<FunctionResponse> userLogout() {
    return _$userLogoutAsyncAction.run(() => super.userLogout());
  }

  final _$downloadAllDataAsyncAction =
      AsyncAction('_HomeScreenStore.downloadAllData');

  @override
  Future<void> downloadAllData(BuildContext context) {
    return _$downloadAllDataAsyncAction
        .run(() => super.downloadAllData(context));
  }

  final _$uploadAllDataAsyncAction =
      AsyncAction('_HomeScreenStore.uploadAllData');

  @override
  Future<void> uploadAllData() {
    return _$uploadAllDataAsyncAction.run(() => super.uploadAllData());
  }

  final _$isTutorialShownAsyncAction =
      AsyncAction('_HomeScreenStore.isTutorialShown');

  @override
  Future isTutorialShown() {
    return _$isTutorialShownAsyncAction.run(() => super.isTutorialShown());
  }

  final _$_HomeScreenStoreActionController =
      ActionController(name: '_HomeScreenStore');

  @override
  String selectedCurrency() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.selectedCurrency');
    try {
      return super.selectedCurrency();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? timeFilterIndicator() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.timeFilterIndicator');
    try {
      return super.timeFilterIndicator();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool filterIndicator() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.filterIndicator');
    try {
      return super.filterIndicator();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectedTransactionCategoryType(bool value) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.selectedTransactionCategoryType');
    try {
      return super.selectedTransactionCategoryType(value);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  CashCategory findCashCategoryById(int _id, bool _isCashIn) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.findCashCategoryById');
    try {
      return super.findCashCategoryById(_id, _isCashIn);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  PaymentMode findPaymentModeById(int _id) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.findPaymentModeById');
    try {
      return super.findPaymentModeById(_id);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTransactionDefaults(
      bool isCashIn1,
      DateTime? transactionDate1,
      TimeOfDay? transactionTime1,
      String? remarks,
      CashCategory? selectedCategory1,
      PaymentMode? selectedPaymentMode1,
      String? imagePath1) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.setTransactionDefaults');
    try {
      return super.setTransactionDefaults(
          isCashIn1,
          transactionDate1,
          transactionTime1,
          remarks,
          selectedCategory1,
          selectedPaymentMode1,
          imagePath1);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchTerm(String val) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.changeSearchTerm');
    try {
      return super.changeSearchTerm(val);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  FunctionResponse clearFilters() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBuildingPdfStatus(bool val) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.changeBuildingPdfStatus');
    try {
      return super.changeBuildingPdfStatus(val);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterTransactions() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.filterTransactions');
    try {
      return super.filterTransactions();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBookBalanceStatus(List<Transaction> _transactions) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.setBookBalanceStatus');
    try {
      return super.setBookBalanceStatus(_transactions);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  FunctionResponse findBalanceStatusByDate(String _date) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.findBalanceStatusByDate');
    try {
      return super.findBalanceStatusByDate(_date);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  double preparePieChartData(bool isCashIn) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.preparePieChartData');
    try {
      return super.preparePieChartData(isCashIn);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void prepareBarChart() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.prepareBarChart');
    try {
      return super.prepareBarChart();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeUploadingStatus(bool val) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.changeUploadingStatus');
    try {
      return super.changeUploadingStatus(val);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTutorialShown() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.setTutorialShown');
    try {
      return super.setTutorialShown();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearAllTransactions() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.clearAllTransactions');
    try {
      return super.clearAllTransactions();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearDownloadBookList() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.clearDownloadBookList');
    try {
      return super.clearDownloadBookList();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastSync() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.setLastSync');
    try {
      return super.setLastSync();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchAndSetTranasctions() {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction(
        name: '_HomeScreenStore.fetchAndSetTranasctions');
    try {
      return super.fetchAndSetTranasctions();
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
balance: ${balance},
totalCashIn: ${totalCashIn},
totalCashOut: ${totalCashOut},
checker: ${checker},
isUploading: ${isUploading},
isDownloadingAllData: ${isDownloadingAllData},
needDataDownload: ${needDataDownload},
isBuildingPdf: ${isBuildingPdf},
needSync: ${needSync},
lastSync: ${lastSync},
cashInChartData: ${cashInChartData},
cashOutChartData: ${cashOutChartData},
columnChartData: ${columnChartData},
searchTerm: ${searchTerm},
filteredTransactions: ${filteredTransactions}
    ''';
  }
}
