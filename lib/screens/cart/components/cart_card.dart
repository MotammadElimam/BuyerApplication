import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:BuyerApplication/constants.dart';
import 'package:BuyerApplication/models/Product.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/models/Cart.dart';

=======

import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634

class CartCard extends StatefulWidget {
   CartCard({
    Key key,
<<<<<<< HEAD
   @required this.cart,
=======
    @required this.products,
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634
  }) : super(key: key);

  final List<Product> products;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
<<<<<<< HEAD
        itemCount: products.length,
        itemBuilder: (context, index) => Row(
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
              child: Image.asset(products[index].images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              products[index].title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${products[index].price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${products[index].price}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    )
=======
      itemCount: products.length,
      itemBuilder: (context, index) => Row(
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
                child: Image.asset(products[index].images[0]),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                products[index].title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${products[index].price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${products[index].price}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              )
            ],
          )
        ],
      ),
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634
    );
  }
}


