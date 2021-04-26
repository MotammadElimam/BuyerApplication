// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    Order({
        this.address,
        this.paymentType,
        this.orderProducts,
    });

    String address;
    String paymentType;
    List<OrderProduct> orderProducts;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        address: json["address"],
        paymentType: json["payment_type"],
        orderProducts: List<OrderProduct>.from(json["order_products"].map((x) => OrderProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "payment_type": paymentType,
        "order_products": List<dynamic>.from(orderProducts.map((x) => x.toJson())),
    };
}

class OrderProduct {
    OrderProduct({
        this.productId,
        this.quantity,
    });

    String productId;
    String quantity;

    factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        productId: json["product_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
    };
}
