// To parse this JSON data, do
//
//     final cartHistory = cartHistoryFromJson(jsonString);

import 'dart:convert';

CartHistory cartHistoryFromJson(String str) => CartHistory.fromJson(json.decode(str));

String cartHistoryToJson(CartHistory data) => json.encode(data.toJson());

class CartHistory {
    CartHistory({
        this.carts,
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

    List<CartInfo> carts;
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

    factory CartHistory.fromJson(Map<String, dynamic> json) => CartHistory(
        carts: List<CartInfo>.from(json["content"].map((x) => CartInfo.fromJson(x))),
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
        "content": List<dynamic>.from(carts.map((x) => x.toJson())),
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

class CartInfo {
    CartInfo({
        this.id,
        this.version,
        this.creationDate,
        this.lastModificationDate,
        this.uuid,
        this.objectType,
        this.attachments,
        this.customer,
        this.cartItems,
        this.status,
        this.fullPrice,
        this.doneDate,
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
    List<CartItem> cartItems;
    String status;
    int fullPrice;
    DateTime doneDate;
    String deliverCountry;
    String deliverCity;
    String deliverStreet;
    String deliverAdditionalAddress;
    double deliverXLongitude;
    double deliverYLatitude;

    factory CartInfo.fromJson(Map<String, dynamic> json) => CartInfo(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        customer: Customer.fromJson(json["customer"]),
        cartItems: List<CartItem>.from(json["cartItems"].map((x) => CartItem.fromJson(x))),
        status: json["status"],
        fullPrice: json["fullPrice"],
        doneDate: DateTime.parse(json["doneDate"]),
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
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
        "status": status,
        "fullPrice": fullPrice,
        "doneDate": doneDate.toIso8601String(),
        "deliverCountry": deliverCountry,
        "deliverCity": deliverCity,
        "deliverStreet": deliverStreet,
        "deliverAdditionalAddress": deliverAdditionalAddress,
        "deliverXLongitude": deliverXLongitude,
        "deliverYLatitude": deliverYLatitude,
    };
}

class CartItem {
    CartItem({
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

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
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
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    List<dynamic> attachments;
    dynamic role;
    String mobileNumber;
    String fullName;
    String email;
    List<dynamic> roles;

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
