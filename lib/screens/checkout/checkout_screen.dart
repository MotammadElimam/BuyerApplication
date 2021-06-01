import 'package:buyer_application/screens/checkout/Body.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatelessWidget {
   static String routeName = "/إكمال الطلب";
    double total;
    CheckoutScreen({Key key, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إكمال الطلب",style: TextStyle(fontFamily: 'Tajawal'),),
      ),
      body: Body(total:total),
    );
  }
}