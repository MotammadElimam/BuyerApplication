import 'package:buyer_application/controllers/databasehelper.dart';
import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(product: agrs.product),
    );
  }
}

class ProductDetailsArguments extends ChangeNotifier{
  final Product product;

   bool loading = false;
  List<Product> products;
  bool error = false;
  var deatilshelper = DatabaseHelper();
  loadData() async {
    try {
      loading = true;
      notifyListeners();

     // var data = await deatilshelper.getmyProducts();

      loading = false;
    //  products = data.map((e) => Product.fromJson(e)).toList();
      notifyListeners();
    } catch (err) {
      print(err);
      error = true;
      notifyListeners();
    }
  }

  ProductDetailsArguments({@required this.product});
}
