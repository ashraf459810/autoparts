// To parse this JSON data, do
//
//     final vendorNotificationsModel = vendorNotificationsModelFromJson(jsonString);

import 'dart:convert';

VendorNotificationsModel vendorNotificationsModelFromJson(String str) => VendorNotificationsModel.fromJson(json.decode(str));

String vendorNotificationsModelToJson(VendorNotificationsModel data) => json.encode(data.toJson());

class VendorNotificationsModel {
    VendorNotificationsModel({
        this.content,
        this.pageable,
        this.last,
        this.totalPages,
        this.totalElements,
        this.size,
        this.number,
        this.sort,
        this.numberOfElements,
        this.first,
        this.empty,
    });

    List<VendorNot> content;
    Pageable pageable;
    bool last;
    int totalPages;
    int totalElements;
    int size;
    int number;
    Sort sort;
    int numberOfElements;
    bool first;
    bool empty;

    factory VendorNotificationsModel.fromJson(Map<String, dynamic> json) => VendorNotificationsModel(
        content: List<VendorNot>.from(json["content"].map((x) => VendorNot.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        size: json["size"],
        number: json["number"],
        sort: Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        first: json["first"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "size": size,
        "number": number,
        "sort": sort.toJson(),
        "numberOfElements": numberOfElements,
        "first": first,
        "empty": empty,
    };
}

class VendorNot {
    VendorNot({
        this.id,
        this.version,
        this.creationDate,
        this.lastModificationDate,
        this.uuid,
        this.objectType,
        this.attachments,
        this.receiverId,
        this.receiverType,
        this.notificationType,
        this.title,
        this.body,
        this.targetId,
        this.targetType,
        this.strResponse,
        this.context,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    List<dynamic> attachments;
    int receiverId;
    String receiverType;
    String notificationType;
    String title;
    String body;
    int targetId;
    dynamic targetType;
    String strResponse;
    String context;

    factory VendorNot.fromJson(Map<String, dynamic> json) => VendorNot(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        receiverId: json["receiverId"],
        receiverType: json["receiverType"],
        notificationType: json["notificationType"],
        title: json["title"],
        body: json["body"],
        targetId: json["targetId"],
        targetType: json["targetType"],
        strResponse: json["strResponse"],
        context: json["context"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "receiverId": receiverId,
        "receiverType": receiverType,
        "notificationType": notificationType,
        "title": title,
        "body": body,
        "targetId": targetId,
        "targetType": targetType,
        "strResponse": strResponse,
        "context": context,
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
