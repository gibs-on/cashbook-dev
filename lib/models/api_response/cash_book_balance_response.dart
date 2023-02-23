// To parse this JSON data, do
//
//     final cashBookBalanceResponse = cashBookBalanceResponseFromJson(jsonString);

import 'dart:convert';

CashBookBalanceResponse cashBookBalanceResponseFromJson(String str) =>
    CashBookBalanceResponse.fromJson(json.decode(str));

String cashBookBalanceResponseToJson(CashBookBalanceResponse data) =>
    json.encode(data.toJson());

class CashBookBalanceResponse {
  CashBookBalanceResponse({
    this.netbalances,
    this.openingBalance,
    this.totalcashIn,
    this.totalcashOut,
  });

  double? netbalances;
  double? openingBalance;
  double? totalcashIn;
  double? totalcashOut;

  factory CashBookBalanceResponse.fromJson(Map<String, dynamic> json) =>
      CashBookBalanceResponse(
        netbalances: double.tryParse(json["netbalances"]) ?? 0,
        openingBalance: double.tryParse(json["openingBalance"]) ?? 0,
        totalcashIn: (json["totalcashIn"] as int).toDouble(),
        totalcashOut: (json["totalcashOut"] as int).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "netbalances": netbalances,
        "openingBalance": openingBalance,
        "totalcashIn": totalcashIn,
        "totalcashOut": totalcashOut,
      };
}
