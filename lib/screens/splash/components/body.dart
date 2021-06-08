import 'package:buyer_application/components/dot_indicators.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/screens/complete_order/Confirmation_Screen.dart';
import 'package:buyer_application/screens/home/home_screen.dart';
import 'package:buyer_application/screens/sign_in/components/sign_as_buyer_or_seller.dart';
import 'package:buyer_application/screens/sign_in/sign_in_screen.dart';
import 'package:buyer_application/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/components/buttons/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Spacer(flex: 2),
          Expanded(
            flex: 14,
            child: PageView.builder(
              itemCount: demoData.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) => SplashContent(
                illustration: demoData[index]["illustration"],
                title: demoData[index]["title"],
                text: demoData[index]["text"],
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(demoData.length,
                (index) => DotIndicator(isActive: index == currentPage)),
          ),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: PrimaryButton(
               press: () async {
                final prefs = await SharedPreferences.getInstance();
                final key = 'token';
                final value = prefs.get(key) ?? 0;
                print(value);
                prefs.setBool('splash', true);
                if (value != '0') {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                } else {
                  Navigator.pushNamed(context, SignasbuyerorSellerScreen.routeName);
                }
              },
              text: "ابدأ الان",
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "assets/Illustrations/Illustrations_1.svg",
    "title": "كل ماتتمناه في تطبيق واحد",
    "text": "اطلب من افضل البائعين المحليين في المدينة" 
  },
  {
    "illustration": "assets/Illustrations/Illustrations_2.svg",
    "title": "عروض توصيل مجانية",
    "text":
        "توصيل مجاني للعملاء الجدد من خلال الدفع عن طريق سايبر باي\nوطرق الدفع الأخرى",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_3.svg",
    "title": "اطلب منتجاتك المفضلة",
    "text":
        "اطلب بسهولة منتجاتك المفضلة\nوسيتم التوصيل لك ف اقرب وقت",
  },
];