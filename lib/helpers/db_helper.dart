import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/db/database.dart'
    show
        Book,
        BooksCompanion,
        CashBookCategoriesCompanion,
        CashBookCategory,
        MyAppDb,
        PaymentMode,
        PaymentModesCompanion,
        Remark,
        Remarks,
        RemarksCompanion,
        Transaction,
        TransactionsCompanion;
import 'package:drift/drift.dart';

import '../service_locator.dart';

class DbHelper {
  //TODO: use getit instance
  late final MyAppDb db;
  DbHelper() {
    db = MyAppDb();
  }

  Future<List<Book>> getDbBooks() async {
    try {
      final _dbBooks = await db.getAllBookEntries;
      return _dbBooks;
    } catch (e) {
      print('Error getting books from database $e');
      return [];
    }
  }

  Future<int?> dbAddNewBook({
    required int id,
    String title = 'undefined',
  }) async {
    try {
      print('Books id recieved $id');
      final _bookId = await db.addBookDb(BooksCompanion(
        id: Value(id),
        title: Value(title),
      ));

      return _bookId;
    } catch (e) {
      print('error adding book into database $e');
      return null;
    }
  }

  Future<FunctionResponse> updateDbBook({
    required int id,
    required String title,
  }) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      await db.updateBookDb(BooksCompanion(
        id: Value(id),
        title: Value(title),
      ));
      _fResponse.success = true;
      _fResponse.message = 'Book Edited from database';
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error updating book in data base : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> deleteDbBook({required int id}) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      await db.deleteBookDb(BooksCompanion(id: Value(id)));
      _fResponse = await deleteTransactionsByBookId(bookId: id);
    } catch (e) {
      print('error deleting book from database');
    }
    return _fResponse;
  }

  //Transactions

  Future<List<Transaction>> getDbTransactions() async {
    try {
      final _dbTransactions = await db.getAllTransactionEntries;
      return _dbTransactions;
    } catch (e) {
      print('Error getting transactions from database $e');
      return [];
    }
  }

  Future<List<Transaction>> getDbEditedTransactions() async {
    try {
      final _dbTransactions = await db.getEditedTransactions;
      // print('Edited transactions from db : ${_dbTransactions.length}');
      return _dbTransactions;
    } catch (e) {
      print('Error getting edited transactions from database $e');
      return [];
    }
  }

  Future<List<Transaction>> _getDbUnsyncedTransactions() async {
    try {
      final _dbTransactions = await db.getUnsyncedTransactions;
      return _dbTransactions;
    } catch (e) {
      print('Error getting edited transactions from database $e');
      return [];
    }
  }

  Future<List<Transaction>> getUnsyncedTransactionsByBookId(int _bookId) async {
    try {
      final List<Transaction> _dbUnsyncedTransactions =
          await db.getUnsyncedTransactions;
      List<Transaction> _returnTransactions = [];

      for (var _transaction in _dbUnsyncedTransactions) {
        if (_transaction.bookId == _bookId) {
          _returnTransactions.add(_transaction);
        }
      }

      return _returnTransactions;
    } catch (e) {
      print('Error getting books from database $e');
      return [];
    }
  }

  Future<FunctionResponse> deleteTransactionsByBookId(
      {required int bookId}) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      await db.deleteTransactionsByBookId(
          TransactionsCompanion(bookId: Value(bookId)));

      _fResponse.success = true;
      _fResponse.message = 'Delete Transactions from database successful';
    } catch (e) {
      _fResponse.message = 'Error deleting Transactions from database : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> addNewDbTransaction({
    required int? id,
    required int bookId,
    String remarks = 'undefined',
    int category = 0,
    double amount = 0.0,
    int paymentMode = 0,
    required DateTime date,
    String? imagePath,
    required bool isSynced,
    required bool isEdited,
    bool isCashIn = true,
  }) async {
    FunctionResponse _fResponse = FunctionResponse();
    // print('transaction Id in database : $id');

    try {
      // print('Date Recived $date');
      final int _transactionId =
          await db.addTransacctionDb(TransactionsCompanion(
        id: id == null ? const Value.absent() : Value(id),
        bookId: Value(bookId),
        remarks: Value(remarks),
        category: Value(category),
        amount: Value(amount),
        paymentMode: Value(paymentMode),
        date: Value(date),
        imagePath: Value(imagePath),
        isCashIn: Value(isCashIn),
        isSynced: Value(isSynced),
        isEdited: Value(isEdited),
      ));
      // print(
      //     'transaction in db : $_transactionId $amount $isCashIn $category $isSynced $isEdited');

      _fResponse.data = _transactionId;
      _fResponse.success = true;
      _fResponse.message = 'Transaction added to database';
    } catch (e) {
      _fResponse.message = 'Error adding transaction into database $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> updateDbTransaction({
    required int id,
    required int bookId,
    required String remarks,
    required int category,
    required double amount,
    required int paymentMode,
    required DateTime date,
    String? imagePath,
    required bool isSynced,
    required bool isEdited,
    required bool isCashIn,
  }) async {
    FunctionResponse _fResponse = FunctionResponse();
    print('update call for transaction : $id isedited:$isEdited');
    try {
      await db.updateTransacctionDb(TransactionsCompanion(
        id: Value(id),
        bookId: Value(bookId),
        remarks: Value(remarks),
        category: Value(category),
        amount: Value(amount),
        paymentMode: Value(paymentMode),
        date: Value(date),
        imagePath: Value(imagePath),
        isCashIn: Value(isCashIn),
        isSynced: Value(isSynced),
        isEdited: Value(isEdited),
      ));
      // print(
      //     'transaction in db : $id $amount $isCashIn $category $isSynced $isEdited');

      _fResponse.success = true;
      _fResponse.message = 'Transaction edited from database ';
    } catch (e) {
      _fResponse.message = 'Error updating Transaction in database : $e';
    }
    return _fResponse;
  }

  Future<void> deleteDbTransaction({required int id}) async {
    print('db delete call fo trransaction $id ');
    try {
      await db.deleteTransactionDb(TransactionsCompanion(id: Value(id)));
    } catch (e) {
      print('error deleting Transaction from database');
    }
  }

  //CashCategories
  Future<List<CashBookCategory>> getDbCashInCategories() async {
    try {
      final _cashInCategories = await db.getCashInCategories;
      return _cashInCategories;
    } catch (e) {
      print('Error getting cash in categories from database : $e');
      return [];
    }
  }

  Future<List<CashBookCategory>> getDbCashOutCategories() async {
    try {
      final _cashOutCategories = await db.getCashOutCategories;
      return _cashOutCategories;
    } catch (e) {
      print('Error getting cash out categories from database : $e');
      return [];
    }
  }

  Future<FunctionResponse> addDbCashCategory({
    required int id,
    required String title,
    required bool isCashIn,
  }) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final _catId = await db.addCashCategory(CashBookCategoriesCompanion(
        id: id == null ? const Value.absent() : Value(id),
        title: Value(title),
        isCashIn: Value(isCashIn),
      ));

      _fResponse.data = _catId;
      _fResponse.success = true;
      _fResponse.message = 'Added category to database';
    } catch (e) {
      _fResponse.message = 'error adding cash category $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> updateDbCashCategory({
    required int id,
    required String title,
    required bool isCashIn,
  }) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      await db.updateCashCategory(CashBookCategoriesCompanion(
        id: Value(id),
        title: Value(title),
        isCashIn: Value(isCashIn),
      ));

      _fResponse.success = true;
      _fResponse.message = 'Successfully Edited Category from database';
    } catch (e) {
      _fResponse.message = 'Error Editing Category from database : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> deleteDbCategory({required int id}) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      await db.deleteCategoryDb(CashBookCategoriesCompanion(id: Value(id)));

      _fResponse.success = true;
      _fResponse.message = 'Delete from database successful';
    } catch (e) {
      _fResponse.message = 'Error deleting from database : $e';
    }
    return _fResponse;
  }

  //Payment Modes
  Future<List<PaymentMode>> getDbPaymentModes() async {
    try {
      final _dbPaymentModes = await db.getAllPaymentModes;
      return _dbPaymentModes;
    } catch (e) {
      print('Error getting Payment Modes from databae : $e');
      return [];
    }
  }

  Future<FunctionResponse> addDbPaymentMode({
    required int id,
    required String title,
  }) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      final int _paymentModeId = await db.addPaymentMode(PaymentModesCompanion(
        id: Value(id),
        title: Value(title),
      ));
      _fResponse.data = _paymentModeId;
      _fResponse.success = true;
      _fResponse.message = 'Payment Mode added to database';
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Erorr adding Payment Mode in Database $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> updateDbPaymentMode({
    required int id,
    required String title,
  }) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      await db.updatePaymentModeDb(PaymentModesCompanion(
        id: Value(id),
        title: Value(title),
      ));
      _fResponse.success = true;
      _fResponse.message = 'Successfully Edited Payment Mode from database';
    } catch (e) {
      _fResponse.message = 'Error Editing Payment Mode from database : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> deleteDbPaymentMode({required int id}) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      await db.deletePaymentModeDb(PaymentModesCompanion(id: Value(id)));

      _fResponse.success = true;
      _fResponse.message = 'Delete from database successful';
    } catch (e) {
      _fResponse.message = 'Error deleting from database : $e';
    }
    return _fResponse;
  }

  //Remarks

  Future<FunctionResponse> getDbRemarks() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final List<Remark> remarks = await db.getAllRemarks;
      _fResponse.success = true;
      _fResponse.message = 'got remarks from db';
      _fResponse.data = remarks;
      print(remarks);
      print('${_fResponse.message} count:${remarks.length}');
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error getting remarks from database : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> getDbUnsyncedRemarks() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      List<Remark> remarks = await db.getUnsyncedRemarks;
      _fResponse.success = true;
      _fResponse.message = 'got remarks from db';
      _fResponse.data = remarks;
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error getting remarks from database : $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> addDbRemarks({
    required String? id,
    required int bookId,
    required String title,
    required int useCount,
    required bool isCashIn,
    required bool isSynced,
  }) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      final _remarkId = await db.addOrUpdateRemark(
        RemarksCompanion(
          id: id == null ? const Value.absent() : Value(id),
          bookId: Value(bookId),
          title: Value(title),
          useCount: Value(useCount),
          isCashIn: Value(isCashIn),
          isSynced: Value(isSynced),
        ),
      );

      _fResponse.data = _remarkId;
      _fResponse.success = true;
      _fResponse.message = 'Added Remarks to database';
    } catch (e) {
      _fResponse.message = 'error adding Remarks $e';
    }
    return _fResponse;
  }

  Future<FunctionResponse> deleteDbRemarks({required String id}) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      await db.deleteRemarkDb(RemarksCompanion(id: Value(id)));

      _fResponse.success = true;
      _fResponse.message = 'Delete from database successful';
    } catch (e) {
      _fResponse.message = 'Error deleting from database : $e';
    }
    return _fResponse;
  }

  //get need-sync-status
  Future<FunctionResponse> needSyncStatus() async {
    FunctionResponse fResponse = getIt<FunctionResponse>();
    try {
      List<Transaction> transaction = await _getDbUnsyncedTransactions();
      if (transaction.isEmpty) {
        transaction = await getDbEditedTransactions();
        if (transaction.isEmpty) {
          fResponse.data = false;
        } else {
          fResponse.data = true;
        }
      } else {
        fResponse.data = true;
      }
      fResponse.success = true;
      fResponse.message = 'got need sync status';
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error getting sync status : $e';
    }
    return fResponse;
  }

  //Delete all things
  Future<FunctionResponse> deleteAllDatabase() async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      await db.deleteAllBooks();
      await db.deleteAllTransactions();
      await db.deleteAllCategories();
      await db.deleteAllPaymentModes();
      await db.deleteAllRemarks();
      print('Database deleted succefully');
      _fResponse.success = true;
      _fResponse.message = 'Successfully deleted all database';
    } catch (e) {
      _fResponse.message = 'Error deleting all database : $e';
    }
    return _fResponse;
  }
}
