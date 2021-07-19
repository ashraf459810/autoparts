import 'dart:convert';

class VendorBrands {
  int id;

  String img;
  String name;

  VendorBrands({
    this.id,
    this.name,
    this.img,
  });

  factory VendorBrands.fromJson(Map<String, dynamic> jsonData) {
    return VendorBrands(
      id: jsonData['id'],
 
      name: jsonData['name'],
      img: jsonData['img'],

    );
  }

  static Map<String, dynamic> toMap(VendorBrands vendorBrands) => {
        'id': vendorBrands.id,

        'name': vendorBrands.name,
        'img': vendorBrands.img,
  
      };

  static String encode(List<VendorBrands> vendorbrands) => json.encode(
        vendorbrands
            .map<Map<String, dynamic>>((vendorbrands) => VendorBrands.toMap(vendorbrands))
            .toList(),
      );

  static List<VendorBrands> decode(String vendorbrands) =>
      (json.decode(vendorbrands) as List<dynamic>)
          .map<VendorBrands>((item) => VendorBrands.fromJson(item))
          .toList();
}


