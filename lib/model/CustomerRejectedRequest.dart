// To parse this JSON data, do
//
//     final customerRejectedRequest = customerRejectedRequestFromJson(jsonString);

import 'dart:convert';

CustomerRejectedRequest customerRejectedRequestFromJson(String str) => CustomerRejectedRequest.fromJson(json.decode(str));

String customerRejectedRequestToJson(CustomerRejectedRequest data) => json.encode(data.toJson());

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
    dynamic notes;
    String status;
    dynamic warrantyMonths;
    dynamic productCondition;

    factory CustomerRejectedRequest.fromJson(Map<String, dynamic> json) => CustomerRejectedRequest(
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
        this.brandOrder,
        this.brand,
        this.arabicName,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    List<Attachment> attachments;
    String name;
    String code;
    int brandOrder;
    Brand brand;
    String arabicName;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
        name: json["name"],
        code: json["code"],
        brandOrder: json["brandOrder"] == null ? null : json["brandOrder"],
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
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "name": name,
        "code": code,
        "brandOrder": brandOrder == null ? null : brandOrder,
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName == null ? null : arabicName,
    };
}

class Attachment {
    Attachment({
        this.id,
        this.version,
        this.creationDate,
        this.lastModificationDate,
        this.uuid,
        this.objectType,
        this.attachments,
        this.tag,
        this.extension,
        this.path,
        this.publicUrl,
        this.ownerId,
        this.ownerType,
        this.linked,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    List<dynamic> attachments;
    String tag;
    String extension;
    String path;
    String publicUrl;
    int ownerId;
    String ownerType;
    bool linked;

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        tag: json["tag"],
        extension: json["extension"],
        path: json["path"],
        publicUrl: json["publicURL"],
        ownerId: json["ownerId"],
        ownerType: json["ownerType"],
        linked: json["linked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "tag": tag,
        "extension": extension,
        "path": path,
        "publicURL": publicUrl,
        "ownerId": ownerId,
        "ownerType": ownerType,
        "linked": linked,
    };
}
