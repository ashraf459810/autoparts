// To parse this JSON data, do
//
//     final vendorLogin = vendorLoginFromJson(jsonString);

import 'dart:convert';

import 'package:built_value/built_value.dart';

VendorLogin vendorLoginFromJson(String str) =>
    VendorLogin.fromJson(json.decode(str));

String vendorLoginToJson(VendorLogin data) => json.encode(data.toJson());

class VendorLogin {
  VendorLogin(
      {this.id,
      this.version,

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
      this.message});
 @nullable String message;
 @nullable   int id;
 @nullable   int version;
 
  @nullable  String uuid;
  @nullable  String objectType;
  @nullable  String role;
  @nullable  String mobileNumber;
  @nullable  String contactNumber;
 @nullable   String firstName;
 @nullable String lastName;
 @nullable   String email;
 @nullable   String userName;
 @nullable   String idNumber;

  factory VendorLogin.fromJson(Map<String, dynamic> json) => VendorLogin(
        id: json["id"],
        version: json["version"],
        message: json["message"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
  "message" : message,
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
      };
}
