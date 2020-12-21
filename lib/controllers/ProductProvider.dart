import 'package:flutter/material.dart';
import 'package:BuyerApplication/models/Cart.dart';
import 'package:BuyerApplication/models/cart_item.dart';
import 'package:supercharged/supercharged.dart';


class ProductProvider extends ChangeNotifier {
  double price = 0.0;
  double quentity = 0.0;
  Cart cart = Cart();
  Map<String, double> cartItemsNumber = {};


addToCart(CartItem cartItem) {
    try{
      cart.cartItems.add(cartItem);
      getTotalPrice();
    }catch(e){
      print('catch $e');
    }
    notifyListeners();
  }

removeFromCart(CartItem cartItem) {
    try{
      cart.cartItems.remove(cartItem);
      getTotalPrice();
    }catch(e){
      print('catch $e');
    }
    notifyListeners();
  }

  getTotalPrice(){
    price = cart.cartItems.sumByDouble((c) => c.getTotalPrice());
  }

  /*void addProduct(Product product) {
    if (!cartItems.contains(product)) {
      quentity++;
      cartItemsNumber['${product.id}'] = 1;
      cartItems.add(product);
    } else {
      cartItemsNumber['${product.id}']++;
    }
    price += product.price;
    notifyListeners();
  }*/

  /*bool isAdded(Product product){
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
*/



  getV() => price;

  incrm() {
    price++;
    notifyListeners();
  }
}
