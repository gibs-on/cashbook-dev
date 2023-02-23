import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/db/database.dart' as db;
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/service_locator.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../models/remark.dart';
part 'remarks_store.g.dart';

class RemarksStore = _RemarksStore with _$RemarksStore;

abstract class _RemarksStore with Store {
  final DbHelper _dbHelper;
  _RemarksStore(this._dbHelper);

  @observable
  bool isLoading = false;
  @observable
  ObservableList<Remark> remarksList = ObservableList<Remark>.of([]);

  Future<FunctionResponse> fetchAndSetRemarks(bool isCashIn) async {
    isLoading = true;

    FunctionResponse _fResponse = getIt<FunctionResponse>();
    try {
      remarksList.clear();

      _fResponse = await _dbHelper.getDbRemarks();
      print(_fResponse.message);

      if (_fResponse.success) {
        List<db.Remark> _dbRemarks = _fResponse.data;
        print('remarks after call in store${_dbRemarks.length}');
        print('remarks required for ${isCashIn ? 'Cashin' : 'Cashout'}');
        for (db.Remark remark in _fResponse.data) {
          if (remark.isCashIn == isCashIn) {
            remarksList.add(
              Remark(
                id: remark.id,
                bookId: remark.bookId,
                title: remark.title,
                useCount: remark.useCount,
                isCashIn: remark.isCashIn,
                isSynced: remark.isSynced,
              ),
            );
          }
        }
        remarksList.sort((a, b) => b.useCount.compareTo(a.useCount));
      }
      print('total remarks ${remarksList.length}');
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error Loading remarks : $e';
    }

    isLoading = false;
    return _fResponse;
  }

  Future<FunctionResponse> addOrUpdateRemark(
      int bookId, String title, bool isCashIn) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      print('called add or update');
      Remark newRemark = Remark(
          id: '0',
          bookId: bookId,
          title: title,
          useCount: 1,
          isCashIn: isCashIn,
          isSynced: false);
      bool flag = false;
      for (Remark remark in remarksList) {
        if (remark.title == title) {
          newRemark = remark;
          newRemark.useCount += 1;
          flag = true;
        }
      }
      print('flag : $flag');

      _fResponse = await _dbHelper.addDbRemarks(
        id: !flag ? const Uuid().v1() : newRemark.id,
        bookId: bookId,
        title: newRemark.title,
        useCount: newRemark.useCount,
        isCashIn: newRemark.isCashIn,
        isSynced: newRemark.isSynced,
      );
      print(_fResponse.message);
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error deleting remark : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> deleteRemark(String id) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    try {
      _fResponse = await _dbHelper.deleteDbRemarks(id: id);
      if (_fResponse.success) {
        remarksList.removeWhere((element) => element.id == id);
      }
      print(_fResponse.message);
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error deleting remark : $e';
    }
    return _fResponse;
  }
}
