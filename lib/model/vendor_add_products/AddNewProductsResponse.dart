// To parse this JSON data, do
//
//     final addNewProductsResponse = addNewProductsResponseFromJson(jsonString);

import 'dart:convert';

AddNewProductsResponse addNewProductsResponseFromJson(String str) =>
    AddNewProductsResponse.fromJson(json.decode(str));

String addNewProductsResponseToJson(AddNewProductsResponse data) =>
    json.encode(data.toJson());

class AddNewProductsResponse {
  AddNewProductsResponse({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.product,
    this.brand,
    this.car,
    this.defects,
    this.price,
    this.years,
    this.available,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  Brand product;
  Brand brand;
  Brand car;
  String defects;
  double price;
  List<String> years;
  bool available;

  factory AddNewProductsResponse.fromJson(Map<String, dynamic> json) =>
      AddNewProductsResponse(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        product: Brand.fromJson(json["product"]),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        defects: json["defects"],
        price: json["price"],
        years: List<String>.from(json["years"].map((x) => x)),
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "product": product.toJson(),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "defects": defects,
        "price": price,
        "years": List<dynamic>.from(years.map((x) => x)),
        "available": available,
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
