import 'package:flutter/material.dart';
import 'package:BuyerApplication/screens/home/components/home_header.dart';
import 'package:BuyerApplication/screens/home/components/discount_banner.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(30)),
          DiscountBanner(),
          SizedBox(height: getProportionateScreenWidth(30)),
          Categories()
        ],
      )),
    );
  }
}

class Categories extends StatelessWidget {
  List<Map<String, dynamic>> categories = [
    {"icon": "assets/images/gift.svg", "text": "Gifts"},
    {"icon": "assets/images/Accessories.svg", "text": "fashion"},
    {"icon": "assets/images/bags.svg", "text": "Bags"},
    {"icon": "assets/images/food.svg", "text": "food"},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(55),
      child: AspectRatio(
        aspectRatio: 1,
         child: Container(
           decoration: BoxDecoration(
             color:Color(0xFFFFECDF),
           ),
      )),
    );
  }
}
