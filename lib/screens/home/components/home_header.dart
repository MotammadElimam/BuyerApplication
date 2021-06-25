//import 'package:buyer_application/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/screens/home/components/icon_btn_with_counter.dart';
//import 'package:buyer_application/screens/home/components/search_field.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/cart/cart_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
       mainAxisAlignment: MainAxisAlignment.end,
        children: [
         // SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () => Navigator.pushNamed(context, WishListScreen.routeName),
          // ),
        ],
      ),
    );
  }
}
