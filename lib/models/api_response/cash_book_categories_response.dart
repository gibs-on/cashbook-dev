// To parse this JSON data, do
//
//     final cashBookCategoriesResponse = cashBookCategoriesResponseFromJson(jsonString);

import 'dart:convert';

CashBookCategoriesResponse cashBookCategoriesResponseFromJson(String str) =>
    CashBookCategoriesResponse.fromJson(json.decode(str));

String cashBookCategoriesResponseToJson(CashBookCategoriesResponse data) =>
    json.encode(data.toJson());

class CashBookCategoriesResponse {
  CashBookCategoriesResponse({
    this.id,
    this.categoryname,
  });

  int? id;
  String? categoryname;

  factory CashBookCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CashBookCategoriesResponse(
        id: json["id"],
        categoryname: json["categoryname"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryname": categoryname,
      };
}
