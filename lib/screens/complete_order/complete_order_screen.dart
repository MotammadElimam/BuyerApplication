import 'package:flutter/material.dart';
import 'package:buyer_application/screens/complete_order/Body.dart';


class CompleteOrderScreen extends StatelessWidget {
  static String routeName = "/complete_order_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تأكيد الطلب",style: TextStyle(fontFamily: 'Tajawal'),),
      ),
      body: Body(),
    );
  }
}
