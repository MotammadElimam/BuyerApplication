import 'package:flutter/material.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/SplashScreen";
  @override
  Widget build(BuildContext context) {
    // Splash is our starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
