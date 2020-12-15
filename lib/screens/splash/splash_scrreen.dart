import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

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
