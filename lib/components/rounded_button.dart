import 'package:buyer_application/size_config.dart';
import 'package:flutter/material.dart';





class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.iconData,
    @required this.press,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(50),
      width: getProportionateScreenWidth(50),
      // ignore: deprecated_member_use
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          side: BorderSide(
            color: Color(0xFF979797).withOpacity(0.1),
          ),
        ),
        onPressed: press,
        child: Icon(iconData),
      ),
    );
  }
}
