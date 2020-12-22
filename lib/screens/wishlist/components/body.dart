import 'package:flutter/material.dart';
import 'package:BuyerApplication/controllers/ProductProvider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/screens/wishlist/components/wishlist_card.dart';
import 'package:provider/provider.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, wishlistbody, child) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Expanded(
              child: ListView.builder(
          itemCount: wishlistbody.wishlist.wishlistitems.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(wishlistbody.wishlist.wishlistitems[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                  wishlistbody.removeFromWishlist(wishlistbody.wishlist.wishlistitems[index]);
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
              child: WishListCard(wishlistitem: wishlistbody.wishlist.wishlistitems[index]),
            ),
          ),
        ),
      ),
    );
    });
  }
}
