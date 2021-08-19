// To parse this JSON data, do
//
//     final finishedOrdersCustomer = finishedOrdersCustomerFromJson(jsonString);

import 'dart:convert';

PendingOrdersCustomer finishedOrdersCustomerFromJson(String str) =>
    PendingOrdersCustomer.fromJson(json.decode(str));

String finishedOrdersCustomerToJson(PendingOrdersCustomer data) =>
    json.encode(data.toJson());

class PendingOrdersCustomer {
  PendingOrdersCustomer({
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

  List<PendingOrders> content;
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

  factory PendingOrdersCustomer.fromJson(Map<String, dynamic> json) =>
      PendingOrdersCustomer(
        content: List<PendingOrders>.from(
            json["content"].map((x) => PendingOrders.fromJson(x))),
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

class PendingOrders {
  PendingOrders({
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
  List<CurrentCartItem> currentCartItems;
  String status;
  double fullPrice;
  String deliverCountry;
  String deliverCity;
  String deliverStreet;
  String deliverAdditionalAddress;
  double deliverXLongitude;
  double deliverYLatitude;

  factory PendingOrders.fromJson(Map<String, dynamic> json) => PendingOrders(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        customer: Customer.fromJson(json["customer"]),
        currentCartItems: List<CurrentCartItem>.from(
            json["currentCartItems"].map((x) => CurrentCartItem.fromJson(x))),
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
        "currentCartItems":
            List<dynamic>.from(currentCartItems.map((x) => x.toJson())),
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

class CurrentCartItem {
  CurrentCartItem({
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
    this.fullPrice,
    this.sourceTypeName,
    this.allowReturnUntil,
    this.returned,
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
  double fullPrice;
  String sourceTypeName;
  DateTime allowReturnUntil;
  bool returned;

  factory CurrentCartItem.fromJson(Map<String, dynamic> json) =>
      CurrentCartItem(
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
        fullPrice: json["fullPrice"].toDouble(),
        sourceTypeName: json["sourceTypeName"],
        allowReturnUntil: DateTime.parse(json["allowReturnUntil"]),
        returned: json["returned"],
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
        "fullPrice": fullPrice,
        "sourceTypeName": sourceTypeName,
        "allowReturnUntil": allowReturnUntil.toIso8601String(),
        "returned": returned,
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
        attachments: List<Attachment>.from(
            json["attachments"].map((x) => Attachment.fromJson(x))),
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
