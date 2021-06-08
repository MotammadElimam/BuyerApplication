import 'package:buyer_application/Local_database/WishlistDatabase.dart';
import 'package:buyer_application/screens/wishlist/components/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/cart/components/cart_card.dart';


// ignore: must_be_immutable
class Body extends StatefulWidget {
  List <WishlistDatabase> products;
  Body({Key key, this.products})
      : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
   WishlistDatabase product = new WishlistDatabase();
    var dbhelper = new DatabaseSqlLite();
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
             onDismissed: (direction) {
                 dbhelper.deleteProduct(int.parse(widget.products[index].uid));
                 
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
            child: WishListCard(wishlistDatabase: widget.products[index]),
          ),
        ),
      ),
    );
  }
}



// products == null ? Container(
//               child:Text("There is no products in cart"))
//             ):
