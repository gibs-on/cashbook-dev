// To parse this JSON data, do
//
//     final autResponse = autResponseFromJson(jsonString);

import 'dart:convert';

class AuthResponse {
  AuthResponse(
      {this.success,
      this.token,
      this.expiration,
      this.userId,
      this.fullname,
      this.businessId,
      this.businessname,
      this.isVerified});

  bool? success;
  String? token;
  DateTime? expiration;
  String? userId;
  String? fullname;
  String? businessId;
  String? businessname;
  bool? isVerified;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        success: json["success"] ?? false,
        token: json["token"] ?? '',
        expiration: json["expiration"] == null
            ? DateTime.now()
            : DateTime.parse(json["expiration"]),
        userId: json["userId"] ?? '',
        fullname: json["fullname"] ?? '',
        businessId: json["businessId"] ?? '',
        businessname: json["businessname"] ?? '',
        isVerified: json["isVerified"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "expiration": expiration?.toIso8601String(),
        "userId": userId,
        "fullname": fullname,
        "businessId": businessId,
        "businessname": businessname,
        "isVerified": isVerified,
      };
}
