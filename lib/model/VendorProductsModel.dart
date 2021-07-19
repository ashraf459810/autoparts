// To parse this JSON data, do
//
//     final vendorProductsModel = vendorProductsModelFromJson(jsonString);

import 'dart:convert';

VendorProductsModel vendorProductsModelFromJson(String str) => VendorProductsModel.fromJson(json.decode(str));

String vendorProductsModelToJson(VendorProductsModel data) => json.encode(data.toJson());

class VendorProductsModel {
    VendorProductsModel({
        this.content,
        this.pageable,
        this.last,
        this.totalPages,
        this.totalElements,
        this.sort,
        this.first,
        this.numberOfElements,
        this.size,
        this.number,
        this.empty,
    });

    List<Content> content;
    Pageable pageable;
    bool last;
    int totalPages;
    int totalElements;
    Sort sort;
    bool first;
    int numberOfElements;
    int size;
    int number;
    bool empty;

    factory VendorProductsModel.fromJson(Map<String, dynamic> json) => VendorProductsModel(
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        sort: Sort.fromJson(json["sort"]),
        first: json["first"],
        numberOfElements: json["numberOfElements"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "sort": sort.toJson(),
        "first": first,
        "numberOfElements": numberOfElements,
        "size": size,
        "number": number,
        "empty": empty,
    };
}

class Content {
    Content({
        this.id,
        this.version,
        this.creationDate,
        this.lastModificationDate,
        this.uuid,
        this.objectType,
        this.attachments,
        this.product,
        this.brand,
        this.car,
        this.defects,
        this.price,
        this.years,
        this.available,
        this.productType,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    List<Attachment> attachments;
    Brand product;
    Brand brand;
    Brand car;
    String defects;
    double price;
    List<String> years;
    bool available;
    String productType;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
        product: Brand.fromJson(json["product"]),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        defects: json["defects"],
        price: json["price"],
        years: List<String>.from(json["years"].map((x) => x)),
        available: json["available"],
        productType: json["productType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "product": product.toJson(),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "defects": defects,
        "price": price,
        "years": List<dynamic>.from(years.map((x) => x)),
        "available": available,
        "productType": productType,
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
    List<Attachment> attachments;
    String name;
    String code;
    Brand brand;
    dynamic arabicName;

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
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        arabicName: json["arabicName"],
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
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName,
    };
}

class Pageable {
    Pageable({
        this.sort,
        this.pageNumber,
        this.pageSize,
        this.offset,
        this.unpaged,
        this.paged,
    });

    Sort sort;
    int pageNumber;
    int pageSize;
    int offset;
    bool unpaged;
    bool paged;

    factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        offset: json["offset"],
        unpaged: json["unpaged"],
        paged: json["paged"],
    );

    Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "offset": offset,
        "unpaged": unpaged,
        "paged": paged,
    };
}

class Sort {
    Sort({
        this.sorted,
        this.unsorted,
        this.empty,
    });

    bool sorted;
    bool unsorted;
    bool empty;

    factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
    };
}
