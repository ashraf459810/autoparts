// To parse this JSON data, do
//
//     final vendorInfo = vendorInfoFromJson(jsonString);

import 'dart:convert';

VendorInfo vendorInfoFromJson(String str) =>
    VendorInfo.fromJson(json.decode(str));

String vendorInfoToJson(VendorInfo data) => json.encode(data.toJson());

class VendorInfo {
  VendorInfo(
      {this.id,
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
      this.message});

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
  String idNumber;
  String contactNumber;
  RType sellerType;
  RType vendorType;
  dynamic tradeLicenseNumber;
  dynamic taxVatNumber;
  String companyName;
  bool receiveNewsAndUpdatesEmails;
  List<Brand> brands;
  dynamic parentVendor;
  String message;

  factory VendorInfo.fromJson(Map<String, dynamic> json) => VendorInfo(
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
        sellerType: RType.fromJson(json["sellerType"]),
        vendorType: RType.fromJson(json["vendorType"]),
        tradeLicenseNumber: json["tradeLicenseNumber"],
        taxVatNumber: json["taxVatNumber"],
        companyName: json["companyName"],
        receiveNewsAndUpdatesEmails: json["receiveNewsAndUpdatesEmails"],
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        parentVendor: json["parentVendor"],
          message: json["message"],
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
        "vendorType": vendorType.toJson(),
        "tradeLicenseNumber": tradeLicenseNumber,
        "taxVatNumber": taxVatNumber,
        "companyName": companyName,
        "receiveNewsAndUpdatesEmails": receiveNewsAndUpdatesEmails,
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "parentVendor": parentVendor,
        "message" : message
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
  List<Attachment> attachments;
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
        attachments: List<Attachment>.from(
            json["attachments"].map((x) => Attachment.fromJson(x))),
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

class RType {
  RType({
    this.label,
    this.value,
  });

  String label;
  String value;

  factory RType.fromJson(Map<String, dynamic> json) => RType(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
