import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // you have to call it on starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
