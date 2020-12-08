import 'package:flutter/material.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/screens/splash/components/body.dart';

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
