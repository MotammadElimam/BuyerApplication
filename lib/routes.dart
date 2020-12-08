import 'package:BuyerApplication/screens/splash/splash_scrreen.dart';
import 'package:flutter/widgets.dart';
import 'package:BuyerApplication/screens/sign_in/sign_in_screen.dart';
import 'package:BuyerApplication/screens/forgot_password/forgot_password_screen.dart';
import 'package:BuyerApplication/screens/login_success/login_success_screen.dart';
import 'package:BuyerApplication/screens/sign_up/sign_up_screen.dart';
import 'package:BuyerApplication/screens/complete_profile/complete_profile_screen.dart';
import 'package:BuyerApplication/screens/home/home_screen.dart';
import 'package:BuyerApplication/screens/otp/otp_screen.dart';
import 'package:BuyerApplication/screens/details/details_screen.dart';
import 'package:BuyerApplication/screens/cart/cart_screen.dart';



// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};