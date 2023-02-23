// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    this.imageUrl,
    this.logo,
    this.custId,
    this.organizationName,
    this.fullnames,
    this.primaryPhone,
    this.secondaryPhone,
    this.primaryEmail,
    this.secondaryEmail,
    this.website,
    this.imageFile,
    this.city,
    this.address,
    this.addressCode,
    this.country,
    this.location,
    this.businessType,
  });

  String? imageUrl;
  String? logo;
  String? custId;
  String? organizationName;
  String? fullnames;
  String? primaryPhone;
  dynamic secondaryPhone;
  String? primaryEmail;
  dynamic secondaryEmail;
  dynamic website;
  dynamic imageFile;
  dynamic city;
  dynamic address;
  dynamic addressCode;
  String? country;
  dynamic location;
  dynamic businessType;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        imageUrl: json["imageUrl"] ?? '',
        logo: json["logo"] ?? '',
        custId: json["custId"] ?? '',
        organizationName: json["organizationName"] ?? '',
        fullnames: json["fullnames"] ?? '',
        primaryPhone: json["primaryPhone"] ?? '',
        secondaryPhone: json["secondaryPhone"] ?? '',
        primaryEmail: json["primaryEmail"] ?? '',
        secondaryEmail: json["secondaryEmail"] ?? '',
        website: json["website"] ?? '',
        imageFile: json["imageFile"] ?? '',
        city: json["city"] ?? '',
        address: json["address"] ?? '',
        addressCode: json["addressCode"] ?? '',
        country: json["country"] ?? '',
        location: json["location"] ?? '',
        businessType: json["businessType"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "logo": logo,
        "custId": custId,
        "organizationName": organizationName,
        "fullnames": fullnames,
        "primaryPhone": primaryPhone,
        "secondaryPhone": secondaryPhone,
        "primaryEmail": primaryEmail,
        "secondaryEmail": secondaryEmail,
        "website": website,
        "imageFile": imageFile,
        "city": city,
        "address": address,
        "addressCode": addressCode,
        "country": country,
        "location": location,
        "businessType": businessType,
      };
}
