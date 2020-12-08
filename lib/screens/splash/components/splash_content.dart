import 'package:BuyerApplication/constants.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    @required this.illustration,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  final String illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset(illustration),
          ),
        ),
        VerticalSpacing(of: 50),
        Text(
          title,
          style: kHeadlineTextStyle,
        ),
        VerticalSpacing(of: 8),
        Text(
          text,
          style: kBodyTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
