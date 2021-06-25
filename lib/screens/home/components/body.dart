import 'package:buyer_application/components/big_card_image_slide.dart';
import 'package:buyer_application/demoData.dart';
import 'package:buyer_application/screens/home/components/TopProductsRatings.dart';
import 'package:buyer_application/screens/home/components/popular_product.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/screens/home/components/home_header.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/home/components/categories.dart';
import 'package:buyer_application/screens/home/components/special_offers.dart';


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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BigCardImageSlide(images: demoBigImages),
            ),
            //Categories(),
          //  SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(10)),
            TopProductsRatings(),
            PopularProducts(),
            //SizedBox(height: getProportionateScreenWidth(30)),
            
          ],
        ),
      ),
    );
  }
}
