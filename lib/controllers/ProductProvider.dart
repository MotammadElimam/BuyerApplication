

import 'package:BuyerApplication/models/Product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  double price = 0.0;
  double quentity = 0.0;
  List<Product> cartItems = [];
  Map<String, double> cartItemsNumber = {};


  void addProduct(Product product) {
    if (!cartItems.contains(product)) {
      quentity++;
      cartItemsNumber['${product.id}'] = 1;
      cartItems.add(product);
    } else {
      cartItemsNumber['${product.id}']++;
    }
    price += product.price;
    notifyListeners();
  }

  bool isAdded(Product product){
   return cartItems.contains(product);

  }
  

  void removeProduct(Product product) {
    if (cartItems.contains(product) && cartItemsNumber['${product.id}'] > 0) {
      if (quentity > 0) {
        quentity--;
      }
      cartItemsNumber['${product.id}']--;
    } else if (cartItemsNumber[product.id] == 1) {
      cartItems.remove(product);
    }
    price -= product.price;
    notifyListeners();
  }


  getV() => price;

  incrm() {
    price++;
    notifyListeners();
  }
}
