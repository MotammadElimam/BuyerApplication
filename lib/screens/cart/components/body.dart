import 'package:BuyerApplication/controller/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
<<<<<<< HEAD
import 'package:BuyerApplication/controllers/ProductProvider.dart';
import 'package:provider/provider.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/screens/cart/components/cart_card.dart';
import 'package:BuyerApplication/models/Cart.dart';
=======
import 'package:provider/provider.dart';
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProductProvider>(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
<<<<<<< HEAD
        itemCount: demoCarts.length,
=======
        itemCount: cart.cartItems.length,
>>>>>>> d492a2ee535a0edbba07bd45d4be6159aec4f634
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(cart.cartItems[index].id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                cart.cartItems.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(products: cart.cartItems),
          ),
        ),
      ),
    );
  }
}
