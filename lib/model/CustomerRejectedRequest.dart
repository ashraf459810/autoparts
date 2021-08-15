// To parse this JSON data, do
//
//     final customerRejectedRequest = customerRejectedRequestFromJson(jsonString);

import 'dart:convert';

CustomerRejectedRequest customerRejectedRequestFromJson(String str) =>
    CustomerRejectedRequest.fromJson(json.decode(str));

String customerRejectedRequestToJson(CustomerRejectedRequest data) =>
    json.encode(data.toJson());

class CustomerRejectedRequest {
  CustomerRejectedRequest({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.brand,
    this.car,
    this.product,
    this.price,
    this.ourPercentage,
    this.fullPrice,
    this.daysToDeliver,
    this.notes,
    this.status,
    this.warrantyMonths,
    this.productCondition,
    this.reminded,
    this.type,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  List<dynamic> attachments;
  Brand brand;
  Brand car;
  Brand product;
  double price;
  double ourPercentage;
  double fullPrice;
  int daysToDeliver;
  dynamic notes;
  String status;
  double warrantyMonths;
  ProductCondition productCondition;
  bool reminded;
  String type;

  factory CustomerRejectedRequest.fromJson(Map<String, dynamic> json) =>
      CustomerRejectedRequest(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        product: Brand.fromJson(json["product"]),
        price: json["price"].toDouble(),
        ourPercentage: json["ourPercentage"].toDouble(),
        fullPrice: json["fullPrice"].toDouble(),
        daysToDeliver: json["daysToDeliver"],
        notes: json["notes"],
        status: json["status"],
        warrantyMonths: json["warrantyMonths"],
        productCondition: ProductCondition.fromJson(json["productCondition"]),
        reminded: json["reminded"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "product": product.toJson(),
        "price": price,
        "ourPercentage": ourPercentage,
        "fullPrice": fullPrice,
        "daysToDeliver": daysToDeliver,
        "notes": notes,
        "status": status,
        "warrantyMonths": warrantyMonths,
        "productCondition": productCondition.toJson(),
        "reminded": reminded,
        "type": type,
      };
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.code,
    this.brand,
    this.arabicName,
  });

  int id;
  String name;
  String code;
  Brand brand;
  String arabicName;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        arabicName: json["arabicName"] == null ? null : json["arabicName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName == null ? null : arabicName,
      };
}

class ProductCondition {
  ProductCondition({
    this.label,
    this.value,
  });

  String label;
  String value;

  factory ProductCondition.fromJson(Map<String, dynamic> json) =>
      ProductCondition(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
