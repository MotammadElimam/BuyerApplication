import 'package:flutter/material.dart';
import 'package:BuyerApplication/screens/wishlist/components/body.dart';
import 'package:BuyerApplication/screens/wishlist/components/check_out_card.dart';



class WishListScreen extends StatelessWidget {
  static String routeName = "/wishlist";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: WishlistCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Wishlist",
            style: TextStyle(color: Colors.black),
          ),
          /*Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),*/
        ],
      ),
    );
  }
}
