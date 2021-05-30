import 'package:buyer_application/screens/ItemsOfOrder/components/Body.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/components/coustom_bottom_nav_bar.dart';
import 'package:buyer_application/enums.dart';




// ignore: must_be_immutable
class ItemsofOrderScreen extends StatelessWidget {
  static String routeName = "/itemsoforder";
  String orderNumber;
 // SellerProductsItem sellerProductsItem = SellerProductsItem();

  ItemsofOrderScreen({Key key,@required this.orderNumber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(orderNumber: orderNumber,),
      bottomNavigationBar:
      CustomBottomNavBar(selectedMenu: MenuState.orders),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "تفاصيل الطلب",
            style: TextStyle(color: Colors.black,fontFamily: 'Tajawal'),
          ),
        ],
      ),
    );
  }
}
