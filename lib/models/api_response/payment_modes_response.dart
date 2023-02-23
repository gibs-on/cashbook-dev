// To parse this JSON data, do
//
//     final paymentModesResponse = paymentModesResponseFromJson(jsonString);

import 'dart:convert';

PaymentModesResponse paymentModesResponseFromJson(String str) =>
    PaymentModesResponse.fromJson(json.decode(str));

String paymentModesResponseToJson(PaymentModesResponse data) =>
    json.encode(data.toJson());

class PaymentModesResponse {
  PaymentModesResponse({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory PaymentModesResponse.fromJson(Map<String, dynamic> json) =>
      PaymentModesResponse(
        id: json["id"],
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
