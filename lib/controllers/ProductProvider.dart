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



}
