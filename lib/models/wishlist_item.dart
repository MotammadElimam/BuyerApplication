import 'package:BuyerApplication/models/Product.dart';


class Wishlistitem {
  int id;
  Product product;

  Wishlistitem();
  
  Wishlistitem.fromData({
    this.product,
  });
}