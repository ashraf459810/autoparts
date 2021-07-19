// To parse this JSON data, do
//
//     final createCustomer = createCustomerFromJson(jsonString);

import 'dart:convert';

import 'package:built_value/built_value.dart';

CreateCustomer createCustomerFromJson(String str) => CreateCustomer.fromJson(json.decode(str));

String createCustomerToJson(CreateCustomer data) => json.encode(data.toJson());

class CreateCustomer {
    CreateCustomer({
        this.mobileNumber,
        this.contactNumber,
        this.fullName,
        this.email,
        this.userName,
        this.password,
        this.message,
    });

  @nullable String mobileNumber;
  @nullable  String contactNumber;
  @nullable  String fullName;
  @nullable  String email;
  @nullable  String userName;
  @nullable  String password;
  @nullable  String message;

    factory CreateCustomer.fromJson(Map<String, dynamic> json) => CreateCustomer(
        mobileNumber: json["mobileNumber"],
        contactNumber: json["contactNumber"],
        fullName: json["fullName"],
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "contactNumber": contactNumber,
        "fullName": fullName,
        "email": email,
        "userName": userName,
        "password": password,
        "message": message,
    };
}
