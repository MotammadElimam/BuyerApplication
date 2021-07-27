import 'package:buyer_application/screens/contact%20us/Body.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Contact_Us extends StatelessWidget {
   static String routeName = "/اتصل بنا";
   Contact_Us({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اتصل بنا",style: TextStyle(fontFamily: 'Tajawal'),),
      ),
      body: Body(),
    );
  }
}