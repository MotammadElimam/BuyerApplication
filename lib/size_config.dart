import 'package:flutter/material.dart';

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    //get the proportionate height as per screen size
    double getProportionateScreenHieght(double intputHeight){
      double screenHeight = SizeConfig.screenHeight;
      //812 is the layout height that designer use
      return(intputHeight/812.0)*screenHeight;
    }

    //get the proportionate height as per screen size
    double getProportionateScreenWidth (double inputwidth){
      double screenWidth = SizeConfig.screenWidth;
      //375 is the layout height that designer use
      return (inputwidth/375.0)*screenWidth;
    }
  }
}