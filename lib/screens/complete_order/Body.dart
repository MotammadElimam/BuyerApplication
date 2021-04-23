import 'package:flutter/material.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/screens/complete_order/complete_order_form.dart';
import 'package:buyer_application/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Complete Order", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                  CompleteOrderForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
