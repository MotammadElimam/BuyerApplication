import 'package:flutter/material.dart';
import 'package:BuyerApplication/size_config.dart';


const kMainColor = Color(0xFF010F07);
const kPrimaryColor = Color(0xff0288D1);
const kBodyTextColor = Color(0xFF868686);
const double kDefaultPadding = 20.0;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kActiveColor = Color(0xFF01579B);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF0AACC1), Color(0xFF006064)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
final TextStyle kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.bold,
);
final TextStyle kHeadlineTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(30),
  fontWeight: FontWeight.bold,
);
final TextStyle kBodyTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  color: kBodyTextColor,
  height: 1.5,
);

final TextStyle kH2TextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.w600,
  letterSpacing: 0.18,
);

final TextStyle kSecondaryBodyTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.w500,
  color: kMainColor,
  // height: 1.5,
);

// Default Animation Duration
const Duration kDefaultDuration = Duration(milliseconds: 250);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final TextStyle kSubHeadTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.w500,
  color: kMainColor,
  letterSpacing: 0.44,
);


// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}