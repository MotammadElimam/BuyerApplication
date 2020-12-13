import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:BuyerApplication/constants.dart';
import 'package:BuyerApplication/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(),
              Text("Account Settings", style: kH2TextStyle),
              Text(
                "Update your settings like notifications, payments, profile edit etc.",
                style: kBodyTextStyle,
              ),
              VerticalSpacing(of: 10),
              ProfileMenuCard(
                svgSrc: "assets/icons/profile.svg",
                title: "Profile Information",
                subTitle: "Change your account information",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/lock.svg",
                title: "Change Password",
                subTitle: "Change your password",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/card.svg",
                title: "Payment Methods",
                subTitle: "Add your credit & debit cards",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/marker.svg",
                title: "Locations",
                subTitle: "Add or remove your delivery locations",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/fb.svg",
                title: "Add Social Account",
                subTitle: "Add Facebook, Twitter etc ",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/share.svg",
                title: "Refer to Friends",
                subTitle: "Get \$10 for reffering friends",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    Key key,
    this.title,
    this.subTitle,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  final String title, subTitle, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SvgPicture.asset(
                svgSrc,
                height: 24,
                width: 24,
                color: kMainColor.withOpacity(0.64),
              ),
              HorizontalSpacing(of: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style: kSecondaryBodyTextStyle,
                    ),
                    VerticalSpacing(of: 5),
                    Text(
                      subTitle,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: kMainColor.withOpacity(0.54),
                      ),
                    ),
                  ],
                ),
              ),
              HorizontalSpacing(of: 10),
              /*Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
