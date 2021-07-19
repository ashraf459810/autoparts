// To parse this JSON data, do
//
//     final carModel = carModelFromJson(jsonString);

import 'dart:convert';

List<CarModel> carModelFromJson(String str) =>
    List<CarModel>.from(json.decode(str).map((x) => CarModel.fromJson(x)));

String carModelToJson(List<CarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarModel {
  CarModel({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.name,
    this.code,
    this.brand,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  ObjectType objectType;
  String name;
  String code;
  CarModel brand;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: objectTypeValues.map[json["objectType"]],
        name: json["name"],
        code: json["code"],
        brand: json["brand"] == null ? null : CarModel.fromJson(json["brand"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectTypeValues.reverse[objectType],
        "name": name,
        "code": code,
        "brand": brand == null ? null : brand.toJson(),
      };
}

enum ObjectType { CAR, BRAND }

final objectTypeValues =
    EnumValues({"Brand": ObjectType.BRAND, "Car": ObjectType.CAR});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
