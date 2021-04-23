import 'package:buyer_application/screens/checkout/Body.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
   static String routeName = "/Checkout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check out"),
      ),
      body: Body(),
    );
  }
}