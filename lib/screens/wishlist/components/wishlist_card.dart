import 'package:flutter/material.dart';
import 'package:BuyerApplication/models/wishlist_item.dart';
import 'package:BuyerApplication/constants.dart';
import 'package:BuyerApplication/size_config.dart';


// ignore: must_be_immutable
class WishListCard extends StatelessWidget {
  WishListCard({
    Key key,
    this.wishlistitem,
  }) : super(key: key);

   Wishlistitem wishlistitem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(wishlistitem.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              wishlistitem.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${wishlistitem.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                
              ),
            )
          ],
        )
      ],
    );
  }
}
