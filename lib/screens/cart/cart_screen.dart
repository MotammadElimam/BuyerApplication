import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:BuyerApplication/models/Cart.dart';
import 'package:BuyerApplication/screens/cart/components/body.dart';
import 'package:BuyerApplication/screens/cart/components/check_out_card.dart';
=======

import '../../models/Cart.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
