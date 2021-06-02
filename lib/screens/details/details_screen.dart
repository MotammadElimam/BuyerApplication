import 'package:buyer_application/models/Product.dart';
import 'package:buyer_application/screens/details/components/body.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  Product product;
  
  static String routeName = "/details_page";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(product: agrs.product),
    );
  }
}

class ProductDetailsArguments extends ChangeNotifier{
  final Product product;

  ProductDetailsArguments({@required this.product});
}
