import 'package:BuyerApplication/models/Product.dart';


class CartItem {
  int id;
  Product product;
  int quantity = 0;
  double getTotalPrice() => product.price * quantity;

  CartItem();
  
  CartItem.fromData({
    this.product,
    this.quantity
  });
}