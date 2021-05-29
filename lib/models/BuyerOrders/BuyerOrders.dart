class BuyerOrders {
  List<Order> order;

  BuyerOrders({this.order});

  BuyerOrders.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      order = new List<Order>();
      json['data'].forEach((v) {
        order.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['data'] = this.order.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  String id;
  String orderNumber;

  Order({this.id, this.orderNumber});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    orderNumber = json['order_number'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    return data;
  }
}
