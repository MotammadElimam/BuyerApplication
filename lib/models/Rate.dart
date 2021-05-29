class ItemsOfOrders {
  String rate;

  ItemsOfOrders({this.rate});

  ItemsOfOrders.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    return data;
  }
}
