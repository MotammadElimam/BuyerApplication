import 'package:buyer_application/constants.dart';
import 'package:buyer_application/models/Product.dart';
import 'package:buyer_application/screens/details/details_screen.dart';
import 'package:buyer_application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  final String serverUrl = "https://motamed.eanqod.website/storage/product/";
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
    @required this.press,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: product),
        ),
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Image.network(
                    serverUrl + product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.price+" SDG"}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                    ),
                  ),
                ],
              ), 
                 RatingBarIndicator(
                                      rating: product.ratingsAvgRate == null
                                          ? 0.0
                                          : product.ratingsAvgRate,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        size: 35,
                                        color: Colors.blue,
                                      ),
                                      unratedColor: Colors.blue.withOpacity(0.3),
                                      itemCount: 5,
                                      itemSize: 16.0,
                                      direction: Axis.horizontal,
                                    ),
            ],
          ),
        ),
      ),
    );
  }
}
