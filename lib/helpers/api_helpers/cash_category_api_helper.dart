import 'dart:convert';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/db/database.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/models/api_response/cash_book_categories_response.dart';
import 'package:cashbook/models/cash_category.dart';

import '../../service_locator.dart';
import './auth_api_helper.dart';

class CashCategoryApiHelper {
  late AuthApiHelper _authApiHelper;
  late DbHelper _dbHelper;
  CashCategoryApiHelper(
    this._authApiHelper,
    this._dbHelper,
  );

  Future<void> getCashBookCashInCategories() async {
    print('getting cashin categories from API');

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return;
      }
      try {
        String accessToken = await getIt<SharedPreferencesHelper>().getToken();
        // print('token before call : $accessToken');

        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final response = await _apiClient.apiCashBookGetCashbookcategoriesPost(
          body: CashbookCategoriesfilters(
            cashbookType: CashbookType.cashin,
            businessId: _userData.businessId,
          ),
        );

        List<CashBookCategoriesResponse> cashBookCategoriesResponse = [];

        if (response.isSuccessful) {
          var responseData = response.body;

          for (var _category in responseData) {
            _category = jsonEncode(_category);
            cashBookCategoriesResponse
                .add(cashBookCategoriesResponseFromJson(_category));
          }
          for (var _category in cashBookCategoriesResponse) {
            try {
              await _dbHelper.addDbCashCategory(
                id: _category.id!,
                title: _category.categoryname ?? 'undefined',
                isCashIn: true,
              );
              // print(
              //     'id: ${_category.id} name: ${_category.categoryname}  added to databae');
            } catch (e) {
              print('Error adding cashin category from api to database : $e');
            }
          }
        } else {
          print(
              'Error fetching Cash In categories : ${response.base.reasonPhrase}');
        }
      } catch (e) {
        print('Error occured calling api for Cash In Categories: $e');
      }
    } catch (e) {
      print('Error getting Cash In categories from api : $e');
    }
  }

  //TODO: only one method can be used to get both
  Future<void> getCashBookCashOutCategories() async {
    print('getting cashout categories from API');

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return;
      }
      try {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final response = await _apiClient.apiCashBookGetCashbookcategoriesPost(
          body: CashbookCategoriesfilters(
            cashbookType: CashbookType.cashout,
            businessId: _userData.businessId,
          ),
        );

        List<CashBookCategoriesResponse> cashBookCategoriesResponse = [];

        if (response.isSuccessful) {
          var responseData = response.body;

          for (var _category in responseData) {
            _category = jsonEncode(_category);
            cashBookCategoriesResponse
                .add(cashBookCategoriesResponseFromJson(_category));
          }
          for (var _category in cashBookCategoriesResponse) {
            try {
              await _dbHelper.addDbCashCategory(
                id: _category.id!,
                title: _category.categoryname ?? 'undefined',
                isCashIn: false,
              );
              // print(
              //     'id: ${_category.id} name: ${_category.categoryname}  added to databae');
            } catch (e) {
              print('Error adding cashout category from api to database : $e');
            }
          }
        } else {
          print(
              'Error fetching Cash Out categories : ${response.base.reasonPhrase}');
        }
      } catch (e) {
        print('Error occured calling api for Cash Out Categories: $e');
      }
    } catch (e) {
      print('Error getting Cash Out Book categories from api : $e');
    }
  }

  Future<FunctionResponse> uploadSingleCashCategories(
      String _title, bool isCashIn) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData != null) {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response =
            await _apiClient.apiCashBookCreateCashbookCategoryBusinessIdPost(
          businessId: _userData.businessId,
          body: CashbookCategorisDTOAdd(
            categoryname: _title,
            categorytype: isCashIn ? CashbookType.cashin : CashbookType.cashout,
            customerId: _userData.userId,
          ),
        );

        if (_response.isSuccessful && _response.body['success']) {
          final String _catId = _response.body['id'].toString();

          _fResponse.data = int.parse(_catId);
          _fResponse.success = true;
          _fResponse.message = 'Category Added Successfully';
        } else {
          _fResponse.message = 'Failed adding Category. Please try again.';
        }
      }
    } catch (e) {
      _fResponse.message = 'Error Uploading categories : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> editCashCategoryApi(
      CashCategory _category, bool _isCashIn) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData != null) {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response =
            await _apiClient.apiCashBookUpdateCashbookcategoriesBusinessIdPatch(
                businessId: _userData.businessId,
                body: CashbookCategorisDTOEdit(
                  id: _category.id,
                  categoryname: _category.title,
                  categorytype:
                      _isCashIn ? CashbookType.cashin : CashbookType.cashout,
                  customerId: _userData.userId,
                ));
        if (_response.isSuccessful && _response.body['success']) {
          _fResponse.success = true;
          _fResponse.message = 'Category Edited Successfully';
        } else {
          _fResponse.message = 'Api did not edit Category';
        }
      }
    } catch (e) {
      _fResponse.message = 'Error Updating Category : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> deleteCashCategoryApi(int _id) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData != null) {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient
            .apiCashBookDeleteCashbookcategoriesBusinessIdCategoryIdDelete(
          businessId: _userData.businessId,
          categoryId: _id,
        );
        if (_response.isSuccessful && _response.body['success']) {
          _fResponse.success = true;
          _fResponse.message = 'Category Deleted Successfully';
        } else {
          _fResponse.message = 'Api did not delete Category';
        }
      }
    } catch (e) {
      _fResponse.message = 'Error Deleting Category : $e';
    }

    return _fResponse;
  }
}
