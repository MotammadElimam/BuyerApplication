import 'package:buyer_application/constants.dart';
import 'package:buyer_application/size_config.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Body extends StatelessWidget {
   String total;
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
                buildPriceRow(text: "رقم الهاتف", contactinfo: "00249114815650"),
                 buildPriceRow(text: "الايميل", contactinfo: "mo3tammad@gmail.com"),
                  buildPriceRow(text: "Twitter", contactinfo: "@m3tmd"),
                VerticalSpacing(of: 10),
               // buildPriceRow(text: "Delivery", price: 0),
                VerticalSpacing(of: 10),
                VerticalSpacing(of: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTotal({@required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: "الايميل",
            style: kBodyTextStyle.copyWith(
                color: kMainColor, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          "mo3tammad@gmail.com",
          style: kBodyTextStyle.copyWith(
              color: kMainColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Row buildPriceRow({@required String text, @required String contactinfo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: kBodyTextStyle.copyWith(color: kMainColor),
        ),
        Text(
          "$contactinfo",
          style: kBodyTextStyle.copyWith(color: kMainColor),
        )
      ],
    );
  }
}
