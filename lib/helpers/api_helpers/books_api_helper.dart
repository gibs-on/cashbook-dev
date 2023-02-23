import 'dart:convert';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/models/api_response/books_response.dart';
import 'package:cashbook/models/book.dart';

import '../../service_locator.dart';
import '../db_helper.dart';
import './auth_api_helper.dart';

// final _db = MyAppDb();

class BooksApiHelper {
  final AuthApiHelper _authApiHelper;
  final DbHelper _dbHelper;
  BooksApiHelper(
    this._authApiHelper,
    this._dbHelper,
  );

  Future<List<int>> getBooks() async {
    print('getting Books');
    List<int> _bookIds = [];

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return [];
      }

      try {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient.apiCashBookGetbooksBusinessIdGet(
          businessId: _userData.businessId,
        );

        List<BooksResponse> _books = [];

        if (_response.isSuccessful) {
          var _responseData = _response.body;
          // print(_responseData);

          for (var _book in _responseData) {
            _book = jsonEncode(_book);
            _books.add(booksResponseFromJson(_book));
          }
          for (var _book in _books) {
            //get ids of all books to get their transactions
            _bookIds.add(_book.id ?? 0);

            try {
              await _dbHelper.dbAddNewBook(
                id: _book.id!,
                title: _book.shortname ?? 'undefined',
              );
            } catch (e) {
              print('Error adding book from api to database : $e');
              return [];
            }
          }
          return _bookIds;
        } else {
          print('Error fetching Books : ${_response.base.reasonPhrase}');
          return [];
        }
      } catch (e) {
        print('Error occured calling api for Books: $e');
        return [];
      }
    } catch (e) {
      print('Error getting Books from api');
      return [];
    }
  }

  Future<int?> uploadSingleBook(String _title) async {
    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return null;
      }

      ApiClient _apiClient = await _authApiHelper.getNewToken();
      final _response = await _apiClient.apiCashBookCreateNewbookBusinessidPost(
          businessid: _userData.businessId,
          body: BookDTO(
            bookName: _title,
            shortname: _title,
          ));
      // if data is uploaded. update isSynced to true.
      if (_response.isSuccessful && _response.body['success']) {
        final String _bookId = _response.body['id'];
        return int.parse(_bookId);
      } else {
        print('Api did not accept Book');
        return null;
      }
    } catch (e) {
      print('Error Uploading books : $e');
      return null;
    }
  }

  Future<FunctionResponse> deleteBookApi(int _id) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData != null) {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response =
            await _apiClient.apiCashBookDeleteBookBusinessIdBookIdDelete(
          businessId: _userData.businessId,
          bookId: _id.toString(),
        );

        if (_response.isSuccessful && _response.body['success']) {
          _fResponse.success = true;
          _fResponse.message = 'Book deleted Successfully';
        } else {
          _fResponse.message = 'Api did not delete Book';
        }
      }
    } catch (e) {
      _fResponse.message = 'Error deleting Book : $e';
    }

    return _fResponse;
  }

  Future<bool?> updateBook(String val, Book previousBook) async {
    try {
      print('updating book name on via api');
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return null;
      }

      ApiClient _apiClient = await _authApiHelper.getNewToken();

      final _response = await _apiClient.apiCashBookEditBookBusinessIdPatch(
        businessId: _userData.businessId,
        body: BookDTOEdit(
          id: previousBook.id,
          bookName: val,
          shortname: val,
        ),
      );
      // if data is uploaded. update isSynced to true.
      if (_response.isSuccessful) {
        return true;
      } else {
        print('Api did not update Book');
        return null;
      }
    } catch (e) {
      print('Error Uploading books : $e');
      return null;
    }
  }
}
