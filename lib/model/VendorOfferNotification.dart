// To parse this JSON data, do
//
//     final vendorOfferNotificationModel = vendorOfferNotificationModelFromJson(jsonString);

import 'dart:convert';

VendorOfferNotificationModel vendorOfferNotificationModelFromJson(String str) =>
    VendorOfferNotificationModel.fromJson(json.decode(str));

String vendorOfferNotificationModelToJson(VendorOfferNotificationModel data) =>
    json.encode(data.toJson());

class VendorOfferNotificationModel {
  VendorOfferNotificationModel({
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
  dynamic price;
  dynamic ourPercentage;
  dynamic fullPrice;
  dynamic daysToDeliver;
  String notes;
  String status;
  dynamic warrantyMonths;
  dynamic productCondition;
  bool reminded;
  String type;

  factory VendorOfferNotificationModel.fromJson(Map<String, dynamic> json) =>
      VendorOfferNotificationModel(
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
        price: json["price"],
        ourPercentage: json["ourPercentage"],
        fullPrice: json["fullPrice"],
        daysToDeliver: json["daysToDeliver"],
        notes: json["notes"],
        status: json["status"],
        warrantyMonths: json["warrantyMonths"],
        productCondition: json["productCondition"],
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
        "productCondition": productCondition,
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
