import 'package:flutter/material.dart';
import 'package:BuyerApplication/components/coustom_bottom_nav_bar.dart';
import 'package:BuyerApplication/screens/home/components/body.dart';
import 'package:BuyerApplication/enums.dart';


class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
       bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}