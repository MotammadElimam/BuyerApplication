import 'package:flutter/material.dart';
import 'package:buyer_application/components/coustom_bottom_nav_bar.dart';
import 'package:buyer_application/enums.dart';
import 'package:buyer_application/screens/profile/components/body.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
