import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/default_button.dart';
import '../../../controller/ProductProvider.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: true);
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
                              DefaultButton(
                                text: provider.isAdded(product)
                                    ? "Added To Cart"
                                    : "Add To Cart",
                                press: () {
                                  provider.isAdded(product)
                                      ? provider.removeProduct(product)
                                      : provider.addProduct(product);
                                },
                              ),
                              SizedBox(height: 15),
                              DefaultButton(
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
