// To parse this JSON data, do
//
//     final customerInfo = customerInfoFromJson(jsonString);

import 'dart:convert';

CustomerInfo customerInfoFromJson(String str) =>
    CustomerInfo.fromJson(json.decode(str));

String customerInfoToJson(CustomerInfo data) => json.encode(data.toJson());

class CustomerInfo {
  CustomerInfo({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.role,
    this.mobileNumber,
    this.fullName,
    this.email,
    this.message,
  });
  String message;
  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  String role;
  String mobileNumber;
  String fullName;
  String email;

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        role: json["role"],
        mobileNumber: json["mobileNumber"],
        fullName: json["fullName"],
        email: json["email"],
        message: json["message"],
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
        "fullName": fullName,
        "email": email,
        "message": message,
      };
}
