// To parse this JSON data, do
//
//     final finishedOrdersCustomer = finishedOrdersCustomerFromJson(jsonString);

import 'dart:convert';

FinishedOrdersCustomer finishedOrdersCustomerFromJson(String str) =>
    FinishedOrdersCustomer.fromJson(json.decode(str));

String finishedOrdersCustomerToJson(FinishedOrdersCustomer data) =>
    json.encode(data.toJson());

class FinishedOrdersCustomer {
  FinishedOrdersCustomer({
    this.content,
    this.pageable,
    this.totalPages,
    this.totalElements,
    this.last,
    this.sort,
    this.first,
    this.numberOfElements,
    this.size,
    this.number,
    this.empty,
  });

  List<FinishedOrders> content;
  Pageable pageable;
  int totalPages;
  int totalElements;
  bool last;
  Sort sort;
  bool first;
  int numberOfElements;
  int size;
  int number;
  bool empty;

  factory FinishedOrdersCustomer.fromJson(Map<String, dynamic> json) =>
      FinishedOrdersCustomer(
        content: List<FinishedOrders>.from(
            json["content"].map((x) => FinishedOrders.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
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
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "sort": sort.toJson(),
        "first": first,
        "numberOfElements": numberOfElements,
        "size": size,
        "number": number,
        "empty": empty,
      };
}

class FinishedOrders {
  FinishedOrders({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.customer,
    this.currentCartItems,
    this.status,
    this.fullPrice,
    this.deliverCountry,
    this.deliverCity,
    this.deliverStreet,
    this.deliverAdditionalAddress,
    this.deliverXLongitude,
    this.deliverYLatitude,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  List<dynamic> attachments;
  Customer customer;
  List<dynamic> currentCartItems;
  String status;
  double fullPrice;
  String deliverCountry;
  String deliverCity;
  String deliverStreet;
  String deliverAdditionalAddress;
  double deliverXLongitude;
  double deliverYLatitude;

  factory FinishedOrders.fromJson(Map<String, dynamic> json) => FinishedOrders(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        customer: Customer.fromJson(json["customer"]),
        currentCartItems:
            List<dynamic>.from(json["currentCartItems"].map((x) => x)),
        status: json["status"],
        fullPrice: json["fullPrice"].toDouble(),
        deliverCountry: json["deliverCountry"],
        deliverCity: json["deliverCity"],
        deliverStreet: json["deliverStreet"],
        deliverAdditionalAddress: json["deliverAdditionalAddress"],
        deliverXLongitude: json["deliverXLongitude"].toDouble(),
        deliverYLatitude: json["deliverYLatitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "customer": customer.toJson(),
        "currentCartItems": List<dynamic>.from(currentCartItems.map((x) => x)),
        "status": status,
        "fullPrice": fullPrice,
        "deliverCountry": deliverCountry,
        "deliverCity": deliverCity,
        "deliverStreet": deliverStreet,
        "deliverAdditionalAddress": deliverAdditionalAddress,
        "deliverXLongitude": deliverXLongitude,
        "deliverYLatitude": deliverYLatitude,
      };
}

class Customer {
  Customer({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.role,
    this.mobileNumber,
    this.fullName,
    this.email,
    this.roles,
    this.purchasesPoints,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  List<dynamic> attachments;
  String role;
  String mobileNumber;
  String fullName;
  String email;
  List<dynamic> roles;
  int purchasesPoints;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        role: json["role"],
        mobileNumber: json["mobileNumber"],
        fullName: json["fullName"],
        email: json["email"],
        roles: List<dynamic>.from(json["roles"].map((x) => x)),
        purchasesPoints: json["purchasesPoints"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "role": role,
        "mobileNumber": mobileNumber,
        "fullName": fullName,
        "email": email,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "purchasesPoints": purchasesPoints,
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
