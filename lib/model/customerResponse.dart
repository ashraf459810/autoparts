// To parse this JSON data, do
//
//     final customerResponse = customerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:built_value/built_value.dart';

CustomerResponse customerResponseFromJson(String str) =>
    CustomerResponse.fromJson(json.decode(str));

String customerResponseToJson(CustomerResponse data) =>
    json.encode(data.toJson());

class CustomerResponse {
  CustomerResponse({
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
  String message;
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

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      CustomerResponse(
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
