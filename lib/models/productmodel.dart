import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id, description, brand, category, image, name;
  double? regularprice, currentprice, stock, discount;
  bool? value;
  int? qty = 1;
  ProductModel(
      {this.brand,
      this.qty = 1,
      this.value = false,
      this.category,
      this.currentprice,
      this.description,
      this.discount,
      this.id,
      this.image,
      this.regularprice,
      this.stock,
      this.name});
  factory ProductModel.fromJson(DocumentSnapshot map) {
    return ProductModel(
        qty: map["qty"],
        value: map["value"],
        name: map["name"],
        brand: map["brand"],
        category: map["category"],
        currentprice: map["currentprice"],
        regularprice: map["regularprice"],
        description: map["description"],
        discount: map["discount"],
        id: map.id,
        image: map["image"],
        stock: map["stock"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "qty": qty,
      "id": id,
      "value": value,
      "name": name,
      "brand": brand,
      "currentprice": currentprice,
      "regularprice": regularprice,
      "category": category,
      "description": description,
      "discount": discount,
      "image": image,
      "stock": stock
    };
  }
}
