import 'package:buyer_application/Local_database/WishlistDatabase.dart';
import 'package:buyer_application/Local_database/sqllite.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/size_config.dart';


// ignore: must_be_immutable
class WishListCard extends StatelessWidget {
   final String serverUrl = "https://motamed.eanqod.website/storage/product/";
  WishListCard({
    Key key,
      this.wishlistDatabase,
  }) : super(key: key);

   WishlistDatabase wishlistDatabase;

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
              child: Image.network(serverUrl+wishlistDatabase.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              wishlistDatabase.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${wishlistDatabase.price}"+" SDG",
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
