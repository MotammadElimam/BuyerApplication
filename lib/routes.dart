import 'package:buyer_application/screens/BuyerOrders/BuyerOrders_Screen.dart';
import 'package:buyer_application/screens/ItemsOfOrder/Items_of_Order_Screen.dart';
import 'package:buyer_application/screens/wallet/WalletScreen.dart';
import 'package:buyer_application/screens/checkout/checkout_screen.dart';
import 'package:buyer_application/screens/complete_order/complete_order_screen.dart';
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
  WalleteScreen.routeName:(context) => WalleteScreen(),
  SettingsPage.routeName:(context)=>SettingsPage(),
  CheckoutScreen.routeName:(context)=>CheckoutScreen(),
  CompleteOrderScreen.routeName:(context)=>CompleteOrderScreen(),
  ItemsofOrderScreen.routeName:(context)=>ItemsofOrderScreen(orderNumber: '',),
  BuyerOrdersScreen.routeName:(context)=>BuyerOrdersScreen(),
};
