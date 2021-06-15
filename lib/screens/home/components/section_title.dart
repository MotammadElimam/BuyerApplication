import 'package:flutter/material.dart';
import 'package:buyer_application/size_config.dart';


class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "المزيد",
          style: TextStyle(
           
            fontFamily: 'Tajawal',
            color: Color(0xFFBBBBBB),
          ),
        ),
           Text(
            title,
            style: TextStyle(color:Colors.black , fontSize: getProportionateScreenWidth(18),),
          ),
        
      ],
    );
  }
}
