import 'package:buyer_application/screens/balance_page/balancePage.dart';
import 'package:buyer_application/screens/profile/profile_screen.dart';
import 'package:buyer_application/screens/profile/setting.dart';
import 'package:buyer_application/screens/splash/splash_scrreen.dart';
import 'package:flutter/widgets.dart';
import 'package:buyer_application/screens/sign_in/sign_in_screen.dart';
import 'package:buyer_application/screens/forgot_password/forgot_password_screen.dart';
import 'package:buyer_application/screens/sign_up/sign_up_screen.dart';
import 'package:buyer_application/screens/complete_profile/complete_profile_screen.dart';
import 'package:buyer_application/screens/home/home_screen.dart';
import 'package:buyer_application/screens/otp/otp_screen.dart';
import 'package:buyer_application/screens/details/details_screen.dart';
import 'package:buyer_application/screens/cart/cart_screen.dart';
import 'package:buyer_application/screens/wishlist/wishlist_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  WishListScreen.routeName: (context) => WishListScreen(),
  ProfileScreen.routeName:(context) => ProfileScreen(),
  BalancePage.routeName:(context) => BalancePage(),
  SettingsPage.routeName:(context)=>SettingsPage(),
};
