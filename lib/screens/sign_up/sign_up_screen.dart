import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:BuyerApplication/screens/sign_up/components/body.dart';

=======

import 'components/body.dart';
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
