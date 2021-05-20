import 'package:buyer_application/models/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/models/Cart.dart';


class ProductProvider extends ChangeNotifier {
  var price = 0.0;
  Cart cart = Cart();
  Wishlist wishlist = Wishlist();



  int id;
  String email;
  String password;
  String confirmPassword;
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  String paymentMethod;

  // addToCart(CartItem cartItem) {
  //   try {
  //     cart.cartItems.add(cartItem);
  //     getTotalPrice();
  //   } catch (e) {
  //     print('catch $e');
  //   }
  //   notifyListeners();
  // }

  // removeFromCart(CartItem cartItem) {
  //   try {
  //     cart.cartItems.remove(cartItem);
  //     getTotalPrice();
  //   } catch (e) {
  //     print('catch $e');
  //   }
  //   notifyListeners();
  // }

  // addToWishlist(Wishlistitem wishlistitem) {
  //   try {
  //     wishlist.wishlistitems.add(wishlistitem);
  //   } catch (e) {
  //     print('catch $e');
  //   }
  //   notifyListeners();
  // }


  // removeFromWishlist(Wishlistitem wishlistitem) {
  //   try {
  //     wishlist.wishlistitems.remove(wishlistitem);
  //   } catch (e) {
  //     print('catch $e');
  //   }
  //   notifyListeners();
  // }

  // getTotalPrice() {
  //   price = cart.cartItems.sumByDouble((c) => c.getTotalPrice());
  // }

}
