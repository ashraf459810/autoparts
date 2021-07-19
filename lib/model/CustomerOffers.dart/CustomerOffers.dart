// To parse this JSON data, do
//
//     final customerOffers = customerOffersFromJson(jsonString);

import 'dart:convert';

CustomerOffers customerOffersFromJson(String str) => CustomerOffers.fromJson(json.decode(str));

String customerOffersToJson(CustomerOffers data) => json.encode(data.toJson());

class CustomerOffers {
    CustomerOffers({
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

    List<Offer> content;
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

    factory CustomerOffers.fromJson(Map<String, dynamic> json) => CustomerOffers(
        content: List<Offer>.from(json["content"].map((x) => Offer.fromJson(x))),
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

class Offer {
    Offer({
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
    double price;
    double ourPercentage;
    double fullPrice;
    int daysToDeliver;
    String notes;
    String status;
    dynamic warrantyMonths;
    dynamic productCondition;

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
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
