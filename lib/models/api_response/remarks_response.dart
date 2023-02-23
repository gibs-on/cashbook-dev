// To parse this JSON data, do
//
//     final remarksResponse = remarksResponseFromJson(jsonString);

import 'dart:convert';

List<RemarksResponse> remarksResponseFromJson(String str) =>
    List<RemarksResponse>.from(
        json.decode(str).map((x) => RemarksResponse.fromJson(x)));

String remarksResponseToJson(List<RemarksResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RemarksResponse {
  RemarksResponse({
    this.id,
    this.remark,
    this.bookId,
    this.ledgerbookType,
  });

  String? id;
  String? remark;
  int? bookId;
  String? ledgerbookType;

  factory RemarksResponse.fromJson(Map<String, dynamic> json) =>
      RemarksResponse(
        id: json["id"] ?? '',
        remark: json["remark"] ?? 'undefined',
        bookId: json["bookId"] ?? 0,
        ledgerbookType: json["ledgerbookType"] ?? 'cashin',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "remark": remark,
        "bookId": bookId,
        "ledgerbookType": ledgerbookType,
      };
}
