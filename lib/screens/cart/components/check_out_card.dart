import 'package:buyer_application/Local_database/sqllite.dart';
import 'package:buyer_application/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buyer_application/components/buttons/primary_button.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/size_config.dart';

// ignore: must_be_immutable
class CheckoutCard extends StatelessWidget {
  List<CartDatabase> products;
  CheckoutCard({Key key, this.products}) : super(key: key);

  double getTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < products.length; i++) {
      double subtotal =
          double.parse(products[i].price) * int.parse(products[i].quantity);

      totalPrice = totalPrice + subtotal;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    //return Consumer<ProductProvider>(builder: (context, cartbody, child) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("إضافة كود الخصم"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "المجموع:\n",
                    children: [
                      TextSpan(
                        text: "${getTotalPrice()}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: PrimaryButton(
                    text: "إكمال الطلب",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutScreen(total:getTotalPrice())),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}