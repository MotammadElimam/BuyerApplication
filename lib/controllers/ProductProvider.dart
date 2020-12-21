import 'package:BuyerApplication/models/Product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productsInCart = [];
  int price = 0;

  addProduct(Product product) {

    productsInCart.add(product);
    print('size'+productsInCart.length.toString());
    notifyListeners();
  }

  bool isAdded(Product product){
    return productsInCart.contains(product);

  }
  removeProduct(Product product) {
    productsInCart.remove(product);
    notifyListeners();
  }

  getV() => price;

  incrm() {
    price++;
    notifyListeners();
  }
}
