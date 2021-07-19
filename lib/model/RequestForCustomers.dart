// To parse this JSON data, do
//
//     final requestForCustomer = requestForCustomerFromJson(jsonString);

import 'dart:convert';

RequestForCustomer requestForCustomerFromJson(String str) => RequestForCustomer.fromJson(json.decode(str));

String requestForCustomerToJson(RequestForCustomer data) => json.encode(data.toJson());

class RequestForCustomer {
    RequestForCustomer({
        this.content,
        this.pageable,
        this.last,
        this.totalPages,
        this.totalElements,
        this.number,
        this.sort,
        this.size,
        this.first,
        this.numberOfElements,
        this.empty,
    });

    List<CustomerRequests> content;
    Pageable pageable;
    bool last;
    int totalPages;
    int totalElements;
    int number;
    Sort sort;
    int size;
    bool first;
    int numberOfElements;
    bool empty;

    factory RequestForCustomer.fromJson(Map<String, dynamic> json) => RequestForCustomer(
        content: List<CustomerRequests>.from(json["content"].map((x) => CustomerRequests.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        number: json["number"],
        sort: Sort.fromJson(json["sort"]),
        size: json["size"],
        first: json["first"],
        numberOfElements: json["numberOfElements"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "number": number,
        "sort": sort.toJson(),
        "size": size,
        "first": first,
        "numberOfElements": numberOfElements,
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
        this.customer,
        this.brand,
        this.car,
        this.products,
        this.year,
        this.status,
        this.carClass,
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    ContentObjectType objectType;
    Customer customer;
    Brand brand;
    Brand car;
    List<Brand> products;
    String year;
    Status status;
    CarClass carClass;

    factory CustomerRequests.fromJson(Map<String, dynamic> json) => CustomerRequests(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: contentObjectTypeValues.map[json["objectType"]],
        customer: Customer.fromJson(json["customer"]),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        products: List<Brand>.from(json["products"].map((x) => Brand.fromJson(x))),
        year: json["year"],
        status: statusValues.map[json["status"]],
        carClass: CarClass.fromJson(json["carClass"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": contentObjectTypeValues.reverse[objectType],
        "customer": customer.toJson(),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "year": year,
        "status": statusValues.reverse[status],
        "carClass": carClass.toJson(),
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
    BrandObjectType objectType;
    String name;
    Code code;
    Brand brand;
    dynamic arabicName;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: brandObjectTypeValues.map[json["objectType"]],
        name: json["name"],
        code: codeValues.map[json["code"]],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        arabicName: json["arabicName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": brandObjectTypeValues.reverse[objectType],
        "name": nameValues.reverse[name],
        "code": codeValues.reverse[code],
        "brand": brand == null ? null : brand.toJson(),
        "arabicName": arabicName,
    };
}

enum Code { BMW, X5, DOOR }

final codeValues = EnumValues({
    "bmw": Code.BMW,
    "door": Code.DOOR,
    "x5": Code.X5
});

enum Name { BMW, X5, DOOR }

final nameValues = EnumValues({
    "BMW": Name.BMW,
    "door": Name.DOOR,
    "X5": Name.X5
});

enum BrandObjectType { BRAND, CAR, PRODUCT }

final brandObjectTypeValues = EnumValues({
    "Brand": BrandObjectType.BRAND,
    "Car": BrandObjectType.CAR,
    "Product": BrandObjectType.PRODUCT
});

class CarClass {
    CarClass({
        this.label,
        this.value,
    });

    Label label;
    Value value;

    factory CarClass.fromJson(Map<String, dynamic> json) => CarClass(
        label: labelValues.map[json["label"]],
        value: valueValues.map[json["value"]],
    );

    Map<String, dynamic> toJson() => {
        "label": labelValues.reverse[label],
        "value": valueValues.reverse[value],
    };
}

enum Label { AMERICAN, GULF }

final labelValues = EnumValues({
    "American": Label.AMERICAN,
    "Gulf": Label.GULF
});

enum Value { AMERICAN, GULF }

final valueValues = EnumValues({
    "AMERICAN": Value.AMERICAN,
    "GULF": Value.GULF
});

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
    CustomerObjectType objectType;
    Role role;
    String mobileNumber;
    String contactNumber;
    FirstName firstName;
    LastName lastName;
    Email email;
    UserName userName;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: customerObjectTypeValues.map[json["objectType"]],
        role: roleValues.map[json["role"]],
        mobileNumber: json["mobileNumber"],
        contactNumber: json["contactNumber"],
        firstName: firstNameValues.map[json["firstName"]],
        lastName: lastNameValues.map[json["lastName"]],
        email: emailValues.map[json["email"]],
        userName: userNameValues.map[json["userName"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "creationDate": creationDate.toIso8601String(),
        "lastModificationDate": lastModificationDate.toIso8601String(),
        "uuid": uuid,
        "objectType": customerObjectTypeValues.reverse[objectType],
        "role": roleValues.reverse[role],
        "mobileNumber": mobileNumber,
        "contactNumber": contactNumber,
        "firstName": firstNameValues.reverse[firstName],
        "lastName": lastNameValues.reverse[lastName],
        "email": emailValues.reverse[email],
        "userName": userNameValues.reverse[userName],
    };
}

enum Email { SDFSDF }

final emailValues = EnumValues({
    "sdfsdf": Email.SDFSDF
});

enum FirstName { DSVDVSDV }

final firstNameValues = EnumValues({
    "dsvdvsdv": FirstName.DSVDVSDV
});

enum LastName { SVSSVSDVS }

final lastNameValues = EnumValues({
    "svssvsdvs": LastName.SVSSVSDVS
});

enum CustomerObjectType { CUSTOMER }

final customerObjectTypeValues = EnumValues({
    "Customer": CustomerObjectType.CUSTOMER
});

enum Role { CUSTOMER }

final roleValues = EnumValues({
    "CUSTOMER": Role.CUSTOMER
});

enum UserName { ASDASDAD }

final userNameValues = EnumValues({
    "asdasdad": UserName.ASDASDAD
});

enum ContentObjectType { REQUEST_FOR_QUOTATION }

final contentObjectTypeValues = EnumValues({
    "RequestForQuotation": ContentObjectType.REQUEST_FOR_QUOTATION
});

enum Status { PENDING }

final statusValues = EnumValues({
    "PENDING": Status.PENDING
});

class Pageable {
    Pageable({
        this.sort,
        this.offset,
        this.pageNumber,
        this.pageSize,
        this.paged,
        this.unpaged,
    });

    Sort sort;
    int offset;
    int pageNumber;
    int pageSize;
    bool paged;
    bool unpaged;

    factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        offset: json["offset"],
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        paged: json["paged"],
        unpaged: json["unpaged"],
    );

    Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "offset": offset,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
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
