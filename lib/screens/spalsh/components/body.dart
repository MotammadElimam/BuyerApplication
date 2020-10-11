import 'package:BuyerApplication/constants.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SizedBox(
          width: double.infinity,
                      child: Column(
        children: [
            Expanded(
                flex : 3,
                child: Column(
                  children: [
                    Text(
                      "MyShopp",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(36),
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                      ),),
                      Text("Welcome to the shop!"),
                      Image.asset("C:\Users\Motamed\Desktop\BuyerApplication\assets\images\9320.png",
                      height: getProportionateScreenHeight(256),
                      )
                  ],
                )
            ),
            Expanded(
                flex: 2,
                child:SizedBox())
        ],
      ),
          ),
    );
  }
}
