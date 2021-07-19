// To parse this JSON data, do
//
//     final addNewProductsVendor = addNewProductsVendorFromJson(jsonString);

import 'dart:convert';

AddNewProductsVendor addNewProductsVendorFromJson(String str) => AddNewProductsVendor.fromJson(json.decode(str));

String addNewProductsVendorToJson(AddNewProductsVendor data) => json.encode(data.toJson());

class AddNewProductsVendor {
    AddNewProductsVendor({
        this.product,
        this.vendor,
        this.brand,
        this.car,
        this.price,
        this.years,
        this.defects,
        this.attachments,
        this.productType,
    });

    Brand product;
    Brand vendor;
    Brand brand;
    Brand car;
    double price;
    List<String> years;
    String defects;
    List<Brand> attachments;
    String productType;

    factory AddNewProductsVendor.fromJson(Map<String, dynamic> json) => AddNewProductsVendor(
        product: Brand.fromJson(json["product"]),
        vendor: Brand.fromJson(json["vendor"]),
        brand: Brand.fromJson(json["brand"]),
        car: Brand.fromJson(json["car"]),
        price: json["price"],
        years: List<String>.from(json["years"].map((x) => x)),
        defects: json["defects"],
        attachments: List<Brand>.from(json["attachments"].map((x) => Brand.fromJson(x))),
        productType: json["productType"],
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "vendor": vendor.toJson(),
        "brand": brand.toJson(),
        "car": car.toJson(),
        "price": price,
        "years": List<dynamic>.from(years.map((x) => x)),
        "defects": defects,
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "productType": productType,
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
