// To parse this JSON data, do
//
//     final createVendorModel = createVendorModelFromJson(jsonString);

import 'dart:convert';

import 'package:built_value/built_value.dart';

CreateVendorModel createVendorModelFromJson(String str) =>
    CreateVendorModel.fromJson(json.decode(str));

String createVendorModelToJson(CreateVendorModel data) =>
    json.encode(data.toJson());

class CreateVendorModel {
  CreateVendorModel(
      {this.mobileNumber,
      this.contactNumber,
      this.fullName,
      this.email,
      this.idNumber,
      this.tradeLicenseNumber,
      this.taxVatNumber,
      this.companyName,
      this.receiveNewsAndUpdatesEmails,
      this.sellerType,
      this.password,
      this.brands,
      this.attachments,
      this.error,
      this.vendorType});

  @nullable
  String mobileNumber;
  @nullable
  String contactNumber;
  @nullable
  String fullName;
  @nullable
  String email;

  @nullable
  String idNumber;
  @nullable
  String tradeLicenseNumber;
  @nullable
  String taxVatNumber;
  @nullable
  String companyName;
  @nullable
  bool receiveNewsAndUpdatesEmails;
  @nullable
  String sellerType;
  @nullable
  String password;
  @nullable
  List<Brands> brands;
  @nullable
  List<Photos> attachments;
  @nullable
  String error;
  @nullable
  String vendorType;

  factory CreateVendorModel.fromJson(Map<String, dynamic> json) =>
      CreateVendorModel(
        mobileNumber: json["mobileNumber"],
        contactNumber: json["contactNumber"],
        fullName: json["fullName"],
        email: json["email"],
        idNumber: json["idNumber"],
        tradeLicenseNumber: json["tradeLicenseNumber"],
        taxVatNumber: json["taxVatNumber"],
        companyName: json["companyName"],
        receiveNewsAndUpdatesEmails: json["receiveNewsAndUpdatesEmails"],
        sellerType: json["sellerType"],
        password: json["password"],
        brands:
            List<Brands>.from(json["brands"].map((x) => Brands.fromJson(x))),
        attachments: List<Photos>.from(
            json["attachments"].map((x) => Brands.fromJson(x))),
            vendorType:json["vendorType"]
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "contactNumber": contactNumber,
        "fullName": fullName,
        "email": email,
        "idNumber": idNumber,
        "tradeLicenseNumber": tradeLicenseNumber,
        "taxVatNumber": taxVatNumber,
        "companyName": companyName,
        "receiveNewsAndUpdatesEmails": receiveNewsAndUpdatesEmails,
        "sellerType": sellerType,
        "password": password,
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "vendorType" : vendorType
      };
}

class Brands {
  Brands({
    this.id,
  });

  @nullable
  int id;

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Photos {
  Photos({
    this.id,
  });

  @nullable
  int id;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
