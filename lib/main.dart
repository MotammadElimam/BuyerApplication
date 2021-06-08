import 'package:buyer_application/controllers/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/routes.dart';
import 'package:buyer_application/theme.dart';
import 'package:buyer_application/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'controllers/ProductProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
         ChangeNotifierProvider<CartProvider>(create: (context)=>CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we don't need to remember the name
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
