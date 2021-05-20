import 'package:flutter/material.dart';
import 'package:buyer_application/screens/cart/components/body.dart';
import 'package:buyer_application/screens/cart/components/check_out_card.dart';
import 'package:buyer_application/database/sqllite.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartDatabase> products;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    products = new List<CartDatabase>();
    readCart();
  }

  readCart() async {
    DatabaseHelperSqlLite cartdata = new DatabaseHelperSqlLite();
    products = await cartdata.getAllCartProduct().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(products: products),
      bottomNavigationBar: CheckoutCard(products: products),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
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
