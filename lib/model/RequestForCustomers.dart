// To parse this JSON data, do
//
//     final requestForCustomer = requestForCustomerFromJson(jsonString);

import 'dart:convert';

RequestForCustomer requestForCustomerFromJson(String str) =>
    RequestForCustomer.fromJson(json.decode(str));

String requestForCustomerToJson(RequestForCustomer data) =>
    json.encode(data.toJson());

class RequestForCustomer {
  RequestForCustomer({
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

  List<CustomerRequests> content;
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

  factory RequestForCustomer.fromJson(Map<String, dynamic> json) =>
      RequestForCustomer(
        content: List<CustomerRequests>.from(
            json["content"].map((x) => CustomerRequests.fromJson(x))),
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

class CustomerRequests {
  CustomerRequests({
    this.id,
    this.version,
    this.creationDate,
    this.lastModificationDate,
    this.uuid,
    this.objectType,
    this.attachments,
    this.customer,
    this.brand,
    this.car,
    this.products,
    this.year,
    this.status,
    this.carClass,
    this.productQuality,
    this.type,
    this.notes,
  });

  int id;
  int version;
  DateTime creationDate;
  DateTime lastModificationDate;
  String uuid;
  String objectType;
  List<dynamic> attachments;
  Customer customer;
  Brand brand;
  Brand car;
  List<Brand> products;
  String year;
  String status;
  CarClass carClass;
  dynamic productQuality;
  String type;
  dynamic notes;

  factory CustomerRequests.fromJson(Map<String, dynamic> json) =>
      CustomerRequests(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        customer: Customer.fromJson(json["customer"]),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        products:
            List<Brand>.from(json["products"].map((x) => Brand.fromJson(x))),
        year: json["year"],
        status: json["status"],
        carClass: CarClass.fromJson(json["carClass"]),
        productQuality: json["productQuality"],
        type: json["type"],
        notes: json["notes"],
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
        "brand": brand.toJson(),
        "car": car.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "year": year,
        "status": status,
        "carClass": carClass.toJson(),
        "productQuality": productQuality,
        "type": type,
        "notes": notes,
      };
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.code,
    this.brand,
    this.arabicName,
  });

  int id;
  String name;
  String code;
  Brand brand;
  String arabicName;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        arabicName: json["arabicName"] == null ? null : json["arabicName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName == null ? null : arabicName,
      };
}

class CarClass {
  CarClass({
    this.label,
    this.value,
  });

  String label;
  String value;

  factory CarClass.fromJson(Map<String, dynamic> json) => CarClass(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

class Customer {
  Customer({
    this.id,
    this.fullName,
    this.mobileNumber,
  });

  int id;
  String fullName;
  String mobileNumber;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        fullName: json["fullName"],
        mobileNumber: json["mobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "mobileNumber": mobileNumber,
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
