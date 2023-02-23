import 'dart:io';

import 'package:drift/drift.dart';
// These imports are only needed to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId => integer()();
  TextColumn get remarks => text()();
  IntColumn get category => integer()();
  RealColumn get amount => real()();
  IntColumn get paymentMode => integer()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isCashIn => boolean()();
  TextColumn get imagePath => text().nullable()();
  BoolColumn get isSynced => boolean()();
  BoolColumn get isEdited => boolean()();
}

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

@DataClassName("CashBookCategory")
class CashBookCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  BoolColumn get isCashIn => boolean()();
}

class PaymentModes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

class Remarks extends Table {
  TextColumn get id => text()();
  IntColumn get bookId => integer()();
  TextColumn get title => text()();
  IntColumn get useCount => integer()();
  BoolColumn get isCashIn => boolean()();
  BoolColumn get isSynced => boolean()();
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Transactions,
    Books,
    CashBookCategories,
    PaymentModes,
    Remarks,
  ],
)
class MyAppDb extends _$MyAppDb {
  MyAppDb() : super(_openConnection()); // Class Constructor

//TODO-update schema number
  @override
  int get schemaVersion => 2; // Schemea getter

  // loads all transaction entries once
  Future<List<Transaction>> get getAllTransactionEntries =>
      (select(transactions)
            ..orderBy([
              (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc)
            ]))
          .get();

  // get Unsynced Transaction entries
  Future<List<Transaction>> get getUnsyncedTransactions =>
      (select(transactions)..where((t) => t.isSynced.not())).get();

  // get edited Transaction entries
  Future<List<Transaction>> get getEditedTransactions =>
      (select(transactions)..where((t) => t.isSynced & t.isEdited)).get();

  Future<int> addTransacctionDb(TransactionsCompanion entry) {
    return into(transactions).insert(entry);
  }

  Future updateTransacctionDb(TransactionsCompanion entry) {
    return update(transactions).replace(entry);
  }

  Future deleteTransactionDb(TransactionsCompanion entry) {
    return delete(transactions).delete(entry);
  }

  Future deleteTransactionsByBookId(TransactionsCompanion entry) {
    return (delete(transactions)
          ..where((t) => t.bookId.equals(entry.bookId.value)))
        .go();
  }

  // get all Books entries
  Future<List<Book>> get getAllBookEntries => select(books).get();

  Future<int> addBookDb(BooksCompanion entry) {
    return into(books).insert(entry);
  }

  Future updateBookDb(BooksCompanion entry) {
    return update(books).replace(entry);
  }

  Future deleteBookDb(BooksCompanion entry) {
    (delete(transactions)..where((t) => t.bookId.equals(entry.id.value))).go();
    return delete(books).delete(entry);
  }

  //Categories
  Future<List<CashBookCategory>> get getCashInCategories =>
      (select(cashBookCategories)..where((t) => t.isCashIn)).get();

  Future<List<CashBookCategory>> get getCashOutCategories =>
      (select(cashBookCategories)..where((t) => t.isCashIn.not())).get();

  Future<int> addCashCategory(CashBookCategoriesCompanion entry) {
    return into(cashBookCategories).insert(entry);
  }

  Future updateCashCategory(CashBookCategoriesCompanion entry) {
    return update(cashBookCategories).replace(entry);
  }

  Future deleteCategoryDb(CashBookCategoriesCompanion entry) {
    (delete(cashBookCategories)..where((t) => t.id.equals(entry.id.value)))
        .go();
    return delete(cashBookCategories).delete(entry);
  }

  //PaymentModes
  Future<List<PaymentMode>> get getAllPaymentModes =>
      select(paymentModes).get();

  Future<int> addPaymentMode(PaymentModesCompanion entry) {
    return into(paymentModes).insert(entry);
  }

  Future updatePaymentModeDb(PaymentModesCompanion entry) {
    return update(paymentModes).replace(entry);
  }

  Future deletePaymentModeDb(PaymentModesCompanion entry) {
    (delete(paymentModes)..where((t) => t.id.equals(entry.id.value))).go();
    return delete(paymentModes).delete(entry);
  }

  //Remarks

  // get Unsynced Transaction entries
  Future<List<Remark>> get getUnsyncedRemarks =>
      (select(remarks)..where((t) => t.isSynced.not())).get();

  Future<List<Remark>> get getAllRemarks => select(remarks).get();

  Future<int> addOrUpdateRemark(RemarksCompanion entry) {
    return into(remarks).insertOnConflictUpdate(entry);
  }

  Future deleteRemarkDb(RemarksCompanion entry) {
    (delete(remarks)..where((t) => t.id.equals(entry.id.value))).go();
    return delete(remarks).delete(entry);
  }

  //Delete All Data
  Future deleteAllTransactions() {
    return delete(transactions).go();
  }

  Future deleteAllBooks() {
    return delete(books).go();
  }

  Future deleteAllCategories() {
    return delete(cashBookCategories).go();
  }

  Future deleteAllPaymentModes() {
    return delete(paymentModes).go();
  }

  Future deleteAllRemarks() {
    return delete(remarks).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
