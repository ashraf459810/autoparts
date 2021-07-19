// To parse this JSON data, do
//
//     final vendoresponse = vendoresponseFromJson(jsonString);

import 'dart:convert';

import 'package:built_value/built_value.dart';

Vendoresponse vendoresponseFromJson(String str) =>
    Vendoresponse.fromJson(json.decode(str));

String vendoresponseToJson(Vendoresponse data) => json.encode(data.toJson());

class Vendoresponse {
  Vendoresponse({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.role,
    this.mobileNumber,
    this.contactNumber,
    this.firstName,
    this.lastName,
    this.email,
    this.userName,
    this.idNumber,
    this.message,
    this.tradeLicenseNumber,
    this.taxVatNumber,
    this.companyName,
    this.receiveNewsAndUpdatesEmails,
  });

  @nullable
  int id;
  @nullable
  int version;
  @nullable
  DateTime creationDate;
  @nullable
  DateTime lastModificationDate;
  @nullable
  String uuid;
  @nullable
  String objectType;
  @nullable
  String role;
  @nullable
  String mobileNumber;
  @nullable
  String contactNumber;
  @nullable
  String firstName;
  @nullable
  String lastName;
  @nullable
  String email;
  @nullable
  String userName;
  @nullable
  String idNumber;
  @nullable
  String message;
  @nullable
  String tradeLicenseNumber;
  @nullable
  String taxVatNumber;
  @nullable
  String companyName;
  @nullable
  bool receiveNewsAndUpdatesEmails;

  factory Vendoresponse.fromJson(Map<String, dynamic> json) => Vendoresponse(
        id: json["id"],
        version: json["version"],
        uuid: json["uuid"],
        objectType: json["objectType"],
        role: json["role"],
        mobileNumber: json["mobileNumber"],
        contactNumber: json["contactNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        userName: json["userName"],
        idNumber: json["idNumber"],
        message: json["message"],
        tradeLicenseNumber: json["tradeLicenseNumber"],
        taxVatNumber: json["taxVatNumber"],
        companyName: json["companyName"],
        receiveNewsAndUpdatesEmails: json["receiveNewsAndUpdatesEmails"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "role": role,
        "mobileNumber": mobileNumber,
        "contactNumber": contactNumber,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "userName": userName,
        "idNumber": idNumber,
        "message": message,
        "tradeLicenseNumber": tradeLicenseNumber,
        "taxVatNumber": taxVatNumber,
        "companyName": companyName,
        "receiveNewsAndUpdatesEmails": receiveNewsAndUpdatesEmails,
      };
}
