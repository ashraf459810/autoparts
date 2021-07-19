// To parse this JSON data, do
//
//     final customerLogin = customerLoginFromJson(jsonString);

import 'dart:convert';

import 'package:built_value/built_value.dart';

CustomerLogin customerLoginFromJson(String str) =>
    CustomerLogin.fromJson(json.decode(str));

String customerLoginToJson(CustomerLogin data) => json.encode(data.toJson());

class CustomerLogin {
  CustomerLogin({
    this.id,
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
    this.message,
  });

  @nullable
  int id;
  @nullable
  int version;

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
  String message;

  factory CustomerLogin.fromJson(Map<String, dynamic> json) => CustomerLogin(
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
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "uuid": uuid,
        "objectType": objectType,
        "role": role,
        "mobileNumber": mobileNumber,
        "contactNumber": contactNumber,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "userName": userName,
        "message": message,
      };
}
