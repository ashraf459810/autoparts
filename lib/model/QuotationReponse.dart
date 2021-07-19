// To parse this JSON data, do
//
//     final quotationResponse = quotationResponseFromJson(jsonString);

import 'dart:convert';

QuotationResponse quotationResponseFromJson(String str) =>
    QuotationResponse.fromJson(json.decode(str));

String quotationResponseToJson(QuotationResponse data) =>
    json.encode(data.toJson());

class QuotationResponse {
  QuotationResponse({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.brand,
    this.car,
    this.products,
    this.year,
    this.status,
    this.type,
    this.notes,
    this.message
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;

  Brand brand;
  Brand car;
  List<Brand> products;
  String year;
  String status;

  String type;

  String notes;
  String message;

  factory QuotationResponse.fromJson(Map<String, dynamic> json) =>
      QuotationResponse(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        products:
            List<Brand>.from(json["products"].map((x) => Brand.fromJson(x))),
        year: json["year"],
        status: json["status"],
        type: json["type"],
        notes: json["notes"],
        message: json["message"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "brand": brand.toJson(),
        "car": car.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "year": year,
        "status": status,
        "type": type,
        "notes": notes,
        "message": message
      };
}

class Brand {
  Brand({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.name,
    this.code,
    this.brand,
    this.arabicName,
  });

  int id;
  int version;
  dynamic creationDate;
  dynamic lastModificationDate;
  dynamic uuid;
  dynamic objectType;
  dynamic name;
  dynamic code;
  dynamic brand;
  dynamic arabicName;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        version: json["version"],
        creationDate: json["creationDate"],
        lastModificationDate: json["lastModificationDate"],
        uuid: json["uuid"],
        objectType: json["objectType"],
        name: json["name"],
        code: json["code"],
        brand: json["brand"],
        arabicName: json["arabicName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate,
        "lastModificationDate": lastModificationDate,
        "uuid": uuid,
        "objectType": objectType,
        "name": name,
        "code": code,
        "brand": brand,
        "arabicName": arabicName,
      };
}
