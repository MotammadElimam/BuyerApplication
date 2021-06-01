import 'package:flutter/material.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/complete_profile/components/complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("إكمال البيانات الشخصية", style: headingStyle),
                Text(
                  "أكمل ادخال بياناتك الشخصية",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                 Text(
                  "بإكمالك ادخال البيانات فإنك توافق على \nالشروط والأحكام الخاصة بنا",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
