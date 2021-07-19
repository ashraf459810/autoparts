// To parse this JSON data, do
//
//     final searchedProduct = searchedProductFromJson(jsonString);

import 'dart:convert';

SearchedProduct searchedProductFromJson(String str) => SearchedProduct.fromJson(json.decode(str));

String searchedProductToJson(SearchedProduct data) => json.encode(data.toJson());

class SearchedProduct {
    SearchedProduct({
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

    List<SearchResult> content;
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

    factory SearchedProduct.fromJson(Map<String, dynamic> json) => SearchedProduct(
        content: List<SearchResult>.from(json["content"].map((x) => SearchResult.fromJson(x))),
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

class SearchResult {
    SearchResult({
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
        this.rates,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    Type objectType;
    List<Attachment> attachments;
    Brand product;
    Brand brand;
    Brand car;
    dynamic defects;
    double price;
    List<String> years;
    bool available;
    String productType;
    Rates rates;

    factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: typeValues.map[json["objectType"]],
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
        product: Brand.fromJson(json["product"]),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        defects: json["defects"],
        price: json["price"].toDouble(),
        years: List<String>.from(json["years"].map((x) => x)),
        available: json["available"],
        productType: json["productType"],
        rates: Rates.fromJson(json["rates"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": typeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "product": product.toJson(),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "defects": defects,
        "price": price,
        "years": List<dynamic>.from(years.map((x) => x)),
        "available": available,
        "productType": productType,
        "rates": rates.toJson(),
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
    AttachmentObjectType objectType;
    List<dynamic> attachments;
    Tag tag;
    Extension extension;
    String path;
    String publicUrl;
    int ownerId;
    Type ownerType;
    bool linked;

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: attachmentObjectTypeValues.map[json["objectType"]],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        tag: tagValues.map[json["tag"]],
        extension: extensionValues.map[json["extension"]],
        path: json["path"],
        publicUrl: json["publicURL"],
        ownerId: json["ownerId"],
        ownerType: typeValues.map[json["ownerType"]],
        linked: json["linked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": attachmentObjectTypeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "tag": tagValues.reverse[tag],
        "extension": extensionValues.reverse[extension],
        "path": path,
        "publicURL": publicUrl,
        "ownerId": ownerId,
        "ownerType": typeValues.reverse[ownerType],
        "linked": linked,
    };
}

enum Extension { JPG, PNG }

final extensionValues = EnumValues({
    "jpg": Extension.JPG,
    "png": Extension.PNG
});

enum AttachmentObjectType { ATTACHMENT }

final attachmentObjectTypeValues = EnumValues({
    "Attachment": AttachmentObjectType.ATTACHMENT
});

enum Type { VENDOR_PRODUCT, BRAND }

final typeValues = EnumValues({
    "Brand": Type.BRAND,
    "VendorProduct": Type.VENDOR_PRODUCT
});

enum Tag { VENDOR_PRODUCT, BRAND_BMW, BRAND_MERCEDES }

final tagValues = EnumValues({
    "brand_bmw": Tag.BRAND_BMW,
    "brand_mercedes": Tag.BRAND_MERCEDES,
    "vendor_product": Tag.VENDOR_PRODUCT
});

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
    BrandObjectType objectType;
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
        objectType: brandObjectTypeValues.map[json["objectType"]],
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
        "objectType": brandObjectTypeValues.reverse[objectType],
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "name": name,
        "code": code,
        "brandOrder": brandOrder == null ? null : brandOrder,
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName == null ? null : arabicName,
    };
}

enum BrandObjectType { BRAND, CAR, PRODUCT }

final brandObjectTypeValues = EnumValues({
    "Brand": BrandObjectType.BRAND,
    "Car": BrandObjectType.CAR,
    "Product": BrandObjectType.PRODUCT
});

class Rates {
    Rates({
        this.ratesAvg,
        this.ratesCount,
    });

    double ratesAvg;
    int ratesCount;

    factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        ratesAvg: json["ratesAvg"],
        ratesCount: json["ratesCount"],
    );

    Map<String, dynamic> toJson() => {
        "ratesAvg": ratesAvg,
        "ratesCount": ratesCount,
    };
}

class Pageable {
    Pageable({
        this.sort,
        this.pageNumber,
        this.pageSize,
        this.offset,
        this.paged,
        this.unpaged,
    });

    Sort sort;
    int pageNumber;
    int pageSize;
    int offset;
    bool paged;
    bool unpaged;

    factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        offset: json["offset"],
        paged: json["paged"],
        unpaged: json["unpaged"],
    );

    Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "offset": offset,
        "paged": paged,
        "unpaged": unpaged,
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
