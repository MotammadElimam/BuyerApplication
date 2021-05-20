class AddOrderRequest {
  String address;
  String paymentType;
  List<OrderProducts> orderProducts;

  AddOrderRequest({this.address, this.paymentType, this.orderProducts});

  AddOrderRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    paymentType = json['payment_type'];
    if (json['order_products'] != null) {
      orderProducts = new List<OrderProducts>();
      json['order_products'].forEach((v) {
        orderProducts.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['payment_type'] = this.paymentType;
    if (this.orderProducts != null) {
      data['order_products'] =
          this.orderProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderProducts {
  String productId;
  String quantity;

  OrderProducts({this.productId, this.quantity});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
