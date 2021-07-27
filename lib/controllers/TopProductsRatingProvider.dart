import 'package:flutter/material.dart';
import 'package:buyer_application/controllers/databasehelper.dart';
import 'package:buyer_application/models/Product.dart';



class TopProductsRatingProvider extends ChangeNotifier {
  bool loading = false;
  List<Product> products;
  bool error = false;
  var producthelper = DatabaseHelper();
  
  
  loadData() async {
    try {
      loading = true;
      notifyListeners();

      var data = await producthelper.topProductsRating();

      loading = false;
      products = data.map((e) => Product.fromMap(e)).toList();
      notifyListeners();
    } catch (err) {
      print(err);
      error = true;
      notifyListeners();
    }
  }
}
