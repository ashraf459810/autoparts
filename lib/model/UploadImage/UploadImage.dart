// To parse this JSON data, do
//
//     final uploadImage = uploadImageFromJson(jsonString);

import 'dart:convert';

import 'package:built_value/built_value.dart';

UploadImage uploadImageFromJson(String str) =>
    UploadImage.fromJson(json.decode(str));

String uploadImageToJson(UploadImage data) => json.encode(data.toJson());

class UploadImage {
  UploadImage({
    this.id,
    this.version,
    this.uuid,
    this.objectType,
    this.attachments,
    this.tag,
    this.path,
    this.ownerId,
    this.ownerType,
    this.linked,
  });

  int id;
  int version;

  String uuid;
  String objectType;
  @nullable
  List<dynamic> attachments;
  String tag;

  String path;
  dynamic ownerId;
  dynamic ownerType;
  bool linked;

  factory UploadImage.fromJson(Map<String, dynamic> json) => UploadImage(
        id: json["id"],
        version: json["version"],
        uuid: json["uuid"],
        objectType: json["objectType"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        tag: json["tag"],
        path: json["path"],
        ownerId: json["ownerId"],
        ownerType: json["ownerType"],
        linked: json["linked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "uuid": uuid,
        "objectType": objectType,
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "tag": tag,
        "path": path,
        "ownerId": ownerId,
        "ownerType": ownerType,
        "linked": linked,
      };
}
