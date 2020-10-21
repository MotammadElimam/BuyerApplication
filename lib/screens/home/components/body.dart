import 'package:flutter/material.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: SizeConfig.screenWidth * 0.6, //60% of our width
                    //height: 50,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                        onChanged: (value) {
                          //Search value
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Search Product",
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                            vertical: getProportionateScreenWidth(9),
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: (){},
                                      child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(12)),
                          height: getProportionateScreenHeight(46),
                          width: getProportionateScreenWidth(46),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("assets/icons/Bell.svg"),
                        ),
                        Positioned(
                          top: -3,
                          right: 0,
                          child: Container(
                            height: getProportionateScreenWidth(16),
                            width: getProportionateScreenWidth(16),
                            decoration: BoxDecoration(
                                color: Color(0xFFFF4848),
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1.5, color: Colors.white)),
                            child: Center(
                                child: Text(
                              "3",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(10),
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  
                                  ),
                            )),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          )
        ],
      )),
    );
  }
}
