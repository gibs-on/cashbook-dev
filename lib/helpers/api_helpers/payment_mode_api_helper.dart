import 'dart:convert';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/models/payment_mode.dart';
import './auth_api_helper.dart';
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/models/api_response/payment_modes_response.dart';

import '../../service_locator.dart';

class PaymentModeApiHelper {
  late AuthApiHelper _authApiHelper;
  late DbHelper _dbHelper;
  PaymentModeApiHelper(
    this._authApiHelper,
    this._dbHelper,
  );

  Future<void> getPaymentModes() async {
    print('getting Payment modes from API');

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return;
      }

      try {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response =
            await _apiClient.apiCashBookGetPaymentmodesBusinessidGet(
          businessid: _userData.businessId,
        );

        List<PaymentModesResponse> _paymentModes = [];

        if (_response.isSuccessful) {
          var _responseData = _response.body;
          // print(_responseData);

          for (var _mode in _responseData) {
            // print(_mode);
            _mode = jsonEncode(_mode);
            _paymentModes.add(paymentModesResponseFromJson(_mode));
          }
          for (var _mode in _paymentModes) {
            try {
              await _dbHelper.addDbPaymentMode(
                id: _mode.id!,
                title: _mode.name ?? 'undefined',
              );
            } catch (e) {
              print('Error adding payment mode from api to database : $e');
            }
          }
        } else {
          print(
              'Error fetching Payment Modes : ${_response.base.reasonPhrase}');
        }
      } catch (e) {
        print('Error occured calling api for Payment Modes: $e');
      }
    } catch (e) {
      print('Error getting Payment Modes from api');
    }
  }

  Future<FunctionResponse> uploadSinglePaymentMode(String _title) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData != null) {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient.apiCashBookAddPaymentModePost(
            body: PaymentmodeAdd(
          businessId: _userData.businessId,
          name: _title,
        ));
        if (_response.isSuccessful && _response.body['success']) {
          final String _modeId = _response.body['id'].toString();
          _fResponse.data = int.tryParse(_modeId);
          _fResponse.success = true;
          _fResponse.message = 'Payment mode uploaded successflly';
        } else {
          _fResponse.success = false;
          _fResponse.message = 'Failed upload. Please try again';
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error Uploading PaymentModes : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> editPaymentModeApi(PaymentMode _paymentMode) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData != null) {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient.apiCashBookUpdatePaymentModePatch(
            body: PaymentmodeEdit(
          paymentmodeId: _paymentMode.id,
          businessId: _userData.businessId,
          name: _paymentMode.title,
        ));
        if (_response.isSuccessful && _response.body['success']) {
          _fResponse.success = true;
          _fResponse.message = 'Payment Mode Edited Successfully';
        } else {
          _fResponse.message = 'Failed to edit. Please try again';
        }
      }
    } catch (e) {
      _fResponse.message = 'Error Uploading PaymentModes : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> deletePaymentModeApi(int _id) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData != null) {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient
            .apiCashBookDeletePaymentModeBusinessIdPaymentmodeIdDelete(
          businessId: _userData.businessId,
          paymentmodeId: _id,
        );

        if (_response.isSuccessful && _response.body['success']) {
          _fResponse.success = true;
          _fResponse.message = 'Payment Mode deleted Successfully';
        } else {
          _fResponse.message = 'Api did not delete Payment Mode';
        }
      }
    } catch (e) {
      _fResponse.message = 'Error deleting PaymentMode : $e';
    }

    return _fResponse;
  }
}
