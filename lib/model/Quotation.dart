// To parse this JSON data, do
//
//     final sendQuotation = sendQuotationFromJson(jsonString);

import 'dart:convert';

import 'package:built_value/built_value.dart';

SendQuotation sendQuotationFromJson(String str) =>
    SendQuotation.fromJson(json.decode(str));

String sendQuotationToJson(SendQuotation data) => json.encode(data.toJson());

class SendQuotation {
  SendQuotation({
    this.customer,
    this.products,
    this.brand,
    this.car,
    this.year,
    this.carClass,
    this.type,
    this.productQuality,
    this.notes,
    this.attachments,
  });

  Sender customer;
  List<Sender> products;
  Sender brand;
  Sender car;
  String year;
  String carClass;
  String type;
  @nullable
  String productQuality;
  @nullable
  String notes;
  @nullable
  List<Photos> attachments;

  factory SendQuotation.fromJson(Map<String, dynamic> json) => SendQuotation(
        customer: Sender.fromJson(json["customer"]),
        products:
            List<Sender>.from(json["products"].map((x) => Sender.fromJson(x))),
        brand: Sender.fromJson(json["brand"]),
        car: Sender.fromJson(json["car"]),
        year: json["year"],
        carClass: json["carClass"],
        type: json["type"],
        productQuality: json["productQuality"],
        notes: json["notes"],
        attachments: List<Photos>.from(
            json["attachments"].map((x) => Photos.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "year": year,
        "carClass": carClass,
        "type": type,
        "productQuality": productQuality,
        "notes": notes,
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
      };
}

class Sender {
  Sender({
    this.id,
  });

  int id;

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Photos {
  Photos({
    this.id,
  });

  @nullable
  int id;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
