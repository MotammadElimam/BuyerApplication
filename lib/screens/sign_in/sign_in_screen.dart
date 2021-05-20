import 'package:flutter/material.dart';
import 'package:buyer_application/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/تسجيل الدخول";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل الدخول"),
      ),
      body: Body(),
    );
  }
}
