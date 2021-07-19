// To parse this JSON data, do
//
//     final brandPagen = brandPagenFromJson(jsonString);

import 'dart:convert';

BrandPagen brandPagenFromJson(String str) => BrandPagen.fromJson(json.decode(str));

String brandPagenToJson(BrandPagen data) => json.encode(data.toJson());

class BrandPagen {
    BrandPagen({
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

    List<PagenBrands> content;
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

    factory BrandPagen.fromJson(Map<String, dynamic> json) => BrandPagen(
        content: List<PagenBrands>.from(json["content"].map((x) => PagenBrands.fromJson(x))),
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

class PagenBrands {
    PagenBrands({
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

    factory PagenBrands.fromJson(Map<String, dynamic> json) => PagenBrands(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
        name: json["name"],
        code: json["code"],
        brandOrder: json["brandOrder"],
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
        "brandOrder": brandOrder,
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
