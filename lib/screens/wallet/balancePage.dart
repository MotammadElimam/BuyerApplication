import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalancePage extends StatelessWidget {
  static String routeName = "/BalancePage";
  BalancePage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(30.5, 70.0),
            child: SvgPicture.string(
              _svg_7p1127,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(101.0, 373.0),
            child: Text(
              '0.0 SDG',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 50,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(103.0, 265.0),
            child: Text(
              'Balance',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 50,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_7p1127 =
    '<svg viewBox="30.5 70.0 22.0 9.9" ><path transform="translate(30.5, 70.0)" d="M 22 4.969542980194092 C 22 4.653130054473877 21.74407768249512 4.397208213806152 21.42766571044922 4.397208213806152 L 1.945008516311646 4.397208213806152 L 5.369712352752686 0.9725042581558228 C 5.593062400817871 0.7491539716720581 5.593062400817871 0.3908629417419434 5.369712352752686 0.1675126850605011 C 5.1463623046875 -0.05583756417036057 4.788071155548096 -0.05583756417036057 4.564720630645752 0.1675126850605011 L 0.1675126850605011 4.564720630645752 C -0.05583756417036057 4.788071155548096 -0.05583756417036057 5.1463623046875 0.1675126850605011 5.369712352752686 L 4.564720630645752 9.76692008972168 C 4.676395893096924 9.878595352172852 4.820642948150635 9.934432983398438 4.969542980194092 9.934432983398438 C 5.118443489074707 9.934432983398438 5.262690544128418 9.878595352172852 5.374365329742432 9.76692008972168 C 5.597715854644775 9.543570518493652 5.597715854644775 9.18527889251709 5.374365329742432 8.961929321289063 L 1.949661612510681 5.537225246429443 L 21.43697166442871 5.537225246429443 C 21.74407768249512 5.537225246429443 22 5.285955905914307 22 4.969542980194092 Z" fill="#c5ccd6" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
