import 'package:BuyerApplication/screens/cart/cart_screen.dart';
import 'package:BuyerApplication/screens/home/home_screen.dart';
import 'package:BuyerApplication/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:patereon/screens/orderDetails/order_details_screen.dart';
//import 'package:patereon/screens/profile/profile_screen.dart';

//import '../screens/search/search_screen.dart';
import '../size_config.dart';

import '../constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // Bydefault first one is selected
  int _selectedIndex = 0;

  // List of nav items
  List<Map<String, dynamic>> _navitems = [
    {"icon": "assets/icons/home.svg", "title": "Home"},
    {"icon": "assets/icons/profile.svg", "title": "Profile"},
    {"icon": "assets/icons/Cart Icon.svg", "title": "Cart"},
    
  ];

// Screens
 List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    //ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    /// If you set your home screen as first screen make sure call [SizeConfig().init(context)]
    SizeConfig().init(context);
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CupertinoTabBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        activeColor: kActiveColor,
        inactiveColor: kBodyTextColor,
        items: List.generate(
          _navitems.length,
          (index) => BottomNavigationBarItem(
            icon: buildSvgIcon(
                src: _navitems[index]['icon'],
                isActive: _selectedIndex == index),
            title: Text(
              _navitems[index]["title"],
            ),
          ),
        ),
      ),
    );
  }

  SvgPicture buildSvgIcon({@required String src, bool isActive = false}) {
    return SvgPicture.asset(
      src,
      height: 30,
      width: 30,
      color: isActive ? kActiveColor : kBodyTextColor,
    );
  }
}
