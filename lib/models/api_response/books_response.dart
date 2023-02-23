// To parse this JSON data, do
//
//     final booksResponse = booksResponseFromJson(jsonString);

import 'dart:convert';

BooksResponse booksResponseFromJson(String str) =>
    BooksResponse.fromJson(json.decode(str));

String booksResponseToJson(BooksResponse data) => json.encode(data.toJson());

class BooksResponse {
  BooksResponse({
    this.bookName,
    this.customer,
    this.id,
    this.shortname,
  });

  String? bookName;
  String? customer;
  int? id;
  String? shortname;

  factory BooksResponse.fromJson(Map<String, dynamic> json) => BooksResponse(
        bookName: json["bookName"] ?? '',
        customer: json["customer"] ?? '',
        id: json["id"],
        shortname: json["shortname"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "bookName": bookName,
        "customer": customer,
        "id": id,
        "shortname": shortname,
      };
}
