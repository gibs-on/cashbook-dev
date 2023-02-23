// To parse this JSON data, do
//
//     final transactionsResponse = transactionsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

TransactionsResponse transactionsResponseFromJson(String str) =>
    TransactionsResponse.fromJson(json.decode(str));

String transactionsResponseToJson(TransactionsResponse data) =>
    json.encode(data.toJson());

class TransactionsResponse {
  TransactionsResponse({
    this.id,
    this.cashbookCategoryName,
    this.paymentModeName,
    this.createdOn,
    this.createdBy,
    this.editedBy,
    this.editedOn,
    this.ledgerbookType,
    this.transactiondate,
    this.transactiontime,
    this.cashbookCategoryid,
    this.amount,
    this.remarks,
    this.attachments,
    this.paymentModeId,
  });

  int? id;
  String? cashbookCategoryName;
  String? paymentModeName;
  String? createdOn;
  dynamic createdBy;
  dynamic editedBy;
  String? editedOn;
  String? ledgerbookType;
  String? transactiondate;
  String? transactiontime;
  int? cashbookCategoryid;
  int? amount;
  String? remarks;
  List<dynamic>? attachments;
  int? paymentModeId;

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) =>
      TransactionsResponse(
        id: json["id"],
        cashbookCategoryName: json["cashbookCategoryName"] ?? 'undefined',
        paymentModeName: json["paymentModeName"] ?? 'undefined',
        createdOn: json["createdOn"] ?? 'undefined',
        createdBy: json["createdBy"] ?? 'undefined',
        editedBy: json["editedBy"] ?? 'undefined',
        editedOn: json["editedOn"] ?? 'undefined',
        ledgerbookType: json["ledgerbookType"] ?? 'undefined',
        transactiondate: json["transactiondate"] ??
            DateFormat('M/d/y').format(DateTime.now()),
        transactiontime: json["transactiontime"] ??
            DateFormat('kk:mm').format(DateTime.now()),
        cashbookCategoryid: json["cashbookCategoryid"],
        amount: json["amount"] ?? 0,
        remarks: json["remarks"] ?? 'undefined',
        attachments: json["attachments"] ?? [''],
        paymentModeId: json["paymentModeId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cashbookCategoryName": cashbookCategoryName,
        "paymentModeName": paymentModeName,
        "createdOn": createdOn,
        "createdBy": createdBy,
        "editedBy": editedBy,
        "editedOn": editedOn,
        "ledgerbookType": ledgerbookType,
        "transactiondate": transactiondate,
        "transactiontime": transactiontime,
        "cashbookCategoryid": cashbookCategoryid,
        "amount": amount,
        "remarks": remarks,
        "attachments": attachments,
        "paymentModeId": paymentModeId,
      };
}
