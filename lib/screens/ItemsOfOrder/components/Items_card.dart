import 'package:buyer_application/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/Local_database/sqllite.dart';


// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  final String serverUrl = "https://motamed.eanqod.website/storage/product/";
  CartCard({
    Key key,
    this.cartDatabase,
  }) : super(key: key);

   CartDatabase cartDatabase;
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
             child: Image.network(serverUrl+cartDatabase.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartDatabase.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cartDatabase.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${cartDatabase.quantity}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
