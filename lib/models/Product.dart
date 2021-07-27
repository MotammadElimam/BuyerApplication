// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

List<Product> productFromMap(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

String productToMap(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Product {
    Product({
        this.id,
        this.name,
        this.price,
        this.desc,
        this.image,
        this.sellerId,
        this.createdAt,
        this.updatedAt,
        this.ratingsAvgRate,
    });

    int id;
    String name;
    var price;
    String desc;
    String image;
    var sellerId;
    DateTime createdAt;
    DateTime updatedAt;
    double ratingsAvgRate;

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        desc: json["desc"],
        image: json["image"],
        sellerId: json["seller_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ratingsAvgRate: json["ratings_avg_rate"]  == null ? 0.0 : double.parse(json["ratings_avg_rate"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "desc": desc,
        "image": image,
        "seller_id": sellerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "ratings_avg_rate": ratingsAvgRate == null ? null : ratingsAvgRate,
    };
}
