// To parse this JSON data, do
//
//     final vendorStatisics = vendorStatisicsFromJson(jsonString);

import 'dart:convert';

VendorStatisics vendorStatisicsFromJson(String str) => VendorStatisics.fromJson(json.decode(str));

String vendorStatisicsToJson(VendorStatisics data) => json.encode(data.toJson());

class VendorStatisics {
    VendorStatisics({
        this.bestProductForOtherYouDontHave,
        this.salesCount,
        this.mostProductSoldForOthers,
        this.mostProductSoldName,
        this.totalIncomes,
        this.productsCount,
        this.mostProductSoldCount,
        this.mostProductSoldIncomes,
        this.averageCustomerRates,
        this.highPriceProduct,
    });

    String bestProductForOtherYouDontHave;
    int salesCount;
    String mostProductSoldForOthers;
    String mostProductSoldName;
    double totalIncomes;
    int productsCount;
    int mostProductSoldCount;
    double mostProductSoldIncomes;
    double averageCustomerRates;
    String highPriceProduct;

    factory VendorStatisics.fromJson(Map<String, dynamic> json) => VendorStatisics(
        bestProductForOtherYouDontHave: json["bestProductForOtherYouDontHave"],
        salesCount: json["salesCount"],
        mostProductSoldForOthers: json["mostProductSoldForOthers"],
        mostProductSoldName: json["mostProductSoldName"],
        totalIncomes: json["totalIncomes"],
        productsCount: json["productsCount"],
        mostProductSoldCount: json["mostProductSoldCount"],
        mostProductSoldIncomes: json["mostProductSoldIncomes"],
        averageCustomerRates: json["averageCustomerRates"].toDouble(),
        highPriceProduct: json["highPriceProduct"],
    );

    Map<String, dynamic> toJson() => {
        "bestProductForOtherYouDontHave": bestProductForOtherYouDontHave,
        "salesCount": salesCount,
        "mostProductSoldForOthers": mostProductSoldForOthers,
        "mostProductSoldName": mostProductSoldName,
        "totalIncomes": totalIncomes,
        "productsCount": productsCount,
        "mostProductSoldCount": mostProductSoldCount,
        "mostProductSoldIncomes": mostProductSoldIncomes,
        "averageCustomerRates": averageCustomerRates,
        "highPriceProduct": highPriceProduct,
    };
}
