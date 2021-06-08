import 'package:buyer_application/screens/BuyerOrders/BuyerOrders_Screen.dart';
import 'package:buyer_application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/components/buttons/primary_button.dart';

class ConfirmationScreen extends StatelessWidget {
  static String routeName = "/ConfirmationScreen";

  const ConfirmationScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "",
      //     style: TextStyle(fontFamily: 'Tajawal'),
      //   ),
      // ),
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("لقد تم تأكيد طلبك بنجاح",style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: getProportionateScreenWidth(25),
            ),),
          ),
         const SizedBox(height: 30,),
          PrimaryButton(
            text: "الذهاب إلى صفحة الطلبات",
            press: () {
              // Navigator.pushNamed(context, EditProductScreen.routeName);
              Navigator.pushNamed(context, BuyerOrdersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
