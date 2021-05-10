import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/cart/components/cart_card.dart';
import 'package:buyer_application/database/sqllite.dart';


// ignore: must_be_immutable
class Body extends StatefulWidget {
  List <CartDatabase> products;
  Body({Key key, this.products})
      : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
   

 @override  
 
  Widget build(BuildContext context) {
   
    //return Consumer<ProductProvider>(builder: (context, cartbody, child) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(widget.products[index].id.toString()),
            direction: DismissDirection.endToStart,
            // onDismissed: (direction) {
            //     cartbody.removeFromCart(products[index]);
            // },
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
            child: CartCard(cartDatabase: widget.products[index]),
          ),
        ),
      ),
    );
  }
}



// products == null ? Container(
//               child:Text("There is no products in cart"))
//             ):
