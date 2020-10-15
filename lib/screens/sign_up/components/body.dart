import 'package:BuyerApplication/constants.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Register Account",
            style: headingStyle,
            ),
          Text("Complete Your Data or Continue \nWith social media"),
        ],
      ),
    );
  }
}
