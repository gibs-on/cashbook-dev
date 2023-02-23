import 'dart:convert';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/db/database.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/models/api_response/profile_response.dart';
import './auth_api_helper.dart';
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/models/api_response/payment_modes_response.dart';

import '../../service_locator.dart';

class ProfileApiHelper {
  late AuthApiHelper _authApiHelper;
  late DbHelper _dbHelper;
  ProfileApiHelper(
    this._authApiHelper,
    this._dbHelper,
  );
  Future<ProfileResponse?> getProfile() async {
    print('getting Profile Info from API');

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return null;
      }

      try {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient.apiAccountGetProfileBusinessIdGet(
          businessId: _userData.businessId,
        );

        ProfileResponse _profileResponse;

        if (_response.isSuccessful) {
          var _responseData = _response.body;
          print(_responseData);
          _profileResponse = profileResponseFromJson(jsonEncode(_responseData));
          return _profileResponse;
        } else {
          print('Error fetching Profile : ${_response.base.reasonPhrase}');
        }
      } catch (e) {
        print('Error occured calling api for Profile: $e');
        return null;
      }
    } catch (e) {
      print('Error getting Profile from api');
      return null;
    }
  }

  Future<FunctionResponse> updateProfileName({
    required ProfileResponse profile,
    required String name,
  }) async {
    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return FunctionResponse(success: false, message: 'User Unauthorized');
      }

      ApiClient _apiClient = await _authApiHelper.getNewToken();
      final _response =
          await _apiClient.apiAccountUpdateBusinessProfileBusinessIdPost(
              businessId: _userData.businessId,
              body: CustomerDTOEdit(
                fullnames: name,
                organizationName: profile.organizationName,
                primaryEmail: profile.primaryEmail,
                secondaryEmail: profile.secondaryEmail,
                primaryPhone: profile.primaryPhone,
                secondaryPhone: profile.secondaryPhone,
                website: profile.website,
                address: profile.address,
                city: profile.city,
                country: profile.country,
                custId: profile.custId,
                editedby: '',
                editedIP: '',
                imageFile: profile.imageFile,
                location: profile.location,
                businessTypeId: '0',
              ));
      final _responseData = _response.body;

      if (_response.isSuccessful && _responseData?.success == true) {
        return FunctionResponse(
            success: true, message: 'Profile Updated Successfully');
      } else {
        return FunctionResponse(
            success: false,
            message: ' ${_responseData?.errordesc} Please try again');
      }
    } catch (e) {
      return FunctionResponse(
          success: false, message: 'Error Updating Profile : $e');
    }
  }

  Future<FunctionResponse> updateProfileImage({
    required ProfileResponse profile,
    required String image,
  }) async {
    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return FunctionResponse(success: false, message: 'User Unauthorized');
      }

      ApiClient _apiClient = await _authApiHelper.getNewToken();
      final _response =
          await _apiClient.apiAccountUpdateBusinessProfileBusinessIdPost(
              businessId: _userData.businessId,
              body: CustomerDTOEdit(
                fullnames: profile.fullnames,
                organizationName: profile.organizationName,
                primaryEmail: profile.primaryEmail,
                secondaryEmail: profile.secondaryEmail,
                primaryPhone: profile.primaryPhone,
                secondaryPhone: profile.secondaryPhone,
                website: profile.website,
                address: profile.address,
                city: profile.city,
                country: profile.country,
                custId: profile.custId,
                editedby: '',
                editedIP: '',
                imageFile: image,
                location: profile.location,
                businessTypeId: '0',
              ));
      final _responseData = _response.body;

      if (_response.isSuccessful && _responseData?.success == true) {
        return FunctionResponse(
            success: true, message: 'Profile Updated Successfully');
      } else {
        return FunctionResponse(
            success: false,
            message: ' ${_responseData?.errordesc} Please try again');
      }
    } catch (e) {
      return FunctionResponse(
          success: false, message: 'Error Updating Profile : $e');
    }
  }
}
