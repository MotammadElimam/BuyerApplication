import 'package:BuyerApplication/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:BuyerApplication/models/Product.dart';

class Cart {
//  Product product;
//  int numOfItem;
 double totalPrice = 0.0;
  List<CartItem> cartItems = <CartItem>[];

  Cart();
  //Cart({this.totalPrice, @required this.product, @required this.numOfItem});
}

// Demo data for our cart

/*List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[2], numOfItem: 1),
];*/
