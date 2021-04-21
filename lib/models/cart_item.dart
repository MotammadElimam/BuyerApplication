import 'package:buyer_application/models/Product.dart';


class CartItem {
  int id;
  Product product;
  int quantity = 0;
  int getTotalPrice() => product.price * quantity;

  CartItem();
  
  CartItem.fromData({
    this.product,
    this.quantity
  });
}