// To parse this JSON data, do
//
//     final brandsEditBody = brandsEditBodyFromJson(jsonString);

import 'dart:convert';

BrandsEditBody brandsEditBodyFromJson(String str) => BrandsEditBody.fromJson(json.decode(str));

String brandsEditBodyToJson(BrandsEditBody data) => json.encode(data.toJson());

class BrandsEditBody {
    BrandsEditBody({
        this.id,
        this.brands,
    });

    int id;
    List<Brand> brands;

    factory BrandsEditBody.fromJson(Map<String, dynamic> json) => BrandsEditBody(
        id: json["id"],
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
    };
}

class Brand {
    Brand({
        this.id,
    });

    int id;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
