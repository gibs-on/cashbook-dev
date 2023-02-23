import 'dart:convert';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service_locator.dart';

class SharedPreferencesHelper {
  final SharedPreferences _prefs;
  SharedPreferencesHelper(this._prefs);

//Basic Local Methods
  Future<FunctionResponse> _setData(
      String name, Map<String, dynamic> dataInput) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    final data = jsonEncode(dataInput);
    try {
      await _prefs.setString(name, data);

      _fResponse.success = true;
      _fResponse.message = 'Data added successfully';
    } catch (e) {
      _fResponse.message = 'Error adding data : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> _getData(String name) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      if (!_prefs.containsKey(name)) {
        _fResponse.message = 'Data Source Not found';
      } else {
        final data = jsonDecode(_prefs.getString(name)!);
        _fResponse.success = true;
        _fResponse.message = 'Data found Successfully';
        _fResponse.data = data;
      }
    } catch (e) {
      _fResponse.message = 'Error getting data : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> _removeData(String name) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final _response = await _prefs.remove(name);
      if (_response) {
        _fResponse.success = true;
        _fResponse.message = 'Data deletion successful';
      } else {
        _fResponse.message = 'Data Deletion Failed';
      }
    } catch (e) {
      _fResponse.message = 'Error removing data : $e';
    }
    return _fResponse;
  }

  //Auth Functions
  final String _userData = 'userData';

  Future<FunctionResponse> getCurrentUser() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _getData(_userData);

      if (_fResponse.success) {
        //convert data to authResponse
        final AuthResponse _authResponse =
            AuthResponse.fromJson(_fResponse.data);
        _fResponse.data = _authResponse;
      }
    } catch (e) {
      _fResponse.message = 'Error finding User data : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> verifyUser() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _getData(_userData);

      //if getData is successful
      if (_fResponse.success) {
        //convert response into authResponse Object
        final _authResponse =
            AuthResponse.fromJson(_fResponse.data as Map<String, dynamic>);

        _authResponse.isVerified = true;
        _fResponse = await removeUser();

        if (_fResponse.success) {
          _fResponse = await saveNewUser(_authResponse.toJson());
        }
      }
    } catch (e) {
      _fResponse.message = 'Error Verifying User : $e';
    }
    return _fResponse;
  }

  Future<String> getToken() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    // print('---- asked for token');
    try {
      _fResponse = await _getData(_userData);
      if (_fResponse.success) {
        //convert response into authResponse Object
        final authResponse =
            AuthResponse.fromJson(_fResponse.data as Map<String, dynamic>);
        if (authResponse.token != null && authResponse.token!.isNotEmpty) {
          // print('token provided :  ${authResponse.token}');
          return authResponse.token ?? '';
        } else {
          print('no token available');
          return '';
        }
      } else {
        print('no token available');
        return '';
      }
    } catch (e) {
      print('no token available');
      return '';
    }
  }

  Future<FunctionResponse> tryAutoLogin() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    try {
      _fResponse = await _getData(_userData);
      //if getData is successful
      if (_fResponse.success) {
        //convert response into authResponse Object
        final _authResponse =
            AuthResponse.fromJson(_fResponse.data as Map<String, dynamic>);
        //if data has a token
        if (_authResponse.token != null && _authResponse.token!.isNotEmpty) {
          //if token is expired
          if (_authResponse.expiration!.isBefore(DateTime.now())) {
            _fResponse.success = false;
            _fResponse.message = 'Token Expired';
          }
          //if token Not expired
          else {
            if (_authResponse.isVerified == true) {
              _fResponse.success = true;
              // _fResponse.message = 'User is logedIn';
            } else {
              _fResponse.success = false;
              _fResponse.message = 'User is not verified';
              _fResponse.data = 'OTP';
            }
          }
        } else {
          _fResponse.success = false;
          _fResponse.message = 'Token not found';
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error in autoLogin : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> saveNewUser(dynamic _data) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    try {
      _fResponse = await _setData(_userData, _data);
    } catch (e) {
      _fResponse.message = 'Error Saving New User : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> removeUser() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _removeData(_userData);
    } catch (e) {
      _fResponse.message = 'Error removing User';
    }
    return _fResponse;
  }

  //Book Persistance

  final String _currentBookData = 'currentBook';
  Future<FunctionResponse> getCurrentBook() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _getData(_currentBookData);
      _fResponse.data = _fResponse.data['book'];
    } catch (e) {
      _fResponse.message = 'Error finding CurrentBook : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> setCurrentBook(int bookId) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final _data = {'book': bookId};
      _fResponse = await _setData(
        _currentBookData,
        _data,
      );
    } catch (e) {
      _fResponse.message = 'Error setting CurrentBook : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> removeCurrentBook() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _removeData(_currentBookData);
    } catch (e) {
      _fResponse.message = 'Error removing Book';
    }
    return _fResponse;
  }

//Currency Persistance

  final String _currentCurrencyData = 'currentCurrency';
  Future<FunctionResponse> getCurrentCurrency() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _getData(_currentCurrencyData);
      _fResponse.data = _fResponse.data['currency'];
    } catch (e) {
      _fResponse.message = 'Error finding Current Currency : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> setCurrentCurrency(String _currency) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final _data = {'currency': _currency};
      _fResponse = await _setData(
        _currentCurrencyData,
        _data,
      );
    } catch (e) {
      _fResponse.message = 'Error setting Current Currency : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> removeCurrentCurrency() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _removeData(_currentCurrencyData);
    } catch (e) {
      _fResponse.message = 'Error removing Currency';
    }
    return _fResponse;
  }

  //Last Sync Data

  final String _lastSyncData = 'lastSync';
  Future<FunctionResponse> getLastSync() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _getData(_lastSyncData);
      _fResponse.data = _fResponse.data['lastSyncDate'];
      print('returning ${_fResponse.data}');
    } catch (e) {
      _fResponse.message = 'Error finding Last Sync : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> setLastSync(String _lastSync) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final _data = {'lastSyncDate': _lastSync};
      _fResponse = await _setData(
        _lastSyncData,
        _data,
      );
      print(' ${_fResponse.message} data:  $_lastSync');
    } catch (e) {
      _fResponse.message = 'Error setting Last Sync : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> removeLastSync() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _removeData(_lastSyncData);
      print('${_fResponse.message} for last sync');
    } catch (e) {
      _fResponse.message = 'Error removing Last Sync';
    }
    return _fResponse;
  }

  // last shown without sync - user have not synced even once. so we show a dialog once each day.
  final String _noSyncPopUpShownDate = 'noSyncPopupShownDate';
  Future<FunctionResponse> getLastSyncPopUpSown() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _getData(_noSyncPopUpShownDate);
      _fResponse.data = _fResponse.data[_noSyncPopUpShownDate];
      print('returning ${_fResponse.data}');
    } catch (e) {
      _fResponse.message = 'Error finding No Sync PopUp Date : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> setNoSyncPopUpShownDate(
      String lastTimeDialogShownWhenThereIsNoSync) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final _data = {
        _noSyncPopUpShownDate: lastTimeDialogShownWhenThereIsNoSync
      };
      _fResponse = await _setData(
        _lastSyncData,
        _data,
      );
      print(
          ' ${_fResponse.message} data:  $lastTimeDialogShownWhenThereIsNoSync');
    } catch (e) {
      _fResponse.message = 'Error setting No Sync PopUp Shown Date : $e';
    }

    return _fResponse;
  }

  Future<FunctionResponse> removeNoSyncPopupShownDate() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _removeData(_noSyncPopUpShownDate);
      print('${_fResponse.message} for last no sync popup');
    } catch (e) {
      _fResponse.message = 'Error removing no sync popup';
    }
    return _fResponse;
  }

  // tutorial shown or not for the first time user sees the dashboard/home screen
  final String _tutorialShown = 'tutorialShown';
  Future<FunctionResponse> isTutorialShown() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    try {
      _fResponse = await _getData(_tutorialShown);
      _fResponse.data = _fResponse.data[_tutorialShown];
      print('_tutorialShown returning:  ${_fResponse.data}');
    } catch (e) {
      _fResponse.message = 'Error finding Tutorial shown : $e';
      print(e);
    }

    return _fResponse;
  }

  Future<FunctionResponse> setTutorialShown() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final _data = {_tutorialShown: true};
      _fResponse = await _setData(
        _tutorialShown,
        _data,
      );
      print(' ${_fResponse.message} data:  $_tutorialShown');
    } catch (e) {
      _fResponse.message = 'Error setting Tutorial Shown : $e';
      print(e);
    }

    return _fResponse;
  }

  Future<FunctionResponse> removeTutorialShown() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      _fResponse = await _removeData(_tutorialShown);
      print('${_fResponse.message} for Tutorial Shown');
    } catch (e) {
      _fResponse.message = 'Error removing Tutorial Shown';
    }
    return _fResponse;
  }
}
