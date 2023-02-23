import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/stores/book_store.dart';

import '../helpers/api_helpers/auth_api_helper.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:mobx/mobx.dart';

import '../service_locator.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  late final HomeScreenStore _homeScreenStore;
  late final BookStore _bookStore;
  late final AuthApiHelper _authApiHelper;
  late SharedPreferencesHelper sharedPreferencesHelper;

  _AuthStore(this._homeScreenStore, this._bookStore, this._authApiHelper,
      this.sharedPreferencesHelper);

  String phoneNumber = '';
  String countryCode = '';
  String countryISOCode = '';

  @observable
  bool isLogingIn = false;
  @observable
  bool passwordIsVisible = false;

  @observable
  String _userId = '';

  @action
  void togglepasswordIsVisible() {
    passwordIsVisible = !passwordIsVisible;
  }

  @action
  void changeLogingInStatus(bool val) {
    isLogingIn = val;
    // print('changed is loging in to $isLogingIn');
  }

  @action
  Future<FunctionResponse> tryLogin(String password) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      final AuthResponse? _authResponse = await _authApiHelper.tryLoginApi(
          username: phoneNumber, country: countryCode, password: password);

      if (_authResponse != null) {
        print('------- Verification Status ${_authResponse.isVerified}');
        _fResponse =
            await sharedPreferencesHelper.saveNewUser(_authResponse.toJson());

        if (_fResponse.success) {
          if (_authResponse.isVerified == false) {
            _fResponse.success = false;
            _fResponse.message = 'Please Verify your OTP';
            await resendOtp();
          } else {
            _fResponse = await sharedPreferencesHelper.verifyUser();
            print('verified user : ${_fResponse.message}');

            // if save to sharedPreferences is succussful
            if (_fResponse.success) {
              print(_fResponse.message);
              // _bookStore.selectedBook = null;

              _homeScreenStore.needDataDownload = true;
              _bookStore.selectedBook = null;
              _bookStore.downloadedBookList.clear();
              _fResponse.success = true;
              _fResponse.message = 'Login successful';
            } else {
              _fResponse.message = 'Could not save User';
            }
          }
        }
      } else {
        _fResponse.message = 'Login Failed. Check your Phone and Password.';
      }
    } catch (e) {
      _fResponse.message = 'Error logging in : $e';
    }
    return _fResponse;
  }

  @action
  Future<FunctionResponse> checkPhoneIfRegistered(
      String phone, String country) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      final FunctionResponse? functionResponse = await _authApiHelper
          .checkIfRegistered(username: phone, country: country);

      if (functionResponse != null) {
        if (functionResponse.success) {
          _fResponse.success = true;
        } else {
          _fResponse.success = false;
        }
      }
    } catch (e) {
      _fResponse.message = 'Error checking if user registered';
    }
    return _fResponse;
  }

  @action
  Future<FunctionResponse> resendOtp() async {
    FunctionResponse _fResponse = FunctionResponse();

    isLogingIn = true;

    try {
      _fResponse = await _authApiHelper.resendOtpApi();
    } catch (e) {
      _fResponse.message = 'Error resending OTP : $e';
    }
    isLogingIn = false;

    return _fResponse;
  }

  @action
  Future<FunctionResponse> resetPassword(
      String phone, String countryCode) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      print('phone : $phone');
      print('countryCode : $countryCode');
      _fResponse = await _authApiHelper.resetPassword(phone, countryCode);
      if (_fResponse.success) {
        _userId = _fResponse.data;
      }
    } catch (e) {
      _fResponse.message = 'Error resting password : $e';
    }

    return _fResponse;
  }

  @action
  Future<FunctionResponse> verifyResetPasswordOtp(String otp) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      _fResponse = await _authApiHelper.verifyChangePasswordOtp(otp, _userId);
      if (_fResponse.success) {
        _fResponse.message = 'Otp Verified';
      }
    } catch (e) {
      _fResponse.message = 'Error verifying reset password OTP : $e';
    }

    return _fResponse;
  }

  @action
  Future<FunctionResponse> changePassword(String password) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      _fResponse = await _authApiHelper.changePassword(password, _userId);
    } catch (e) {
      _fResponse.message = 'Error resting password : $e';
    }

    return _fResponse;
  }
}
