import 'package:buyer_application/components/buttons/primary_button.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/screens/complete_order/complete_order_screen.dart';
import 'package:buyer_application/size_config.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Body extends StatelessWidget {
   double total;
    Body({Key key, this.total}) : super(key: key);
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
                SizedBox(height: 50),
                buildPriceRow(text: "Total Without Vat", price: total),
                VerticalSpacing(of: 10),
                buildPriceRow(text: "Delivery", price: 0),
                VerticalSpacing(of: 10),
                buildTotal(price:  (total*0.4)+total),
                VerticalSpacing(of: 40),
                SizedBox(height: 400,),
                PrimaryButton(
              text: "Complete order",
              press: () {
                Navigator.popAndPushNamed(context, CompleteOrderScreen.routeName);
              },
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTotal({@required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: "Total ",
            style: kBodyTextStyle.copyWith(
                color: kMainColor, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: "(incl. VAT)",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Text(
          "\$$price",
          style: kBodyTextStyle.copyWith(
              color: kMainColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Row buildPriceRow({@required String text, @required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: kBodyTextStyle.copyWith(color: kMainColor),
        ),
        Text(
          "\$$price",
          style: kBodyTextStyle.copyWith(color: kMainColor),
        )
      ],
    );
  }
}
