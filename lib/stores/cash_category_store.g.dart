// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CashCategoryStore on _CashCategoryStore, Store {
  final _$selectedTransactionCategoryTypeAtom =
      Atom(name: '_CashCategoryStore.selectedTransactionCategoryType');

  @override
  bool get selectedTransactionCategoryType {
    _$selectedTransactionCategoryTypeAtom.reportRead();
    return super.selectedTransactionCategoryType;
  }

  @override
  set selectedTransactionCategoryType(bool value) {
    _$selectedTransactionCategoryTypeAtom
        .reportWrite(value, super.selectedTransactionCategoryType, () {
      super.selectedTransactionCategoryType = value;
    });
  }

  final _$selectedCategoryAtom =
      Atom(name: '_CashCategoryStore.selectedCategory');

  @override
  CashCategory? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(CashCategory? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$cashInCategoryListAtom =
      Atom(name: '_CashCategoryStore.cashInCategoryList');

  @override
  ObservableList<CashCategory> get cashInCategoryList {
    _$cashInCategoryListAtom.reportRead();
    return super.cashInCategoryList;
  }

  @override
  set cashInCategoryList(ObservableList<CashCategory> value) {
    _$cashInCategoryListAtom.reportWrite(value, super.cashInCategoryList, () {
      super.cashInCategoryList = value;
    });
  }

  final _$cashOutCategoryListAtom =
      Atom(name: '_CashCategoryStore.cashOutCategoryList');

  @override
  ObservableList<CashCategory> get cashOutCategoryList {
    _$cashOutCategoryListAtom.reportRead();
    return super.cashOutCategoryList;
  }

  @override
  set cashOutCategoryList(ObservableList<CashCategory> value) {
    _$cashOutCategoryListAtom.reportWrite(value, super.cashOutCategoryList, () {
      super.cashOutCategoryList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CashCategoryStore.isLoading');

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

  final _$fetchAndSetCashCategoriesAsyncAction =
      AsyncAction('_CashCategoryStore.fetchAndSetCashCategories');

  @override
  Future<void> fetchAndSetCashCategories() {
    return _$fetchAndSetCashCategoriesAsyncAction
        .run(() => super.fetchAndSetCashCategories());
  }

  final _$addCategoryAsyncAction =
      AsyncAction('_CashCategoryStore.addCategory');

  @override
  Future<FunctionResponse> addCategory(String _val, bool _isCashIn) {
    return _$addCategoryAsyncAction
        .run(() => super.addCategory(_val, _isCashIn));
  }

  final _$editCategoryAsyncAction =
      AsyncAction('_CashCategoryStore.editCategory');

  @override
  Future<FunctionResponse> editCategory(
      CashCategory _category, bool _isCashIn) {
    return _$editCategoryAsyncAction
        .run(() => super.editCategory(_category, _isCashIn));
  }

  final _$deleteCategoryAsyncAction =
      AsyncAction('_CashCategoryStore.deleteCategory');

  @override
  Future<FunctionResponse> deleteCategory(
      CashCategory _category, bool _isCashIn) {
    return _$deleteCategoryAsyncAction
        .run(() => super.deleteCategory(_category, _isCashIn));
  }

  final _$_CashCategoryStoreActionController =
      ActionController(name: '_CashCategoryStore');

  @override
  void changeIsLoading(bool _val) {
    final _$actionInfo = _$_CashCategoryStoreActionController.startAction(
        name: '_CashCategoryStore.changeIsLoading');
    try {
      return super.changeIsLoading(_val);
    } finally {
      _$_CashCategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(CashCategory val) {
    final _$actionInfo = _$_CashCategoryStoreActionController.startAction(
        name: '_CashCategoryStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(val);
    } finally {
      _$_CashCategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedTransactionCategoryType(bool val) {
    final _$actionInfo = _$_CashCategoryStoreActionController.startAction(
        name: '_CashCategoryStore.changeSelectedTransactionCategoryType');
    try {
      return super.changeSelectedTransactionCategoryType(val);
    } finally {
      _$_CashCategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  CashCategory findCashCategoryById(int _id, bool _isCashIn) {
    final _$actionInfo = _$_CashCategoryStoreActionController.startAction(
        name: '_CashCategoryStore.findCashCategoryById');
    try {
      return super.findCashCategoryById(_id, _isCashIn);
    } finally {
      _$_CashCategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTransactionCategoryType: ${selectedTransactionCategoryType},
selectedCategory: ${selectedCategory},
cashInCategoryList: ${cashInCategoryList},
cashOutCategoryList: ${cashOutCategoryList},
isLoading: ${isLoading}
    ''';
  }
}
