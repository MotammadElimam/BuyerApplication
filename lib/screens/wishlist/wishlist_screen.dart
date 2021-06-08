import 'package:buyer_application/Local_database/WishlistDatabase.dart';
import 'package:buyer_application/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/screens/wishlist/components/body.dart';

import '../../enums.dart';

class WishListScreen extends StatefulWidget {
  static String routeName = "/wishlist";

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List<WishlistDatabase> products;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    products = new List<WishlistDatabase>();
    readCart();
  }

  readCart() async {
    DatabaseSqlLite cartdata = new DatabaseSqlLite();
    products = await cartdata.getAllCartProduct().whenComplete(() {
      setState(() {});
    });
    //print("products : " + products.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(products: products),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.wishlist),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "قائمة الأمنيات",
            style: TextStyle(color: Colors.black,fontFamily: 'Tajawal',),
          ),
        ],
      ),
    );
  }
}
