import 'package:buyer_application/screens/home/home_screen.dart';
import 'package:buyer_application/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/components/buttons/primary_button.dart';
import 'package:buyer_application/controllers/databasehelper.dart';
import 'package:device_apps/device_apps.dart';

class SignasbuyerorSellerScreen extends StatelessWidget {
  static String routeName = "/SignasbuyerorSellerScreen";

  const SignasbuyerorSellerScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "سجل كبائع او كمشتري",
          style: TextStyle(fontFamily: 'Tajawal'),
        ),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
            text: "سجل كمشتري",
            press: () {
              // Navigator.pushNamed(context, EditProductScreen.routeName);
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButton(text: "سجل كبائع", press: () {
            print("object");
            DeviceApps.openApp("com.example.sellerapplication");
          }),
        ],
      ),
    );
  }
}
