import 'dart:convert';
import 'dart:io';

import 'package:cashbook/db/database.dart' as db;
import 'package:intl/intl.dart';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/helpers/db_helper.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/models/api_response/transactions_response.dart';

import '../../service_locator.dart';
import 'auth_api_helper.dart';
import 'image_upload_api_helper.dart';

class TransactionImage {
  int id;
  String image;
  TransactionImage({required this.id, required this.image});
}

class TransactionsApiHelper {
  final AuthApiHelper _authApiHelper;
  final DbHelper _dbHelper;
  final ImageUploadHelper _imageUploadHelper;
  TransactionsApiHelper(
    this._authApiHelper,
    this._dbHelper,
    this._imageUploadHelper,
  );

  Future<void> getTransactions(int _bookId) async {
    // print('getting Transactions');

    // print('Getting transactions for book $_bookId');
    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return;
      }

      try {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient
            .apiCashBookGetCashbookTransactionsBusinessIdBookIdGet(
          businessId: _userData.businessId,
          bookId: _bookId.toString(),
        );

        List<TransactionsResponse> _transactions = [];

        if (_response.isSuccessful) {
          var _responseData = _response.body;
          // print(_responseData);
          for (var _transaction in _responseData) {
            _transaction = jsonEncode(_transaction);
            _transactions.add(transactionsResponseFromJson(_transaction));
          }
          for (var _transaction in _transactions) {
            String _date = _transaction.transactiondate!;
            String _time = _transaction.transactiontime!;
            DateTime _usableDate = DateFormat('M/d/y kk:mm')
                .parse('$_date $_time')
                .add(const Duration(hours: 1));

            try {
              await _dbHelper.addNewDbTransaction(
                id: _transaction.id,
                bookId: _bookId,
                remarks: _transaction.remarks ?? 'undefined',
                amount: _transaction.amount?.toDouble() ?? 0,
                date: _usableDate,
                category: _transaction.cashbookCategoryid ?? 0,
                paymentMode: _transaction.paymentModeId ?? 0,
                imagePath: _transaction.attachments != null
                    ? _transaction.attachments!.first
                    : '',
                isCashIn:
                    _transaction.ledgerbookType == 'cashin' ? true : false,
                isSynced: true,
                isEdited: false,
              );
              // print(
              //     'id: ${_transaction.id} name: ${_transaction.amount}  added to databae , imagePath : ${_transaction.attachments}');
            } catch (e) {
              print('Error adding transactions from api to database : $e');
            }
          }
        } else {
          print('Error fetching transactions : ${_response.base.reasonPhrase}');
        }
      } catch (e) {
        print('Error occured calling api for transactions: $e');
      }
    } catch (e) {
      print('Error getting transactions from api');
    }
    // }
  }

  Future<void> uploadUnsyncedBookTransactions(int _bookId) async {
    // for each book, get unsynced transactions
    //upload unsynced transactions
    //if succesful, update their sync status in db

    try {
      //New images
      List<TransactionImage> _newImages = [];

      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return;
      }
      // print('--business id: ${_userData.businessId} ');

      //get unsynced Transactions
      final _unsyncedTransactions =
          await _dbHelper.getUnsyncedTransactionsByBookId(_bookId);

      if (_unsyncedTransactions != null && _unsyncedTransactions.isNotEmpty) {
        print('found unsynced transactions ${_unsyncedTransactions.length}');

        //Make list of Transactions to Upload
        List<LedgerBookDTO> _uploadableTransactions = [];
        for (var _transaction in _unsyncedTransactions) {
          print(
              '-- TID: ${_transaction.id}  Transaction amount : ${_transaction.amount}, ${_transaction.isCashIn ? 'cashin' : 'cashout'}, synced: ${_transaction.isSynced}');

          //upload image to get network URl
          String _imageUrl = '';
          if (_transaction.imagePath != null &&
              _transaction.imagePath!.isNotEmpty) {
            FunctionResponse _urlResponse = await _imageUploadHelper
                .uploadPicture(File(_transaction.imagePath!));
            if (_urlResponse.success) {
              print(_urlResponse.data);
              _imageUrl = _urlResponse.data;
              _newImages
                  .add(TransactionImage(id: _transaction.id, image: _imageUrl));
            }
          }

          //add transaction to list
          _uploadableTransactions.add(LedgerBookDTO(
            amount: _transaction.amount,
            attachments: [_imageUrl],
            ledgerbookType: _transaction.isCashIn
                ? CashbookType.cashin
                : CashbookType.cashout,
            remarks: _transaction.remarks,
            transactiondate: _transaction.date.toIso8601String(),
            transactiontime: _transaction.date.toIso8601String(),
            cashbookCategoryid: _transaction.category,
            paymentModeId: _transaction.paymentMode,
          ));
        }

        //Upload Transactions
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient
            .apiCashBookAddCashbookTransactionBusinessidBookIdPost(
          businessid: _userData.businessId,
          bookId: _bookId.toString(),
          body: _uploadableTransactions,
        );

        // if data is uploaded. update isSynced to true for each transaction.
        if (_response.isSuccessful && _response.body['success']) {
          print('need to delete${_unsyncedTransactions.length} transactions');
          for (var _transaction in _unsyncedTransactions) {
            print('Called delete for transaction ${_transaction.id}');

            await _dbHelper.deleteDbTransaction(
              id: _transaction.id,
            );
          }
        } else {
          // print('Api did not accept Transaction');
        }

        //Update sync status for each
      } else {
        // print('No unsynced Transactions found in database');
      }
    } catch (e) {
      print('Error Uploading Transactions : $e');
    }
  }

  Future<void> editMarkedTransactions() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData == null) {
        return;
      }

      //get edited Transactions
      final List<db.Transaction> _editedTransactions =
          await _dbHelper.getDbEditedTransactions();

      if (_editedTransactions != null && _editedTransactions.isNotEmpty) {
        print('found edited transactions ${_editedTransactions.length}');

        for (var _transaction in _editedTransactions) {
          print(
              '-- TID: ${_transaction.id}  Transaction amount : ${_transaction.amount}, ${_transaction.isCashIn ? 'cashin' : 'cashout'}, synced: ${_transaction.isSynced} edited: ${_transaction.isEdited}');

          //edit Marked Transactions
          _fResponse = await editTransactionApi(_transaction);
          if (_fResponse.success) {
            //mark transation not edited so it does not get updated again.
            await _dbHelper.updateDbTransaction(
              id: _transaction.id,
              bookId: _transaction.bookId,
              remarks: _transaction.remarks,
              category: _transaction.category,
              amount: _transaction.amount,
              paymentMode: _transaction.paymentMode,
              date: _transaction.date,
              isSynced: _transaction.isSynced,
              isEdited: false,
              isCashIn: _transaction.isCashIn,
            );
          }
          print(_fResponse.message);
        }
      } else {
        print('No edited Transactions found in database');
      }
    } catch (e) {
      print('Error Editing Transactions : $e');
    }
  }

  Future<FunctionResponse> editTransactionApi(
      db.Transaction _transaction) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      //get AuthResponse for businessId
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      //if userData is null, user is not authenticated. So, return
      if (_userData != null) {
        ApiClient _apiClient = await _authApiHelper.getNewToken();
        final _response = await _apiClient
            .apiCashBookUpdateCashbookTransactionBusinessIdBookIdPatch(
          bookId: _transaction.bookId.toString(),
          businessId: _userData.businessId,
          body: LedgerBookDTOEdit(
            id: _transaction.id,
            amount: _transaction.amount,
            attachments: [_transaction.imagePath ?? ''],
            cashbookCategoryid: _transaction.category,
            ledgerbookType: _transaction.isCashIn
                ? CashbookType.cashin
                : CashbookType.cashout,
            paymentModeId: _transaction.paymentMode,
            remarks: _transaction.remarks,
            transactionDate: _transaction.date.toIso8601String(),
            transactionTime: _transaction.date.toIso8601String(),
          ),
        );
        if (_response.isSuccessful && _response.body['success']) {
          _fResponse.success = true;
          _fResponse.message = 'Transaction Edited Successfully';
        } else {
          _fResponse.message = 'Failed to edit. Please try again';
        }
      }
    } catch (e) {
      _fResponse.message = 'Error Updating Transaction : $e';
    }

    return _fResponse;
  }
}
