import 'package:buyer_application/screens/checkout/Body.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
   static String routeName = "/Checkout";
    double total;
    CheckoutScreen({Key key, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check out"),
      ),
      body: Body(total:total),
    );
  }
}