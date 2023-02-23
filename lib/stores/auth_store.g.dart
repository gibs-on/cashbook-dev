// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$isLogingInAtom = Atom(name: '_AuthStore.isLogingIn');

  @override
  bool get isLogingIn {
    _$isLogingInAtom.reportRead();
    return super.isLogingIn;
  }

  @override
  set isLogingIn(bool value) {
    _$isLogingInAtom.reportWrite(value, super.isLogingIn, () {
      super.isLogingIn = value;
    });
  }

  final _$passwordIsVisibleAtom = Atom(name: '_AuthStore.passwordIsVisible');

  @override
  bool get passwordIsVisible {
    _$passwordIsVisibleAtom.reportRead();
    return super.passwordIsVisible;
  }

  @override
  set passwordIsVisible(bool value) {
    _$passwordIsVisibleAtom.reportWrite(value, super.passwordIsVisible, () {
      super.passwordIsVisible = value;
    });
  }

  final _$_userIdAtom = Atom(name: '_AuthStore._userId');

  @override
  String get _userId {
    _$_userIdAtom.reportRead();
    return super._userId;
  }

  @override
  set _userId(String value) {
    _$_userIdAtom.reportWrite(value, super._userId, () {
      super._userId = value;
    });
  }

  final _$tryLoginAsyncAction = AsyncAction('_AuthStore.tryLogin');

  @override
  Future<FunctionResponse> tryLogin(String password) {
    return _$tryLoginAsyncAction.run(() => super.tryLogin(password));
  }

  final _$checkPhoneIfRegisteredAsyncAction =
      AsyncAction('_AuthStore.checkPhoneIfRegistered');

  @override
  Future<FunctionResponse> checkPhoneIfRegistered(
      String phone, String country) {
    return _$checkPhoneIfRegisteredAsyncAction
        .run(() => super.checkPhoneIfRegistered(phone, country));
  }

  final _$resendOtpAsyncAction = AsyncAction('_AuthStore.resendOtp');

  @override
  Future<FunctionResponse> resendOtp() {
    return _$resendOtpAsyncAction.run(() => super.resendOtp());
  }

  final _$resetPasswordAsyncAction = AsyncAction('_AuthStore.resetPassword');

  @override
  Future<FunctionResponse> resetPassword(String phone, String countryCode) {
    return _$resetPasswordAsyncAction
        .run(() => super.resetPassword(phone, countryCode));
  }

  final _$verifyResetPasswordOtpAsyncAction =
      AsyncAction('_AuthStore.verifyResetPasswordOtp');

  @override
  Future<FunctionResponse> verifyResetPasswordOtp(String otp) {
    return _$verifyResetPasswordOtpAsyncAction
        .run(() => super.verifyResetPasswordOtp(otp));
  }

  final _$changePasswordAsyncAction = AsyncAction('_AuthStore.changePassword');

  @override
  Future<FunctionResponse> changePassword(String password) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(password));
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void togglepasswordIsVisible() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.togglepasswordIsVisible');
    try {
      return super.togglepasswordIsVisible();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLogingInStatus(bool val) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.changeLogingInStatus');
    try {
      return super.changeLogingInStatus(val);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogingIn: ${isLogingIn},
passwordIsVisible: ${passwordIsVisible}
    ''';
  }
}
