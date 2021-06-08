import 'package:flutter/material.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/Local_database/sqllite.dart';
import 'package:buyer_application/components/rounded_button.dart';
import 'package:buyer_application/Local_database/sqllite.dart';
// ignore: must_be_immutable
class CartCard extends StatefulWidget {
  CartCard({
    Key key,
    this.cartDatabase,
  }) : super(key: key);

  CartDatabase cartDatabase;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final String serverUrl = "https://motamed.eanqod.website/storage/product/";
  var numOfItems = 1;


void _addTocart() async {

    var dbhelper = new DatabaseHelperSqlLite();
    DatabaseHelperSqlLite cartdata = new DatabaseHelperSqlLite();
    var oldProducts = await cartdata.getAllCartProduct();
    if (oldProducts
        .any((oldProduct) => oldProduct.uid == widget.cartDatabase.uid.toString())) {
      dbhelper.deleteProduct(int.parse(widget.cartDatabase.uid));
      
    }
    widget.cartDatabase.uid = widget.cartDatabase.uid.toString();
    widget.cartDatabase.name = widget.cartDatabase.name;
    widget.cartDatabase.price = widget.cartDatabase.price.toString();
    widget.cartDatabase.des = widget.cartDatabase.des;
    widget.cartDatabase.quantity = numOfItems.toString();
    widget.cartDatabase.image = widget.cartDatabase.image;

    await dbhelper
        .insertProduct(widget.cartDatabase);
        //.whenComplete(() => setState);
  }

initState(){
  setState(() {

      numOfItems = int.parse(widget.cartDatabase.quantity);
    });
  
}


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
              child: Image.network(serverUrl + widget.cartDatabase.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cartDatabase.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${widget.cartDatabase.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  // TextSpan(
                  //     text: " x${widget.cartDatabase.quantity}",
                  //     style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        ),
        Expanded(
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // increment button
              RoundedButton(
                press: () {
                  setState(() {  numOfItems++;
                    _addTocart();
                  
                  });
                },
                iconData: Icons.add,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text(numOfItems.toString().padLeft(2, "0"),
                    style: kSubHeadTextStyle),
              ),
              // decrement buuton
              RoundedButton(
                press: () {
                  if (numOfItems > 1)
                    setState(() {
                      numOfItems--;
                      _addTocart();
                    });
                },
                iconData: Icons.remove,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
