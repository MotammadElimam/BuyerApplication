import 'package:flutter/material.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("التحقق",style: TextStyle(fontFamily: 'Tajawal'),),
      ),
      body: Body(),
    );
  }
}
