// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_mode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentModeStore on _PaymentModeStore, Store {
  final _$paymentModeListAtom = Atom(name: '_PaymentModeStore.paymentModeList');

  @override
  ObservableList<PaymentMode> get paymentModeList {
    _$paymentModeListAtom.reportRead();
    return super.paymentModeList;
  }

  @override
  set paymentModeList(ObservableList<PaymentMode> value) {
    _$paymentModeListAtom.reportWrite(value, super.paymentModeList, () {
      super.paymentModeList = value;
    });
  }

  final _$selectedPaymentModeAtom =
      Atom(name: '_PaymentModeStore.selectedPaymentMode');

  @override
  PaymentMode? get selectedPaymentMode {
    _$selectedPaymentModeAtom.reportRead();
    return super.selectedPaymentMode;
  }

  @override
  set selectedPaymentMode(PaymentMode? value) {
    _$selectedPaymentModeAtom.reportWrite(value, super.selectedPaymentMode, () {
      super.selectedPaymentMode = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PaymentModeStore.isLoading');

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

  final _$fetchAndSetPaymentModesAsyncAction =
      AsyncAction('_PaymentModeStore.fetchAndSetPaymentModes');

  @override
  Future<void> fetchAndSetPaymentModes() {
    return _$fetchAndSetPaymentModesAsyncAction
        .run(() => super.fetchAndSetPaymentModes());
  }

  final _$addPaymentModeAsyncAction =
      AsyncAction('_PaymentModeStore.addPaymentMode');

  @override
  Future<FunctionResponse> addPaymentMode(String _val) {
    return _$addPaymentModeAsyncAction.run(() => super.addPaymentMode(_val));
  }

  final _$editPaymentModeAsyncAction =
      AsyncAction('_PaymentModeStore.editPaymentMode');

  @override
  Future<FunctionResponse> editPaymentMode(PaymentMode _paymentMode) {
    return _$editPaymentModeAsyncAction
        .run(() => super.editPaymentMode(_paymentMode));
  }

  final _$deletePaymentModeAsyncAction =
      AsyncAction('_PaymentModeStore.deletePaymentMode');

  @override
  Future<FunctionResponse> deletePaymentMode(PaymentMode _paymentMode) {
    return _$deletePaymentModeAsyncAction
        .run(() => super.deletePaymentMode(_paymentMode));
  }

  final _$_PaymentModeStoreActionController =
      ActionController(name: '_PaymentModeStore');

  @override
  void changeIsLoading(bool _val) {
    final _$actionInfo = _$_PaymentModeStoreActionController.startAction(
        name: '_PaymentModeStore.changeIsLoading');
    try {
      return super.changeIsLoading(_val);
    } finally {
      _$_PaymentModeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedPaymentMode(PaymentMode? _val) {
    final _$actionInfo = _$_PaymentModeStoreActionController.startAction(
        name: '_PaymentModeStore.setSelectedPaymentMode');
    try {
      return super.setSelectedPaymentMode(_val);
    } finally {
      _$_PaymentModeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  PaymentMode findPaymentModeById(int _id) {
    final _$actionInfo = _$_PaymentModeStoreActionController.startAction(
        name: '_PaymentModeStore.findPaymentModeById');
    try {
      return super.findPaymentModeById(_id);
    } finally {
      _$_PaymentModeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paymentModeList: ${paymentModeList},
selectedPaymentMode: ${selectedPaymentMode},
isLoading: ${isLoading}
    ''';
  }
}
