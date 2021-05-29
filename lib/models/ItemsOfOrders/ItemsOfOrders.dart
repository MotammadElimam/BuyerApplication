

class ItemsOfOrders {
  String id;
  String name;
  String price;
  String desc;
  String image;
  String sellerId;
  String createdAt;
  String updatedAt;

  ItemsOfOrders(
      {this.id,
      this.name,
      this.price,
      this.desc,
      this.image,
      this.sellerId,
      this.createdAt,
      this.updatedAt});

  ItemsOfOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    price = json['price'].toString();
    desc = json['desc'].toString();
    image = json['image'].toString();
    sellerId = json['seller_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['seller_id'] = this.sellerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
