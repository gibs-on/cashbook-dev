import 'dart:core';

class Transaction {
  int id;
  int bookId;
  String remarks;
  int category;
  double amount;
  int paymentMode;
  DateTime date;
  // double balanceLeft;
  bool isCashIn;
  bool isSynced;
  bool isEdited;
  String? imagePath;
  Transaction({
    required this.id,
    required this.bookId,
    required this.remarks,
    required this.category,
    required this.amount,
    required this.paymentMode,
    required this.date,
    required this.isCashIn,
    required this.imagePath,
    required this.isSynced,
    required this.isEdited,
  });
}
