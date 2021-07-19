// To parse this JSON data, do
//
//     final listAllVendorProducts = listAllVendorProductsFromJson(jsonString);

import 'dart:convert';

List<ListAllVendorProducts> listAllVendorProductsFromJson(String str) => List<ListAllVendorProducts>.from(json.decode(str).map((x) => ListAllVendorProducts.fromJson(x)));

String listAllVendorProductsToJson(List<ListAllVendorProducts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListAllVendorProducts {
    ListAllVendorProducts({
        this.id,
        this.version,
    
        this.uuid,
        this.objectType,
        this.attachments,
        this.name,
        this.arabicName,
        this.code,
    });

    int id;
    int version;

    String uuid;
    ObjectType objectType;
    List<dynamic> attachments;
    String name;
    String arabicName;
    String code;

    factory ListAllVendorProducts.fromJson(Map<String, dynamic> json) => ListAllVendorProducts(
        id: json["id"],
        version: json["version"],
    
        uuid: json["uuid"],
        objectType: objectTypeValues.map[json["objectType"]],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        name: json["name"],
        arabicName: json["arabicName"] == null ? null : json["arabicName"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
   
        "uuid": uuid,
        "objectType": objectTypeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "name": name,
        "arabicName": arabicName == null ? null : arabicName,
        "code": code,
    };
}

enum ObjectType { PRODUCT }

final objectTypeValues = EnumValues({
    "Product": ObjectType.PRODUCT
});

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
