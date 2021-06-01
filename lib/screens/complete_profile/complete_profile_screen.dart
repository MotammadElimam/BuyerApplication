import 'package:flutter/material.dart';
import 'package:buyer_application/screens/complete_profile/components/body.dart';


class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التسجيل',style: TextStyle(fontFamily: 'Tajawal'),),
      ),
      body: Body(),
    );
  }
}
