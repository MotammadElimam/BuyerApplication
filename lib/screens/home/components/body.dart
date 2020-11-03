import 'package:BuyerApplication/screens/home/components/popular_product.dart';
import 'package:flutter/material.dart';
import 'package:BuyerApplication/screens/home/components/home_header.dart';
import 'package:BuyerApplication/screens/home/components/discount_banner.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/screens/home/components/categories.dart';
import 'package:BuyerApplication/screens/home/components/special_offers.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
