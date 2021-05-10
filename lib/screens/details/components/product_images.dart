import 'package:buyer_application/database/sqllite.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
   
   ProductImages({
    Key key,
    @required this.product,
  }) : super(key: key);

  
 final Product product;
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  final String serverUrl = "http://192.168.43.92:8000/storage/product/";
  CartDatabase products;
  Product product; 
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: Image.network(widget.product.image,
                fit: BoxFit.cover,
                ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(serverUrl+product.image),
      ),
    );
  }
}
