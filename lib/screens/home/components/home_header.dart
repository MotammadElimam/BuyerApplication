import 'package:flutter/material.dart';
import 'package:BuyerApplication/screens/home/components/icon_btn_with_counter.dart';
import 'package:BuyerApplication/screens/home/components/search_field.dart';
import 'package:BuyerApplication/size_config.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchField(),
            IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              press: (){},
            ),
            IconBtnWithCounter(
              svgSrc: "assets/icons/Bell.svg",
              numOfItems: 3,
              press: (){},
            )
          ]),
    );
  }
}



