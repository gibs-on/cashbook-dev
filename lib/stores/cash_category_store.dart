import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/api_helpers/cash_category_api_helper.dart';
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/models/cash_category.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:mobx/mobx.dart';

import '../service_locator.dart';

part 'cash_category_store.g.dart';

class CashCategoryStore = _CashCategoryStore with _$CashCategoryStore;

abstract class _CashCategoryStore with Store {
  late DbHelper _dbHelper;
  late CashCategoryApiHelper _cashCategoryApiHelper;
  late TransactionStore _transactionStore;

  _CashCategoryStore(
      this._dbHelper, this._cashCategoryApiHelper, this._transactionStore);

  @observable
  bool selectedTransactionCategoryType = true;

  @observable
  CashCategory? selectedCategory;

  @observable
  ObservableList<CashCategory> cashInCategoryList =
      ObservableList<CashCategory>.of([]);

  @observable
  ObservableList<CashCategory> cashOutCategoryList =
      ObservableList<CashCategory>.of([]);

  @observable
  bool isLoading = false;

  @action
  void changeIsLoading(bool _val) {
    isLoading = _val;
    print('Category is loading = $isLoading');
  }

  @action
  void setSelectedCategory(CashCategory val) {
    selectedCategory = val;
  }

  @action
  void changeSelectedTransactionCategoryType(bool val) {
    selectedTransactionCategoryType = val;
    selectedCategory = selectedTransactionCategoryType
        ? cashInCategoryList[0]
        : cashOutCategoryList[0];
    print(
        'selected transaction type is ${selectedTransactionCategoryType ? 'CashIn' : 'Cashout'}');
  }

  @action
  CashCategory findCashCategoryById(int _id, bool _isCashIn) {
    CashCategory _category = cashOutCategoryList[0];
    if (_isCashIn) {
      _category = cashInCategoryList[0];
    }
    try {
      if (_isCashIn) {
        _category =
            cashInCategoryList.firstWhere((element) => element.id == _id);
      } else {
        _category =
            cashOutCategoryList.firstWhere((element) => element.id == _id);
      }
    } catch (e) {
      // print('Error finding this category $_id | $_isCashIn | $e');
    }
    return _category;
  }

  @action
  Future<void> fetchAndSetCashCategories() async {
    try {
      // Clear the memory cashIn/cashOut categories
      // print('Fetching cash categories from database');
      cashInCategoryList.clear();
      cashOutCategoryList.clear();

      // get raw data from db
      final dbCashInCategories = await _dbHelper.getDbCashInCategories();
      final dbCashOutCategories = await _dbHelper.getDbCashOutCategories();
      // print('Got ${dbCashInCategories.length} cashin cats');
      // print('Got ${dbCashOutCategories.length} cashout cats');

      // get each row from db & add in memory cashInCategories
      for (var element in dbCashInCategories) {
        cashInCategoryList.add(CashCategory(
          id: element.id,
          title: element.title.toString(),
        ));
      }
      // get each row from db & add in memory cashOutCategories
      for (var element in dbCashOutCategories) {
        cashOutCategoryList.add(CashCategory(
          id: element.id,
          title: element.title.toString(),
        ));
      }

      // If there is no book in db, create one. Because there must be 1 cashIn/CashOut Category atleast
      if (cashInCategoryList.isEmpty) {
        // print('cashins are empty');
        await addCategory('Salary', true);
        // print('added new cashInCategory');
      }
      if (cashInCategoryList.isEmpty) {
        // print('cashouts are empty');
        await addCategory('Rent', false);
        // print('added new cashOutCategory');
      }
    } catch (e) {
      print('Error fetching cashCategories :$e');
    }
  }

  @action
  Future<FunctionResponse> addCategory(String _val, bool _isCashIn) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    //ADD cashCategory with api and get id to add to db.

    try {
      _fResponse = await _cashCategoryApiHelper.uploadSingleCashCategories(
          _val, _isCashIn);

      // print('Id recieved from add category Api $_apiCatId');

      if (_fResponse.success) {
        final int _apiCatId = _fResponse.data;

        _fResponse = await _dbHelper.addDbCashCategory(
          id: _apiCatId,
          title: _val,
          isCashIn: _isCashIn,
        );

        if (_fResponse.success) {
          final int _dbId = _fResponse.data;
          if (_isCashIn) {
            cashInCategoryList.add(CashCategory(id: _dbId, title: _val));
          } else {
            cashOutCategoryList.add(CashCategory(id: _dbId, title: _val));
          }
          _fResponse.success = true;
          _fResponse.message = 'Successfully added new Category';
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error adding category $e';
    }
    return _fResponse;
  }

  @action
  Future<FunctionResponse> editCategory(
      CashCategory _category, bool _isCashIn) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //Edit on API
      _fResponse = await _cashCategoryApiHelper.editCashCategoryApi(
        _category,
        _isCashIn,
      );

      if (_fResponse.success) {
        //Edit in database
        _fResponse = await _dbHelper.updateDbCashCategory(
            id: _category.id, title: _category.title, isCashIn: _isCashIn);

        if (_fResponse.success) {
          if (_isCashIn) {
            final int _inserIndex = cashInCategoryList
                .indexWhere((element) => element.id == _category.id);

            cashInCategoryList.removeAt(_inserIndex);
            cashInCategoryList.insert(_inserIndex, _category);
          } else {
            final int _inserIndex = cashOutCategoryList
                .indexWhere((element) => element.id == _category.id);

            cashOutCategoryList.removeAt(_inserIndex);
            cashOutCategoryList.insert(_inserIndex, _category);
          }

          _fResponse.success = true;
          _fResponse.message = 'Edited Successfully';
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error editing Category : $e';
    }

    return _fResponse;
  }

  @action
  Future<FunctionResponse> deleteCategory(
      CashCategory _category, bool _isCashIn) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //Delete on API
      _fResponse =
          await _cashCategoryApiHelper.deleteCashCategoryApi(_category.id);

      if (_fResponse.success) {
        //Delete in database
        _fResponse = await _dbHelper.deleteDbCategory(id: _category.id);

        if (_fResponse.success) {
          if (_isCashIn) {
            final int _inserIndex = cashInCategoryList
                .indexWhere((element) => element.id == _category.id);

            cashInCategoryList.removeAt(_inserIndex);
          } else {
            final int _inserIndex = cashOutCategoryList
                .indexWhere((element) => element.id == _category.id);

            cashOutCategoryList.removeAt(_inserIndex);
          }

          _fResponse.success = true;
          _fResponse.message = 'Deleted Successfully';
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error deleting Category : $e';
    }

    return _fResponse;
  }
}
