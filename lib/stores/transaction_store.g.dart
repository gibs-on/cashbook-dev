// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionStore on _TransactionStore, Store {
  Computed<dynamic>? _$bookListComputed;

  @override
  dynamic get bookList =>
      (_$bookListComputed ??= Computed<dynamic>(() => super.bookList,
              name: '_TransactionStore.bookList'))
          .value;
  Computed<dynamic>? _$transactionsComputed;

  @override
  dynamic get transactions =>
      (_$transactionsComputed ??= Computed<dynamic>(() => super.transactions,
              name: '_TransactionStore.transactions'))
          .value;

  final _$isLoadingAtom = Atom(name: '_TransactionStore.isLoading');

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

  final _$isFetchingAtom = Atom(name: '_TransactionStore.isFetching');

  @override
  bool get isFetching {
    _$isFetchingAtom.reportRead();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.reportWrite(value, super.isFetching, () {
      super.isFetching = value;
    });
  }

  final _$timeFilterAtom = Atom(name: '_TransactionStore.timeFilter');

  @override
  TimeFilter? get timeFilter {
    _$timeFilterAtom.reportRead();
    return super.timeFilter;
  }

  @override
  set timeFilter(TimeFilter? value) {
    _$timeFilterAtom.reportWrite(value, super.timeFilter, () {
      super.timeFilter = value;
    });
  }

  final _$timeFilterSingleDateAtom =
      Atom(name: '_TransactionStore.timeFilterSingleDate');

  @override
  DateTime get timeFilterSingleDate {
    _$timeFilterSingleDateAtom.reportRead();
    return super.timeFilterSingleDate;
  }

  @override
  set timeFilterSingleDate(DateTime value) {
    _$timeFilterSingleDateAtom.reportWrite(value, super.timeFilterSingleDate,
        () {
      super.timeFilterSingleDate = value;
    });
  }

  final _$timeFilterRangeStartAtom =
      Atom(name: '_TransactionStore.timeFilterRangeStart');

  @override
  DateTime get timeFilterRangeStart {
    _$timeFilterRangeStartAtom.reportRead();
    return super.timeFilterRangeStart;
  }

  @override
  set timeFilterRangeStart(DateTime value) {
    _$timeFilterRangeStartAtom.reportWrite(value, super.timeFilterRangeStart,
        () {
      super.timeFilterRangeStart = value;
    });
  }

  final _$timeFilterRangeEndAtom =
      Atom(name: '_TransactionStore.timeFilterRangeEnd');

  @override
  DateTime get timeFilterRangeEnd {
    _$timeFilterRangeEndAtom.reportRead();
    return super.timeFilterRangeEnd;
  }

  @override
  set timeFilterRangeEnd(DateTime value) {
    _$timeFilterRangeEndAtom.reportWrite(value, super.timeFilterRangeEnd, () {
      super.timeFilterRangeEnd = value;
    });
  }

  final _$timeFilterIndicatorAtom =
      Atom(name: '_TransactionStore.timeFilterIndicator');

  @override
  String? get timeFilterIndicator {
    _$timeFilterIndicatorAtom.reportRead();
    return super.timeFilterIndicator;
  }

  @override
  set timeFilterIndicator(String? value) {
    _$timeFilterIndicatorAtom.reportWrite(value, super.timeFilterIndicator, () {
      super.timeFilterIndicator = value;
    });
  }

  final _$generalFilterAtom = Atom(name: '_TransactionStore.generalFilter');

  @override
  GeneralFilter get generalFilter {
    _$generalFilterAtom.reportRead();
    return super.generalFilter;
  }

  @override
  set generalFilter(GeneralFilter value) {
    _$generalFilterAtom.reportWrite(value, super.generalFilter, () {
      super.generalFilter = value;
    });
  }

  final _$entryTypeFilterAtom = Atom(name: '_TransactionStore.entryTypeFilter');

  @override
  EntryTypeFilter get entryTypeFilter {
    _$entryTypeFilterAtom.reportRead();
    return super.entryTypeFilter;
  }

  @override
  set entryTypeFilter(EntryTypeFilter value) {
    _$entryTypeFilterAtom.reportWrite(value, super.entryTypeFilter, () {
      super.entryTypeFilter = value;
    });
  }

  final _$categoryFilterAtom = Atom(name: '_TransactionStore.categoryFilter');

  @override
  CashCategory? get categoryFilter {
    _$categoryFilterAtom.reportRead();
    return super.categoryFilter;
  }

  @override
  set categoryFilter(CashCategory? value) {
    _$categoryFilterAtom.reportWrite(value, super.categoryFilter, () {
      super.categoryFilter = value;
    });
  }

  final _$paymentFilterAtom = Atom(name: '_TransactionStore.paymentFilter');

  @override
  PaymentMode? get paymentFilter {
    _$paymentFilterAtom.reportRead();
    return super.paymentFilter;
  }

  @override
  set paymentFilter(PaymentMode? value) {
    _$paymentFilterAtom.reportWrite(value, super.paymentFilter, () {
      super.paymentFilter = value;
    });
  }

  final _$filterIndicatorAtom = Atom(name: '_TransactionStore.filterIndicator');

  @override
  bool get filterIndicator {
    _$filterIndicatorAtom.reportRead();
    return super.filterIndicator;
  }

  @override
  set filterIndicator(bool value) {
    _$filterIndicatorAtom.reportWrite(value, super.filterIndicator, () {
      super.filterIndicator = value;
    });
  }

  final _$selectedCurrencyAtom =
      Atom(name: '_TransactionStore.selectedCurrency');

  @override
  String get selectedCurrency {
    _$selectedCurrencyAtom.reportRead();
    return super.selectedCurrency;
  }

  @override
  set selectedCurrency(String value) {
    _$selectedCurrencyAtom.reportWrite(value, super.selectedCurrency, () {
      super.selectedCurrency = value;
    });
  }

  final _$currentRemarkAtom = Atom(name: '_TransactionStore.currentRemark');

  @override
  String get currentRemark {
    _$currentRemarkAtom.reportRead();
    return super.currentRemark;
  }

  @override
  set currentRemark(String value) {
    _$currentRemarkAtom.reportWrite(value, super.currentRemark, () {
      super.currentRemark = value;
    });
  }

  final _$transactionDateAtom = Atom(name: '_TransactionStore.transactionDate');

  @override
  DateTime get transactionDate {
    _$transactionDateAtom.reportRead();
    return super.transactionDate;
  }

  @override
  set transactionDate(DateTime value) {
    _$transactionDateAtom.reportWrite(value, super.transactionDate, () {
      super.transactionDate = value;
    });
  }

  final _$transactionTimeAtom = Atom(name: '_TransactionStore.transactionTime');

  @override
  TimeOfDay get transactionTime {
    _$transactionTimeAtom.reportRead();
    return super.transactionTime;
  }

  @override
  set transactionTime(TimeOfDay value) {
    _$transactionTimeAtom.reportWrite(value, super.transactionTime, () {
      super.transactionTime = value;
    });
  }

  final _$imagePathAtom = Atom(name: '_TransactionStore.imagePath');

  @override
  String? get imagePath {
    _$imagePathAtom.reportRead();
    return super.imagePath;
  }

  @override
  set imagePath(String? value) {
    _$imagePathAtom.reportWrite(value, super.imagePath, () {
      super.imagePath = value;
    });
  }

  final _$_transactionsAtom = Atom(name: '_TransactionStore._transactions');

  @override
  ObservableList<transaction.Transaction> get _transactions {
    _$_transactionsAtom.reportRead();
    return super._transactions;
  }

  @override
  set _transactions(ObservableList<transaction.Transaction> value) {
    _$_transactionsAtom.reportWrite(value, super._transactions, () {
      super._transactions = value;
    });
  }

  final _$changeSelectedCurrencyAsyncAction =
      AsyncAction('_TransactionStore.changeSelectedCurrency');

  @override
  Future<void> changeSelectedCurrency(String? val) {
    return _$changeSelectedCurrencyAsyncAction
        .run(() => super.changeSelectedCurrency(val!));
  }

  final _$getSelectedCurrencyAsyncAction =
      AsyncAction('_TransactionStore.getSelectedCurrency');

  @override
  Future<void> getSelectedCurrency() {
    return _$getSelectedCurrencyAsyncAction
        .run(() => super.getSelectedCurrency());
  }

  final _$fetchAndSetTransactionsAsyncAction =
      AsyncAction('_TransactionStore.fetchAndSetTransactions');

  @override
  Future<void> fetchAndSetTransactions() {
    return _$fetchAndSetTransactionsAsyncAction
        .run(() => super.fetchAndSetTransactions());
  }

  final _$addTransactionAsyncAction =
      AsyncAction('_TransactionStore.addTransaction');

  @override
  Future<FunctionResponse> addTransaction(
      {required transaction.Transaction formData, bool isCashIn = true}) {
    return _$addTransactionAsyncAction.run(
        () => super.addTransaction(formData: formData, isCashIn: isCashIn));
  }

  final _$editTransactionAsyncAction =
      AsyncAction('_TransactionStore.editTransaction');

  @override
  Future<FunctionResponse> editTransaction(
      {required transaction.Transaction formData}) {
    return _$editTransactionAsyncAction
        .run(() => super.editTransaction(formData: formData));
  }

  final _$deleteTransactionAsyncAction =
      AsyncAction('_TransactionStore.deleteTransaction');

  @override
  Future<void> deleteTransaction(transaction.Transaction transaction) {
    return _$deleteTransactionAsyncAction
        .run(() => super.deleteTransaction(transaction));
  }

  final _$_TransactionStoreActionController =
      ActionController(name: '_TransactionStore');

  @override
  void changeTimeFilter(TimeFilter? val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.changeTimeFilter');
    try {
      return super.changeTimeFilter(val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changetimeFilterSingleDate(DateTime? val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.changetimeFilterSingleDate');
    try {
      return super.changetimeFilterSingleDate(val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changetimeFilterRange(DateTime? val, bool isStartDate) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.changetimeFilterRange');
    try {
      return super.changetimeFilterRange(val, isStartDate);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeGeneralFilter(GeneralFilter val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.changeGeneralFilter');
    try {
      return super.changeGeneralFilter(val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEntryTypeFilter(EntryTypeFilter? val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.changeEntryTypeFilter');
    try {
      return super.changeEntryTypeFilter(val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCategoryFilter(CashCategory? val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.changeCategoryFilter');
    try {
      return super.changeCategoryFilter(val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePaymentFilter(PaymentMode? val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.changePaymentFilter');
    try {
      return super.changePaymentFilter(val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterIndicator() {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.setFilterIndicator');
    try {
      return super.setFilterIndicator();
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTransactions() {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.clearTransactions');
    try {
      return super.clearTransactions();
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRemaks(String remarks) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.updateRemaks');
    try {
      return super.updateRemaks(remarks);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDefaults(
      bool isCashIn1,
      DateTime? transactionDate1,
      TimeOfDay? transactionTime1,
      String? remarks,
      CashCategory? selectedCategory1,
      PaymentMode? selectedPaymentMode1,
      String? imagePath1) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.setDefaults');
    try {
      return super.setDefaults(isCashIn1, transactionDate1, transactionTime1,
          remarks, selectedCategory1, selectedPaymentMode1, imagePath1);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImagePath(String? val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.setImagePath');
    try {
      return super.setImagePath(val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImage() {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.removeImage');
    try {
      return super.removeImage();
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTransactionDate(DateTime? _val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.setTransactionDate');
    try {
      return super.setTransactionDate(_val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTransactionTime(TimeOfDay? val) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.setTransactionTime');
    try {
      return super.setTransactionTime(val);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isFetching: ${isFetching},
timeFilter: ${timeFilter},
timeFilterSingleDate: ${timeFilterSingleDate},
timeFilterRangeStart: ${timeFilterRangeStart},
timeFilterRangeEnd: ${timeFilterRangeEnd},
timeFilterIndicator: ${timeFilterIndicator},
generalFilter: ${generalFilter},
entryTypeFilter: ${entryTypeFilter},
categoryFilter: ${categoryFilter},
paymentFilter: ${paymentFilter},
filterIndicator: ${filterIndicator},
selectedCurrency: ${selectedCurrency},
currentRemark: ${currentRemark},
transactionDate: ${transactionDate},
transactionTime: ${transactionTime},
imagePath: ${imagePath},
bookList: ${bookList},
transactions: ${transactions}
    ''';
  }
}
