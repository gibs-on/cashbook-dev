import 'package:cashbook/api_utils/api_provider.dart';
import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:drift/sqlite_keywords.dart';

import '../../service_locator.dart';

class AuthApiHelper {
  late final SharedPreferencesHelper _sharedPreferencesHelper;
  AuthApiHelper(
    this._sharedPreferencesHelper,
  );

  Future<ApiClient> getNewToken() async {
    final ApiClient _apiClient = getIt<ApiProvider>().apiClient;
    await getIt<ApiProvider>().initAgain();
    return _apiClient;
  }

  Future<FunctionResponse> resendOtpApi() async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        _fResponse.message = 'User Unauthorized';
      } else {
        ApiClient _apiClient = await getNewToken();
        _apiClient = await getNewToken();
        _apiClient = await getNewToken();
        final _response = await _apiClient.apiAccountResendOTPUserIdPost(
            userId: _userData.userId);

        if (_response.isSuccessful && _response.body?['success'] == true) {
          _fResponse.message = 'OTP was sent again';
          _fResponse.success = true;
        } else {
          _fResponse.message =
              'Error : ${_response.body['errordesc'] ?? 'Could not send OTP'}';
        }
      }
    } catch (e) {
      _fResponse.message = 'Error resending OTP : $e';
    }

    return _fResponse;
  }

  Future<AuthResponse?> getCurrentUser() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    _fResponse = await _sharedPreferencesHelper.getCurrentUser();
    return _fResponse.data;
  }

  Future<AuthResponse?> tryLoginApi(
      {required String username,
      required String country,
      required String password}) async {
    try {
      final _response = await getIt<ApiProvider>().apiClient.apiAuthLoginPost(
            body: TenziBookLogin(
              username: username,
              countrycode: country,
              password: password,
            ),
          );

      final _responseData = _response.body as Map<String, dynamic>;

      if (_response.isSuccessful && _responseData['success'] == true) {
        print('--- Login was successful');

        //convert response into authResponse Object
        final _authResponse =
            AuthResponse.fromJson(_response.body as Map<String, dynamic>);
        return _authResponse;
      } else {
        print('${_responseData['error']}');
      }
    } catch (e) {
      print('Error logging in with Api : $e');
      rethrow;
      return null;
    }
  }

  Future<FunctionResponse?> checkIfRegistered(
      {required String username, required String country}) async {
    try {
      FunctionResponse functionResponse = getIt<FunctionResponse>();

      final _response =
          await getIt<ApiProvider>().apiClient.apiAuthValidatePhonePost(
                body: ValidateDetails(
                  phonenumber: username,
                  countryCode: country,
                ),
              );

      final _responseData = _response.body as Map<String, dynamic>;

      if (_response.isSuccessful && _responseData['registered'] == true) {
        print('--- User is already registered. move to login');

        //convert response into authResponse Object
        functionResponse.success = true;
        return functionResponse;
      } else {
        functionResponse.success = false;
        return functionResponse;
      }
    } catch (e) {
      print('Error logging in with Api : $e');
      rethrow;

      return null;
    }
  }

  Future<FunctionResponse> resetPassword(
      String phone, String countryCode) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await getCurrentUser();

      //if userData is null, user is not authenticated. So, return

      ApiClient _apiClient = await getNewToken();
      _apiClient = await getNewToken();
      final _response = await _apiClient.apiAuthResetPasswordPost(
        body: ResetPassword(countrycode: countryCode, phonenumber: phone),
      );

      if (_response.isSuccessful && _response.body?['success'] == true) {
        fResponse.message = 'OTP sent to your phone';
        fResponse.success = true;
        fResponse.data = _response.body['userId'];
      } else {
        fResponse.message =
            'Error : ${_response.body['errordesc'] ?? 'Could not send OTP'}';
      }
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error reseting password : $e';
    }
    return fResponse;
  }

  Future<FunctionResponse> verifyChangePasswordOtp(
      String otp, String userId) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await getCurrentUser();

      ApiClient _apiClient = await getNewToken();
      _apiClient = await getNewToken();
      final _response = await _apiClient.apiAuthVerifyChangepasswordOTPPost(
        body: VerifyChangepasswordOTP(otp: otp, userId: userId),
      );

      if (_response.isSuccessful &&
          _response.body?.success == true &&
          _response.body?.errordesc == 'approved') {
        fResponse.message = 'Otp verified';
        fResponse.success = true;
      } else {
        fResponse.message =
            'Error : ${_response.body?.errordesc ?? 'Could not verify OTP'}';
      }
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error verifying OTP : $escapeIfNeeded(s)';
    }
    return fResponse;
  }

  Future<FunctionResponse> changePassword(
      String password, String userId) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await getCurrentUser();

      //if userData is null, user is not authenticated. So, return

      ApiClient _apiClient = await getNewToken();
      _apiClient = await getNewToken();
      final _response = await _apiClient.apiAuthChangePasswordPost(
        body: ChangePassword(newpin: password, userId: userId),
      );

      if (_response.isSuccessful) {
        fResponse.message = 'Change password successful';
        fResponse.success = true;
      } else {
        fResponse.message = 'Error : Could not change password';
      }
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error changing password';
    }
    return fResponse;
  }
}
