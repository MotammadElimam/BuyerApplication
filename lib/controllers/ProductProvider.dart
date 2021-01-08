import 'package:BuyerApplication/models/Wishlist.dart';
import 'package:BuyerApplication/models/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:BuyerApplication/models/Cart.dart';
import 'package:BuyerApplication/models/cart_item.dart';
import 'package:supercharged/supercharged.dart';

class ProductProvider extends ChangeNotifier {
  double price = 0.0;
  Cart cart = Cart();
  Wishlist wishlist = Wishlist();



  String email;
  String password;
  String confirmPassword;
  String firstName;
  String lastName;
  String phoneNumber;
  String adress;
  
  

  addToCart(CartItem cartItem) {
    try {
      cart.cartItems.add(cartItem);
      getTotalPrice();
    } catch (e) {
      print('catch $e');
    }
    notifyListeners();
  }

  removeFromCart(CartItem cartItem) {
    try {
      cart.cartItems.remove(cartItem);
      getTotalPrice();
    } catch (e) {
      print('catch $e');
    }
    notifyListeners();
  }

  addToWishlist(Wishlistitem wishlistitem) {
    try {
      wishlist.wishlistitems.add(wishlistitem);
    } catch (e) {
      print('catch $e');
    }
    notifyListeners();
  }


  removeFromWishlist(Wishlistitem wishlistitem) {
    try {
      wishlist.wishlistitems.remove(wishlistitem);
    } catch (e) {
      print('catch $e');
    }
    notifyListeners();
  }

  getTotalPrice() {
    price = cart.cartItems.sumByDouble((c) => c.getTotalPrice());
  }

}
