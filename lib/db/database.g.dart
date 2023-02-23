// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final int bookId;
  final String remarks;
  final int category;
  final double amount;
  final int paymentMode;
  final DateTime date;
  final bool isCashIn;
  final String? imagePath;
  final bool isSynced;
  final bool isEdited;
  Transaction(
      {required this.id,
      required this.bookId,
      required this.remarks,
      required this.category,
      required this.amount,
      required this.paymentMode,
      required this.date,
      required this.isCashIn,
      this.imagePath,
      required this.isSynced,
      required this.isEdited});
  factory Transaction.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Transaction(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      bookId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}book_id'])!,
      remarks: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remarks'])!,
      category: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      paymentMode: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payment_mode'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      isCashIn: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_cash_in'])!,
      imagePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_path']),
      isSynced: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_synced'])!,
      isEdited: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_edited'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_id'] = Variable<int>(bookId);
    map['remarks'] = Variable<String>(remarks);
    map['category'] = Variable<int>(category);
    map['amount'] = Variable<double>(amount);
    map['payment_mode'] = Variable<int>(paymentMode);
    map['date'] = Variable<DateTime>(date);
    map['is_cash_in'] = Variable<bool>(isCashIn);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String?>(imagePath);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_edited'] = Variable<bool>(isEdited);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      bookId: Value(bookId),
      remarks: Value(remarks),
      category: Value(category),
      amount: Value(amount),
      paymentMode: Value(paymentMode),
      date: Value(date),
      isCashIn: Value(isCashIn),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      isSynced: Value(isSynced),
      isEdited: Value(isEdited),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      bookId: serializer.fromJson<int>(json['bookId']),
      remarks: serializer.fromJson<String>(json['remarks']),
      category: serializer.fromJson<int>(json['category']),
      amount: serializer.fromJson<double>(json['amount']),
      paymentMode: serializer.fromJson<int>(json['paymentMode']),
      date: serializer.fromJson<DateTime>(json['date']),
      isCashIn: serializer.fromJson<bool>(json['isCashIn']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isEdited: serializer.fromJson<bool>(json['isEdited']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookId': serializer.toJson<int>(bookId),
      'remarks': serializer.toJson<String>(remarks),
      'category': serializer.toJson<int>(category),
      'amount': serializer.toJson<double>(amount),
      'paymentMode': serializer.toJson<int>(paymentMode),
      'date': serializer.toJson<DateTime>(date),
      'isCashIn': serializer.toJson<bool>(isCashIn),
      'imagePath': serializer.toJson<String?>(imagePath),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isEdited': serializer.toJson<bool>(isEdited),
    };
  }

  Transaction copyWith(
          {int? id,
          int? bookId,
          String? remarks,
          int? category,
          double? amount,
          int? paymentMode,
          DateTime? date,
          bool? isCashIn,
          String? imagePath,
          bool? isSynced,
          bool? isEdited}) =>
      Transaction(
        id: id ?? this.id,
        bookId: bookId ?? this.bookId,
        remarks: remarks ?? this.remarks,
        category: category ?? this.category,
        amount: amount ?? this.amount,
        paymentMode: paymentMode ?? this.paymentMode,
        date: date ?? this.date,
        isCashIn: isCashIn ?? this.isCashIn,
        imagePath: imagePath ?? this.imagePath,
        isSynced: isSynced ?? this.isSynced,
        isEdited: isEdited ?? this.isEdited,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('remarks: $remarks, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('paymentMode: $paymentMode, ')
          ..write('date: $date, ')
          ..write('isCashIn: $isCashIn, ')
          ..write('imagePath: $imagePath, ')
          ..write('isSynced: $isSynced, ')
          ..write('isEdited: $isEdited')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bookId, remarks, category, amount,
      paymentMode, date, isCashIn, imagePath, isSynced, isEdited);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.bookId == this.bookId &&
          other.remarks == this.remarks &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.paymentMode == this.paymentMode &&
          other.date == this.date &&
          other.isCashIn == this.isCashIn &&
          other.imagePath == this.imagePath &&
          other.isSynced == this.isSynced &&
          other.isEdited == this.isEdited);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<int> bookId;
  final Value<String> remarks;
  final Value<int> category;
  final Value<double> amount;
  final Value<int> paymentMode;
  final Value<DateTime> date;
  final Value<bool> isCashIn;
  final Value<String?> imagePath;
  final Value<bool> isSynced;
  final Value<bool> isEdited;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.bookId = const Value.absent(),
    this.remarks = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentMode = const Value.absent(),
    this.date = const Value.absent(),
    this.isCashIn = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isEdited = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int bookId,
    required String remarks,
    required int category,
    required double amount,
    required int paymentMode,
    required DateTime date,
    required bool isCashIn,
    this.imagePath = const Value.absent(),
    required bool isSynced,
    required bool isEdited,
  })  : bookId = Value(bookId),
        remarks = Value(remarks),
        category = Value(category),
        amount = Value(amount),
        paymentMode = Value(paymentMode),
        date = Value(date),
        isCashIn = Value(isCashIn),
        isSynced = Value(isSynced),
        isEdited = Value(isEdited);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<int>? bookId,
    Expression<String>? remarks,
    Expression<int>? category,
    Expression<double>? amount,
    Expression<int>? paymentMode,
    Expression<DateTime>? date,
    Expression<bool>? isCashIn,
    Expression<String?>? imagePath,
    Expression<bool>? isSynced,
    Expression<bool>? isEdited,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookId != null) 'book_id': bookId,
      if (remarks != null) 'remarks': remarks,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (paymentMode != null) 'payment_mode': paymentMode,
      if (date != null) 'date': date,
      if (isCashIn != null) 'is_cash_in': isCashIn,
      if (imagePath != null) 'image_path': imagePath,
      if (isSynced != null) 'is_synced': isSynced,
      if (isEdited != null) 'is_edited': isEdited,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? bookId,
      Value<String>? remarks,
      Value<int>? category,
      Value<double>? amount,
      Value<int>? paymentMode,
      Value<DateTime>? date,
      Value<bool>? isCashIn,
      Value<String?>? imagePath,
      Value<bool>? isSynced,
      Value<bool>? isEdited}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      remarks: remarks ?? this.remarks,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      paymentMode: paymentMode ?? this.paymentMode,
      date: date ?? this.date,
      isCashIn: isCashIn ?? this.isCashIn,
      imagePath: imagePath ?? this.imagePath,
      isSynced: isSynced ?? this.isSynced,
      isEdited: isEdited ?? this.isEdited,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<int>(bookId.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paymentMode.present) {
      map['payment_mode'] = Variable<int>(paymentMode.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isCashIn.present) {
      map['is_cash_in'] = Variable<bool>(isCashIn.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String?>(imagePath.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isEdited.present) {
      map['is_edited'] = Variable<bool>(isEdited.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('remarks: $remarks, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('paymentMode: $paymentMode, ')
          ..write('date: $date, ')
          ..write('isCashIn: $isCashIn, ')
          ..write('imagePath: $imagePath, ')
          ..write('isSynced: $isSynced, ')
          ..write('isEdited: $isEdited')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TransactionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  late final GeneratedColumn<int?> bookId = GeneratedColumn<int?>(
      'book_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _remarksMeta = const VerificationMeta('remarks');
  late final GeneratedColumn<String?> remarks = GeneratedColumn<String?>(
      'remarks', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<int?> category = GeneratedColumn<int?>(
      'category', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double?> amount = GeneratedColumn<double?>(
      'amount', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _paymentModeMeta =
      const VerificationMeta('paymentMode');
  late final GeneratedColumn<int?> paymentMode = GeneratedColumn<int?>(
      'payment_mode', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _isCashInMeta = const VerificationMeta('isCashIn');
  late final GeneratedColumn<bool?> isCashIn = GeneratedColumn<bool?>(
      'is_cash_in', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_cash_in IN (0, 1))');
  final VerificationMeta _imagePathMeta = const VerificationMeta('imagePath');
  late final GeneratedColumn<String?> imagePath = GeneratedColumn<String?>(
      'image_path', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _isSyncedMeta = const VerificationMeta('isSynced');
  late final GeneratedColumn<bool?> isSynced = GeneratedColumn<bool?>(
      'is_synced', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_synced IN (0, 1))');
  final VerificationMeta _isEditedMeta = const VerificationMeta('isEdited');
  late final GeneratedColumn<bool?> isEdited = GeneratedColumn<bool?>(
      'is_edited', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_edited IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        bookId,
        remarks,
        category,
        amount,
        paymentMode,
        date,
        isCashIn,
        imagePath,
        isSynced,
        isEdited
      ];
  @override
  String get aliasedName => _alias ?? 'transactions';
  @override
  String get actualTableName => 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('book_id')) {
      context.handle(_bookIdMeta,
          bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta));
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks']!, _remarksMeta));
    } else if (isInserting) {
      context.missing(_remarksMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_mode')) {
      context.handle(
          _paymentModeMeta,
          paymentMode.isAcceptableOrUnknown(
              data['payment_mode']!, _paymentModeMeta));
    } else if (isInserting) {
      context.missing(_paymentModeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_cash_in')) {
      context.handle(_isCashInMeta,
          isCashIn.isAcceptableOrUnknown(data['is_cash_in']!, _isCashInMeta));
    } else if (isInserting) {
      context.missing(_isCashInMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    } else if (isInserting) {
      context.missing(_isSyncedMeta);
    }
    if (data.containsKey('is_edited')) {
      context.handle(_isEditedMeta,
          isEdited.isAcceptableOrUnknown(data['is_edited']!, _isEditedMeta));
    } else if (isInserting) {
      context.missing(_isEditedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Transaction.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(_db, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  Book({required this.id, required this.title});
  factory Book.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Book(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Book copyWith({int? id, String? title}) => Book(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book && other.id == this.id && other.title == this.title);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  BooksCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BooksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? 'books';
  @override
  String get actualTableName => 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Book.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(_db, alias);
  }
}

class CashBookCategory extends DataClass
    implements Insertable<CashBookCategory> {
  final int id;
  final String title;
  final bool isCashIn;
  CashBookCategory(
      {required this.id, required this.title, required this.isCashIn});
  factory CashBookCategory.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CashBookCategory(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      isCashIn: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_cash_in'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['is_cash_in'] = Variable<bool>(isCashIn);
    return map;
  }

  CashBookCategoriesCompanion toCompanion(bool nullToAbsent) {
    return CashBookCategoriesCompanion(
      id: Value(id),
      title: Value(title),
      isCashIn: Value(isCashIn),
    );
  }

  factory CashBookCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashBookCategory(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      isCashIn: serializer.fromJson<bool>(json['isCashIn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'isCashIn': serializer.toJson<bool>(isCashIn),
    };
  }

  CashBookCategory copyWith({int? id, String? title, bool? isCashIn}) =>
      CashBookCategory(
        id: id ?? this.id,
        title: title ?? this.title,
        isCashIn: isCashIn ?? this.isCashIn,
      );
  @override
  String toString() {
    return (StringBuffer('CashBookCategory(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isCashIn: $isCashIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, isCashIn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashBookCategory &&
          other.id == this.id &&
          other.title == this.title &&
          other.isCashIn == this.isCashIn);
}

class CashBookCategoriesCompanion extends UpdateCompanion<CashBookCategory> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> isCashIn;
  const CashBookCategoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isCashIn = const Value.absent(),
  });
  CashBookCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required bool isCashIn,
  })  : title = Value(title),
        isCashIn = Value(isCashIn);
  static Insertable<CashBookCategory> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? isCashIn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (isCashIn != null) 'is_cash_in': isCashIn,
    });
  }

  CashBookCategoriesCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<bool>? isCashIn}) {
    return CashBookCategoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isCashIn: isCashIn ?? this.isCashIn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isCashIn.present) {
      map['is_cash_in'] = Variable<bool>(isCashIn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashBookCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isCashIn: $isCashIn')
          ..write(')'))
        .toString();
  }
}

class $CashBookCategoriesTable extends CashBookCategories
    with TableInfo<$CashBookCategoriesTable, CashBookCategory> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CashBookCategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _isCashInMeta = const VerificationMeta('isCashIn');
  late final GeneratedColumn<bool?> isCashIn = GeneratedColumn<bool?>(
      'is_cash_in', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_cash_in IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [id, title, isCashIn];
  @override
  String get aliasedName => _alias ?? 'cash_book_categories';
  @override
  String get actualTableName => 'cash_book_categories';
  @override
  VerificationContext validateIntegrity(Insertable<CashBookCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_cash_in')) {
      context.handle(_isCashInMeta,
          isCashIn.isAcceptableOrUnknown(data['is_cash_in']!, _isCashInMeta));
    } else if (isInserting) {
      context.missing(_isCashInMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashBookCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CashBookCategory.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CashBookCategoriesTable createAlias(String alias) {
    return $CashBookCategoriesTable(_db, alias);
  }
}

class PaymentMode extends DataClass implements Insertable<PaymentMode> {
  final int id;
  final String title;
  PaymentMode({required this.id, required this.title});
  factory PaymentMode.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PaymentMode(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  PaymentModesCompanion toCompanion(bool nullToAbsent) {
    return PaymentModesCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory PaymentMode.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentMode(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  PaymentMode copyWith({int? id, String? title}) => PaymentMode(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('PaymentMode(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentMode &&
          other.id == this.id &&
          other.title == this.title);
}

class PaymentModesCompanion extends UpdateCompanion<PaymentMode> {
  final Value<int> id;
  final Value<String> title;
  const PaymentModesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  PaymentModesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<PaymentMode> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  PaymentModesCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return PaymentModesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentModesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $PaymentModesTable extends PaymentModes
    with TableInfo<$PaymentModesTable, PaymentMode> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PaymentModesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? 'payment_modes';
  @override
  String get actualTableName => 'payment_modes';
  @override
  VerificationContext validateIntegrity(Insertable<PaymentMode> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentMode map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PaymentMode.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PaymentModesTable createAlias(String alias) {
    return $PaymentModesTable(_db, alias);
  }
}

class Remark extends DataClass implements Insertable<Remark> {
  final String id;
  final int bookId;
  final String title;
  final int useCount;
  final bool isCashIn;
  final bool isSynced;
  Remark(
      {required this.id,
      required this.bookId,
      required this.title,
      required this.useCount,
      required this.isCashIn,
      required this.isSynced});
  factory Remark.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Remark(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      bookId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}book_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      useCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}use_count'])!,
      isCashIn: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_cash_in'])!,
      isSynced: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_synced'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['book_id'] = Variable<int>(bookId);
    map['title'] = Variable<String>(title);
    map['use_count'] = Variable<int>(useCount);
    map['is_cash_in'] = Variable<bool>(isCashIn);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  RemarksCompanion toCompanion(bool nullToAbsent) {
    return RemarksCompanion(
      id: Value(id),
      bookId: Value(bookId),
      title: Value(title),
      useCount: Value(useCount),
      isCashIn: Value(isCashIn),
      isSynced: Value(isSynced),
    );
  }

  factory Remark.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Remark(
      id: serializer.fromJson<String>(json['id']),
      bookId: serializer.fromJson<int>(json['bookId']),
      title: serializer.fromJson<String>(json['title']),
      useCount: serializer.fromJson<int>(json['useCount']),
      isCashIn: serializer.fromJson<bool>(json['isCashIn']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'bookId': serializer.toJson<int>(bookId),
      'title': serializer.toJson<String>(title),
      'useCount': serializer.toJson<int>(useCount),
      'isCashIn': serializer.toJson<bool>(isCashIn),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Remark copyWith(
          {String? id,
          int? bookId,
          String? title,
          int? useCount,
          bool? isCashIn,
          bool? isSynced}) =>
      Remark(
        id: id ?? this.id,
        bookId: bookId ?? this.bookId,
        title: title ?? this.title,
        useCount: useCount ?? this.useCount,
        isCashIn: isCashIn ?? this.isCashIn,
        isSynced: isSynced ?? this.isSynced,
      );
  @override
  String toString() {
    return (StringBuffer('Remark(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('title: $title, ')
          ..write('useCount: $useCount, ')
          ..write('isCashIn: $isCashIn, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, bookId, title, useCount, isCashIn, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Remark &&
          other.id == this.id &&
          other.bookId == this.bookId &&
          other.title == this.title &&
          other.useCount == this.useCount &&
          other.isCashIn == this.isCashIn &&
          other.isSynced == this.isSynced);
}

class RemarksCompanion extends UpdateCompanion<Remark> {
  final Value<String> id;
  final Value<int> bookId;
  final Value<String> title;
  final Value<int> useCount;
  final Value<bool> isCashIn;
  final Value<bool> isSynced;
  const RemarksCompanion({
    this.id = const Value.absent(),
    this.bookId = const Value.absent(),
    this.title = const Value.absent(),
    this.useCount = const Value.absent(),
    this.isCashIn = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  RemarksCompanion.insert({
    required String id,
    required int bookId,
    required String title,
    required int useCount,
    required bool isCashIn,
    required bool isSynced,
  })  : id = Value(id),
        bookId = Value(bookId),
        title = Value(title),
        useCount = Value(useCount),
        isCashIn = Value(isCashIn),
        isSynced = Value(isSynced);
  static Insertable<Remark> custom({
    Expression<String>? id,
    Expression<int>? bookId,
    Expression<String>? title,
    Expression<int>? useCount,
    Expression<bool>? isCashIn,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookId != null) 'book_id': bookId,
      if (title != null) 'title': title,
      if (useCount != null) 'use_count': useCount,
      if (isCashIn != null) 'is_cash_in': isCashIn,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  RemarksCompanion copyWith(
      {Value<String>? id,
      Value<int>? bookId,
      Value<String>? title,
      Value<int>? useCount,
      Value<bool>? isCashIn,
      Value<bool>? isSynced}) {
    return RemarksCompanion(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      title: title ?? this.title,
      useCount: useCount ?? this.useCount,
      isCashIn: isCashIn ?? this.isCashIn,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<int>(bookId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (useCount.present) {
      map['use_count'] = Variable<int>(useCount.value);
    }
    if (isCashIn.present) {
      map['is_cash_in'] = Variable<bool>(isCashIn.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemarksCompanion(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('title: $title, ')
          ..write('useCount: $useCount, ')
          ..write('isCashIn: $isCashIn, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $RemarksTable extends Remarks with TableInfo<$RemarksTable, Remark> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RemarksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  late final GeneratedColumn<int?> bookId = GeneratedColumn<int?>(
      'book_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _useCountMeta = const VerificationMeta('useCount');
  late final GeneratedColumn<int?> useCount = GeneratedColumn<int?>(
      'use_count', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _isCashInMeta = const VerificationMeta('isCashIn');
  late final GeneratedColumn<bool?> isCashIn = GeneratedColumn<bool?>(
      'is_cash_in', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_cash_in IN (0, 1))');
  final VerificationMeta _isSyncedMeta = const VerificationMeta('isSynced');
  late final GeneratedColumn<bool?> isSynced = GeneratedColumn<bool?>(
      'is_synced', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_synced IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [id, bookId, title, useCount, isCashIn, isSynced];
  @override
  String get aliasedName => _alias ?? 'remarks';
  @override
  String get actualTableName => 'remarks';
  @override
  VerificationContext validateIntegrity(Insertable<Remark> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('book_id')) {
      context.handle(_bookIdMeta,
          bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta));
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('use_count')) {
      context.handle(_useCountMeta,
          useCount.isAcceptableOrUnknown(data['use_count']!, _useCountMeta));
    } else if (isInserting) {
      context.missing(_useCountMeta);
    }
    if (data.containsKey('is_cash_in')) {
      context.handle(_isCashInMeta,
          isCashIn.isAcceptableOrUnknown(data['is_cash_in']!, _isCashInMeta));
    } else if (isInserting) {
      context.missing(_isCashInMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    } else if (isInserting) {
      context.missing(_isSyncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Remark map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Remark.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RemarksTable createAlias(String alias) {
    return $RemarksTable(_db, alias);
  }
}

abstract class _$MyAppDb extends GeneratedDatabase {
  _$MyAppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $BooksTable books = $BooksTable(this);
  late final $CashBookCategoriesTable cashBookCategories =
      $CashBookCategoriesTable(this);
  late final $PaymentModesTable paymentModes = $PaymentModesTable(this);
  late final $RemarksTable remarks = $RemarksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [transactions, books, cashBookCategories, paymentModes, remarks];
}
