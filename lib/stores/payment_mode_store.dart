import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/api_helpers/payment_mode_api_helper.dart';
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/models/payment_mode.dart';
import 'package:mobx/mobx.dart';

import '../service_locator.dart';

part 'payment_mode_store.g.dart';

class PaymentModeStore = _PaymentModeStore with _$PaymentModeStore;

abstract class _PaymentModeStore with Store {
  late DbHelper _dbHelper;
  late PaymentModeApiHelper _paymentModeApiHelper;
  _PaymentModeStore(this._dbHelper, this._paymentModeApiHelper);
  @observable
  ObservableList<PaymentMode> paymentModeList = ObservableList<PaymentMode>.of([
    // PaymentMode(id: '1', title: 'Cash'),
    // PaymentMode(id: '2', title: 'Online'),
  ]);

  @observable
  PaymentMode? selectedPaymentMode;

  @observable
  bool isLoading = false;

  //Payment Mode Actions

  @action
  void changeIsLoading(bool _val) {
    isLoading = _val;
  }

  @action
  void setSelectedPaymentMode(PaymentMode? _val) {
    selectedPaymentMode = _val ?? paymentModeList[0];
  }

  @action
  Future<void> fetchAndSetPaymentModes() async {
    try {
      // print('Fetching payment modes');
      // get raw data from db

      final dbPaymentModes = await _dbHelper.getDbPaymentModes();

      // final dbPaymentModes = await db.getAllPaymentModes;

      // Clear the memory paymentModes
      paymentModeList.clear();
      // get each row from db & add in memory paymentModes
      for (var element in dbPaymentModes) {
        // print('Added new payment mode');
        paymentModeList.add(PaymentMode(
          id: element.id,
          title: element.title.toString(),
        ));
      }
    } catch (e) {
      print('Error fetching payment modes :$e');
    }

    // If there is no paymentModeListin db, create one. Because there must be 1 paymentModeListatleast
    if (paymentModeList.isEmpty) {
      await addPaymentMode('Cash');
      // print('added new payment mode');
    }
    // print('total payment modes ${paymentMode.length}');
  }

  @action
  PaymentMode findPaymentModeById(int _id) {
    // print('payment mode length: ${paymentMode.length}');
    PaymentMode _mode = paymentModeList[0];
    try {
      _mode = paymentModeList.firstWhere((element) => element.id == _id);
    } catch (e) {
      // print('Error finding this payment mode $_id | $e');
    }
    return _mode;
  }

  @action
  Future<FunctionResponse> addPaymentMode(String _val) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      _fResponse = await _paymentModeApiHelper.uploadSinglePaymentMode(_val);

      if (_fResponse.success) {
        //Add payment mode to DB
        _fResponse = await _dbHelper.addDbPaymentMode(
          id: _fResponse.data,
          title: _val,
        );

        if (_fResponse.success) {
          paymentModeList.add(
            PaymentMode(
              id: _fResponse.data,
              title: _val,
            ),
          );
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error adding payment mode : $e';
    }
    return _fResponse;
  }

  @action
  Future<FunctionResponse> editPaymentMode(PaymentMode _paymentMode) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //Edit on API
      _fResponse = await _paymentModeApiHelper.editPaymentModeApi(_paymentMode);

      if (_fResponse.success) {
        //Edit in database
        _fResponse = await _dbHelper.updateDbPaymentMode(
            id: _paymentMode.id, title: _paymentMode.title);

        if (_fResponse.success) {
          final int _inserIndex = paymentModeList
              .indexWhere((element) => element.id == _paymentMode.id);

          paymentModeList.removeAt(_inserIndex);
          paymentModeList.insert(_inserIndex, _paymentMode);

          _fResponse.success = true;
          _fResponse.message = 'Edited Successfully';
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error editing Payment Mode : $e';
    }

    return _fResponse;
  }

  @action
  Future<FunctionResponse> deletePaymentMode(PaymentMode _paymentMode) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //Delete on API
      _fResponse =
          await _paymentModeApiHelper.deletePaymentModeApi(_paymentMode.id);

      if (_fResponse.success) {
        //Delete in database
        _fResponse = await _dbHelper.deleteDbPaymentMode(id: _paymentMode.id);

        if (_fResponse.success) {
          final int _inserIndex = paymentModeList
              .indexWhere((element) => element.id == _paymentMode.id);

          paymentModeList.removeAt(_inserIndex);

          _fResponse.success = true;
          _fResponse.message = 'Deleted Successfully';
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error deleting Payment Mode : $e';
    }

    return _fResponse;
  }
}
