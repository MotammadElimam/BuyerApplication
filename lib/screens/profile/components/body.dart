import 'package:buyer_application/screens/complete_order/Confirmation_Screen.dart';
import 'package:buyer_application/screens/contact%20us/Contact_Us.dart';
import 'package:buyer_application/screens/profile/setting.dart';
import 'package:buyer_application/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          //ProfilePic(),
          SizedBox(height: 200),
          // ProfileMenu(
          //   text: "بيانات الحساب",
          //   icon: "assets/icons/User Icon.svg",
          //   press: () => {},
          // ),
          // ProfileMenu(
          //   text: "الاشعارات",
          //   icon: "assets/icons/Bell.svg",
          //   press: () {},
          // ),
          // ProfileMenu(
          //   text: "الاعدادات",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {
          //     Navigator.pushNamed(context, SettingsPage.routeName);
          //   },
          // ),
          ProfileMenu(
            text: "اتصل بنا",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, Contact_Us.routeName);
            },
          ),
          ProfileMenu(
            text: "تسجيل الخروج",
            icon: "assets/icons/Log out.svg",
            press: () {
              _save('0');
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
