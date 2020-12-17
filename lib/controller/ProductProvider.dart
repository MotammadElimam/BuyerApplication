import 'package:flutter/material.dart';

import '../models/Product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productsInCart = [];
  double quentity = 0.0;
  double price = 0.0;
  List<Product> cartItems = [];
  Map<String, double> cartItemsNumber = {};
  int _counter = 0;

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

  // addProduct(Product product) {
  //   productsInCart.add(product);
  //   print('size' + productsInCart.length.toString());
  //   notifyListeners();
  // }

  bool isAdded(Product product) {
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

  // removeProduct(Product product) {
  //   productsInCart.remove(product);
  //   notifyListeners();
  // }

  getPrice(Product product) {
    return cartItemsNumber[product.id] * product.price;
  }

  getProductQuenitiy(Product product) {
    return cartItemsNumber[product.id];
  }

  getV() => _counter;

  incrm() {
    _counter++;
    notifyListeners();
  }
}
