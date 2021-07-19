// To parse this JSON data, do
//
//     final customerOfferNotification = customerOfferNotificationFromJson(jsonString);

import 'dart:convert';


import 'package:built_value/built_value.dart';


CustomerOfferNotification customerOfferNotificationFromJson(String str) => CustomerOfferNotification.fromJson(json.decode(str));

String customerOfferNotificationToJson(CustomerOfferNotification data) => json.encode(data.toJson());

class CustomerOfferNotification {
    CustomerOfferNotification({
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

        this.fullPrice,
        this.daysToDeliver,
        this.notes,
        this.status,
        this.warrantyMonths,
        this.productCondition,
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
    
    double fullPrice;
    int daysToDeliver;
    dynamic notes;
    String status;
    double warrantyMonths;
 @nullable   ProductCondition productCondition;

    factory CustomerOfferNotification.fromJson(Map<String, dynamic> json) => CustomerOfferNotification(
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
       
        fullPrice: json["fullPrice"],
        daysToDeliver: json["daysToDeliver"],
        notes: json["notes"],
        status: json["status"],
        warrantyMonths: json["warrantyMonths"],
        productCondition: ProductCondition.fromJson(json["productCondition"]),
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
      
        "fullPrice": fullPrice,
        "daysToDeliver": daysToDeliver,
        "notes": notes,
        "status": status,
        "warrantyMonths": warrantyMonths,
        "productCondition": productCondition.toJson(),
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
        this.attachments,
        this.name,
        this.code,
        this.brand,
        this.arabicName,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    List<dynamic> attachments;
    String name;
    String code;
    Brand brand;
    String arabicName;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        name: json["name"],
        code: json["code"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        arabicName: json["arabicName"] == null ? null : json["arabicName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "name": name,
        "code": code,
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName == null ? null : arabicName,
    };
}

     class ProductCondition {
   @nullable ProductCondition({
        this.label,
        this.value,
    });

  @nullable  String label;
  @nullable  String value;

 factory ProductCondition.fromJson(Map<String, dynamic> json) => ProductCondition(
  
        label : json["label"],
        value: json["value"],
   
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
    };
}
