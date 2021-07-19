// To parse this JSON data, do
//
//     final customerRequest = customerRequestFromJson(jsonString);

import 'dart:convert';

CustomerRequest customerRequestFromJson(String str) => CustomerRequest.fromJson(json.decode(str));

String customerRequestToJson(CustomerRequest data) => json.encode(data.toJson());

class CustomerRequest {
    CustomerRequest({
        this.content,
        this.pageable,
        this.totalElements,
        this.totalPages,
        this.last,
        this.size,
        this.number,
        this.sort,
        this.numberOfElements,
        this.first,
        this.empty,
    });

    List<Content> content;
    Pageable pageable;
    int totalElements;
    int totalPages;
    bool last;
    int size;
    int number;
    Sort sort;
    int numberOfElements;
    bool first;
    bool empty;

    factory CustomerRequest.fromJson(Map<String, dynamic> json) => CustomerRequest(
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        last: json["last"],
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
        "totalElements": totalElements,
        "totalPages": totalPages,
        "last": last,
        "size": size,
        "number": number,
        "sort": sort.toJson(),
        "numberOfElements": numberOfElements,
        "first": first,
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
        this.customer,
        this.vendorProducts,
        this.status,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    Customer customer;
    List<VendorProduct> vendorProducts;
    String status;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        customer: Customer.fromJson(json["customer"]),
        vendorProducts: List<VendorProduct>.from(json["vendorProducts"].map((x) => VendorProduct.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "customer": customer.toJson(),
        "vendorProducts": List<dynamic>.from(vendorProducts.map((x) => x.toJson())),
        "status": status,
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
        this.role,
        this.mobileNumber,
        this.contactNumber,
        this.firstName,
        this.lastName,
        this.email,
        this.userName,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    String role;
    String mobileNumber;
    String contactNumber;
    String firstName;
    String lastName;
    String email;
    String userName;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        role: json["role"],
        mobileNumber: json["mobileNumber"],
        contactNumber: json["contactNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "role": role,
        "mobileNumber": mobileNumber,
        "contactNumber": contactNumber,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "userName": userName,
    };
}

class VendorProduct {
    VendorProduct({
        this.id,
        this.version,
        this.creationDate,
        this.lastModificationDate,
        this.uuid,
        this.objectType,
        this.product,
        this.brand,
        this.car,
        this.defects,
        this.price,
        this.years,
        this.available,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    Brand product;
    Brand brand;
    Brand car;
    dynamic defects;
    int price;
    List<String> years;
    bool available;

    factory VendorProduct.fromJson(Map<String, dynamic> json) => VendorProduct(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        product: Brand.fromJson(json["product"]),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        defects: json["defects"],
        price: json["price"],
        years: List<String>.from(json["years"].map((x) => x)),
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": objectType,
        "product": product.toJson(),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "defects": defects,
        "price": price,
        "years": List<dynamic>.from(years.map((x) => x)),
        "available": available,
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
        "name": name,
        "code": code,
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName,
    };
}

class Pageable {
    Pageable({
        this.sort,
        this.offset,
        this.pageNumber,
        this.pageSize,
        this.unpaged,
        this.paged,
    });

    Sort sort;
    int offset;
    int pageNumber;
    int pageSize;
    bool unpaged;
    bool paged;

    factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        offset: json["offset"],
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        unpaged: json["unpaged"],
        paged: json["paged"],
    );

    Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "offset": offset,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
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
