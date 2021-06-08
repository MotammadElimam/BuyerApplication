import 'package:buyer_application/Local_database/sqllite.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  CartProvider() {
      _init();
  }

  Future _init() async {
     DatabaseHelperSqlLite cartdata = new DatabaseHelperSqlLite();
        products = await cartdata.getAllCartProduct();
  }


List<CartDatabase> products;



  double getTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < products.length; i++) {
      double subtotal =
          double.parse(products[i].price) * int.parse(products[i].quantity);

      totalPrice = totalPrice + subtotal;
    }
    return totalPrice;
  }
}