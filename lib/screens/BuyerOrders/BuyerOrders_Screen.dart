import 'package:buyer_application/screens/BuyerOrders/components/Body.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/components/coustom_bottom_nav_bar.dart';
import 'package:buyer_application/enums.dart';




// ignore: must_be_immutable
class BuyerOrdersScreen extends StatelessWidget {
  static String routeName = "/طلبات العملاء";
 // SellerProductsItem sellerProductsItem = SellerProductsItem();

  BuyerOrdersScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar:
      CustomBottomNavBar(selectedMenu: MenuState.orders),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "طلباتك",
            style: TextStyle(color: Colors.black,fontFamily: 'Tajawal',),
          ),
        ],
      ),
    );
  }
}
