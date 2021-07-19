// To parse this JSON data, do
//
//     final brandsEdit = brandsEditFromJson(jsonString);

import 'dart:convert';

BrandsEdit brandsEditFromJson(String str) => BrandsEdit.fromJson(json.decode(str));

String brandsEditToJson(BrandsEdit data) => json.encode(data.toJson());

class BrandsEdit {
    BrandsEdit({
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
        this.idNumber,
        this.contactNumber,
        this.sellerType,
        this.vendorType,
        this.tradeLicenseNumber,
        this.taxVatNumber,
        this.companyName,
        this.receiveNewsAndUpdatesEmails,
        this.brands,
        this.parentVendor,
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
    String idNumber;
    String contactNumber;
    SellerType sellerType;
    dynamic vendorType;
    String tradeLicenseNumber;
    dynamic taxVatNumber;
    dynamic companyName;
    bool receiveNewsAndUpdatesEmails;
    List<Brand> brands;
    dynamic parentVendor;

    factory BrandsEdit.fromJson(Map<String, dynamic> json) => BrandsEdit(
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
        idNumber: json["idNumber"],
        contactNumber: json["contactNumber"],
        sellerType: SellerType.fromJson(json["sellerType"]),
        vendorType: json["vendorType"],
        tradeLicenseNumber: json["tradeLicenseNumber"],
        taxVatNumber: json["taxVatNumber"],
        companyName: json["companyName"],
        receiveNewsAndUpdatesEmails: json["receiveNewsAndUpdatesEmails"],
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        parentVendor: json["parentVendor"],
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
        "idNumber": idNumber,
        "contactNumber": contactNumber,
        "sellerType": sellerType.toJson(),
        "vendorType": vendorType,
        "tradeLicenseNumber": tradeLicenseNumber,
        "taxVatNumber": taxVatNumber,
        "companyName": companyName,
        "receiveNewsAndUpdatesEmails": receiveNewsAndUpdatesEmails,
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "parentVendor": parentVendor,
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
    });

    int id;
    int version;
    DateTime creationDate;
    DateTime lastModificationDate;
    String uuid;
    String objectType;
    List<dynamic> attachments;
    String name;
    String code;
    int brandOrder;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        version: json["version"],
        creationDate: DateTime.parse(json["creationDate"]),
        lastModificationDate: DateTime.parse(json["lastModificationDate"]),
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
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
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "name": name,
        "code": code,
        "brandOrder": brandOrder,
    };
}

class SellerType {
    SellerType({
        this.label,
        this.value,
    });

    String label;
    String value;

    factory SellerType.fromJson(Map<String, dynamic> json) => SellerType(
        label: json["label"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
    };
}
