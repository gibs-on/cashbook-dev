import 'dart:convert';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/db/database.dart' as db;
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/models/api_response/remarks_response.dart';

import '../../service_locator.dart';
import '../db_helper.dart';
import 'auth_api_helper.dart';

class RemarksApiHelper {
  final AuthApiHelper _authApiHelper;
  final DbHelper _dbHelper;
  RemarksApiHelper(
    this._authApiHelper,
    this._dbHelper,
  );
  Future<FunctionResponse> getRemarksApi(List<int> bookIdList) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    print('Getting remarks ');
    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();
      print('before auth');
      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        fResponse.message = 'User not authorized';
        return fResponse;
      }
      print('after auth');

      for (int bookId in bookIdList) {
        print('Getting remarks for book $bookId');
        fResponse = await _downloadRemarks(bookId, _userData, true);
        fResponse = await _downloadRemarks(bookId, _userData, false);
      }
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error getting remarks from api : $e';
    }
    return fResponse;
  }

  Future<FunctionResponse> _downloadRemarks(
      int bookId, AuthResponse _userData, bool isCashIn) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();
    try {
      ApiClient _apiClient = await _authApiHelper.getNewToken();
      final _response = await _apiClient.apiCashBookGetCashbookRemarksPost(
          body: CashbookRemarksQuery(
        businessId: _userData.businessId,
        bookId: bookId,
        ledgerbookType: isCashIn ? CashbookType.cashin : CashbookType.cashout,
      ));

      List<RemarksResponse> _remarks = [];

      if (_response.isSuccessful) {
        var _responseData = _response.body;
        // print(_responseData);
        final remarkResponse = jsonEncode(_responseData);
        _remarks = remarksResponseFromJson(remarkResponse);
        print('parsed remarks ${_remarks}');

        for (var _remark in _remarks) {
          fResponse = await _dbHelper.addDbRemarks(
            id: _remark.id,
            bookId: bookId,
            title: _remark.remark ?? 'undefined',
            useCount: 1,
            isCashIn: _remark.ledgerbookType == 'cashin' ? true : false,
            isSynced: true,
          );
          print(fResponse.message);
        }
        fResponse.success = true;
        fResponse.message = 'Downloaded Remarks from api';
      } else {
        fResponse.success = false;
        fResponse.message =
            'Error fetching remarks : ${_response.base.reasonPhrase}';
      }
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error occured calling api for remarks: $e';
    }
    return fResponse;
  }

  Future<FunctionResponse> uploadUnsyncedRemarks() async {
    FunctionResponse fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        fResponse.message = 'User unauthorized';
        return fResponse;
      }
      // print('--business id: ${_userData.businessId} ');

      //get unsynced Remarks
      fResponse = await _dbHelper.getDbUnsyncedRemarks();

      if (fResponse.success && fResponse.data != null) {
        List<db.Remark> unsyncedRemarks = fResponse.data as List<db.Remark>;
        if (unsyncedRemarks == null || unsyncedRemarks.isEmpty) {
          fResponse.success = true;
          fResponse.message = 'No unsynced remarks';
        } else {
          //Make list of Remark to Upload
          for (db.Remark _remark in unsyncedRemarks) {
            print(
                '-- RID: ${_remark.id}  remark title : ${_remark.title},  synced: ${_remark.isSynced}');

            //Upload Remark
            ApiClient _apiClient = await _authApiHelper.getNewToken();
            final _response =
                await _apiClient.apiCashBookAddCashbookRemarksBusinessIdPost(
              businessId: _userData.businessId,
              body: CashbookRemarksDTO(
                bookId: _remark.bookId,
                ledgerbookType: _remark.isCashIn
                    ? CashbookType.cashin
                    : CashbookType.cashout,
                remark: _remark.title,
              ),
            );
            if (_response.isSuccessful && _response.body['success'] == true) {
              fResponse.success = true;
              fResponse.message = 'Added Remark to api';
            } else {
              fResponse.success = false;
              fResponse.message = 'Api did not accept remark';
            }
          }
        }
      } else {
        fResponse.success = false;
        fResponse.message = 'unsynced remarks not found';
      }
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error Uploading Remarks : $e';
    }
    return fResponse;
  }
}
