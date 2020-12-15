import 'package:flutter/material.dart';

import '../models/Product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productsInCart = [];
  int _counter = 0;

  addProduct(Product product) {
    productsInCart.add(product);
    print('size' + productsInCart.length.toString());
    notifyListeners();
  }

  bool isAdded(Product product) {
    return productsInCart.contains(product);
  }

  removeProduct(Product product) {
    productsInCart.remove(product);
    notifyListeners();
  }

  getV() => _counter;

  incrm() {
    _counter++;
    notifyListeners();
  }
}
