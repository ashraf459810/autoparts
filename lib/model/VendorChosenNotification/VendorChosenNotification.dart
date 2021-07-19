// To parse this JSON data, do
//
//     final vendorChosenNotification = vendorChosenNotificationFromJson(jsonString);

import 'dart:convert';

VendorChosenNotification vendorChosenNotificationFromJson(String str) => VendorChosenNotification.fromJson(json.decode(str));

String vendorChosenNotificationToJson(VendorChosenNotification data) => json.encode(data.toJson());

class VendorChosenNotification {
    VendorChosenNotification({
        this.content,
        this.pageable,
        this.last,
        this.totalPages,
        this.totalElements,
        this.first,
        this.sort,
        this.numberOfElements,
        this.size,
        this.number,
        this.empty,
    });

    List<Notifications> content;
    Pageable pageable;
    bool last;
    int totalPages;
    int totalElements;
    bool first;
    Sort sort;
    int numberOfElements;
    int size;
    int number;
    bool empty;

    factory VendorChosenNotification.fromJson(Map<String, dynamic> json) => VendorChosenNotification(
        content: List<Notifications>.from(json["content"].map((x) => Notifications.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        first: json["first"],
        sort: Sort.fromJson(json["sort"]),
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
        "first": first,
        "sort": sort.toJson(),
        "numberOfElements": numberOfElements,
        "size": size,
        "number": number,
        "empty": empty,
    };
}

class Notifications {
    Notifications({
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
    ContentObjectType objectType;
    List<dynamic> attachments;
    Brand brand;
    Brand car;
    Brand product;
    dynamic price;
    dynamic ourPercentage;
    dynamic fullPrice;
    dynamic daysToDeliver;
    String notes;
    Status status;
    dynamic warrantyMonths;
    dynamic productCondition;

    factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: contentObjectTypeValues.map[json["objectType"]],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        product: Brand.fromJson(json["product"]),
        price: json["price"],
        ourPercentage: json["ourPercentage"],
        fullPrice: json["fullPrice"],
        daysToDeliver: json["daysToDeliver"],
        notes: json["notes"],
        status: statusValues.map[json["status"]],
        warrantyMonths: json["warrantyMonths"],
        productCondition: json["productCondition"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": contentObjectTypeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "product": product.toJson(),
        "price": price,
        "ourPercentage": ourPercentage,
        "fullPrice": fullPrice,
        "daysToDeliver": daysToDeliver,
        "notes": notes,
        "status": statusValues.reverse[status],
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
    BrandObjectType objectType;
    List<dynamic> attachments;
    String name;
    String code;
    Brand brand;
    ArabicName arabicName;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: brandObjectTypeValues.map[json["objectType"]],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        name: json["name"],
        code: json["code"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        arabicName: json["arabicName"] == null ? null : arabicNameValues.map[json["arabicName"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": brandObjectTypeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "name": name,
        "code": code,
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName == null ? null : arabicNameValues.reverse[arabicName],
    };
}

enum ArabicName { EMPTY, ARABIC_NAME }

final arabicNameValues = EnumValues({
    "المبخر": ArabicName.ARABIC_NAME,
    "بيت المبخر فقط": ArabicName.EMPTY
});

enum BrandObjectType { BRAND, CAR, PRODUCT }

final brandObjectTypeValues = EnumValues({
    "Brand": BrandObjectType.BRAND,
    "Car": BrandObjectType.CAR,
    "Product": BrandObjectType.PRODUCT
});

enum ContentObjectType { REQUEST_FOR_QUOTATION_OFFER }

final contentObjectTypeValues = EnumValues({
    "RequestForQuotationOffer": ContentObjectType.REQUEST_FOR_QUOTATION_OFFER
});

enum Status { SEND_PENDING }

final statusValues = EnumValues({
    "SEND_PENDING": Status.SEND_PENDING
});

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
