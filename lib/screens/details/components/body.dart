import 'package:flutter/material.dart';
import 'package:BuyerApplication/components/buttons/primary_button.dart';
import 'package:BuyerApplication/models/Product.dart';
//import 'package:BuyerApplication/controllers/ProductProvider.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/screens/details/components/product_description.dart';
import 'package:BuyerApplication/screens/details/components/top_rounded_container.dart';
import 'package:BuyerApplication/screens/details/components/product_images.dart';
//import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.15,
                              right: SizeConfig.screenWidth * 0.15,
                              bottom: getProportionateScreenWidth(40),
                              top: getProportionateScreenWidth(15),
                            ),
                            child: Column(children: [
                              PrimaryButton(
                                text: "Add To Cart",
                                press: () {},
                              ),
                              SizedBox(height: 15),
                              PrimaryButton(
                                text: "Buy Now",
                                press: () {},
                              ),
                            ])),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
