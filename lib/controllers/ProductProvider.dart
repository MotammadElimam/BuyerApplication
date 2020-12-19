import 'package:flutter/material.dart';
import 'package:BuyerApplication/models/Product.dart';

import '../models/Product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productsInCart = [];
<<<<<<< HEAD
  double quantity = 0.0;
=======
  double quentity = 0.0;
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634
  double price = 0.0;
  List<Product> cartItems = [];
  Map<String, double> cartItemsNumber = {};
  int _counter = 0;

<<<<<<< HEAD

  void addProduct(Product product) {
    if (!cartItems.contains(product)) {
      quantity++;
=======
  void addProduct(Product product) {
    if (!cartItems.contains(product)) {
      quentity++;
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634
      cartItemsNumber['${product.id}'] = 1;
      cartItems.add(product);
    } else {
      cartItemsNumber['${product.id}']++;
    }
    price += product.price;
    notifyListeners();
  }

<<<<<<< HEAD

  bool isAdded(Product product){
    return cartItems.contains(product);
  }


  void removeProduct(Product product) {
    if (cartItems.contains(product) && cartItemsNumber['${product.id}'] > 0) {
      if (quantity > 0) {
        quantity--;
=======
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
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634
      }
      cartItemsNumber['${product.id}']--;
    } else if (cartItemsNumber[product.id] == 1) {
      cartItems.remove(product);
    }
<<<<<<< HEAD
    if(price > 0){
      price -= product.price;
    }
    else
    {
      price = 0;
    }
    notifyListeners();
  }

=======
    price -= product.price;
    notifyListeners();
  }

  // removeProduct(Product product) {
  //   productsInCart.remove(product);
  //   notifyListeners();
  // }

>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634
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

<<<<<<< HEAD

=======
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634
  getV() => _counter;

  incrm() {
    _counter++;
    notifyListeners();
  }
}
