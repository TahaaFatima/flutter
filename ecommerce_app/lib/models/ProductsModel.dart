// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecommerce_app/models/RatingModel.dart';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

/* String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); */

class ProductsModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  // RatingModel rating;

  ProductsModel({
    this.id = 0,
    this.title = '',
    this.price = 0.00,
    this.description = '',
    this.category = '',
    this.image = '',
    // this.rating = RatingModel
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      category: json["category"],
      image: json["image"],
      // rating: RatingModel.fromJson(json['rating'])
    );
  }

  /* Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      }; */
}
