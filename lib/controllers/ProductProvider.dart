import 'package:flutter/material.dart';
import 'package:BuyerApplication/models/Product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productsInCart = [];
  double quantity = 0.0;
  double price = 0.0;
  List<Product> cartItems = [];
  Map<String, double> cartItemsNumber = {};
  int _counter = 0;


  void addProduct(Product product) {
    if (!cartItems.contains(product)) {
      quantity++;
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
      if (quantity > 0) {
        quantity--;
      }
      cartItemsNumber['${product.id}']--;
    } else if (cartItemsNumber[product.id] == 1) {
      cartItems.remove(product);
    }
    if(price > 0){
      price -= product.price;
    }
    else
    {
      price = 0;
    }
    notifyListeners();
  }

  getPrice(Product product) {
    return cartItemsNumber[product.id] * product.price;
  }

  getProductQuenitiy(Product product) {
    return cartItemsNumber[product.id];
  }

  totalPric() {
    double price = 0.0;
    cartItems.map((e) => price += e.price);
    return price;
  }


  getV() => _counter;

  incrm() {
    _counter++;
    notifyListeners();
  }
}
