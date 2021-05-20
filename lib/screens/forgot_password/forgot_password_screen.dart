import 'package:flutter/material.dart';
import 'package:buyer_application/screens/forgot_password/components/body.dart';


class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/استرجاع الرقم السري";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("استرجاع الرقم السري"),
      ),
      body: Body(),
    );
  }
}
