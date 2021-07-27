import 'package:buyer_application/models/User.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/controllers/databasehelper.dart';
import 'package:buyer_application/models/Product.dart';



class UserProvider extends ChangeNotifier {
  bool loading = false;
  User user;
  bool error = false;
  var userhelper = DatabaseHelper();
  
  
  loadData() async {
    try {
      loading = true;
      notifyListeners();

      var data = await userhelper.showUserByID(1);

      loading = false;
      user =  data ;
      //data.map((e) => User.fromMap(e)).toList();
      notifyListeners();
    } catch (err) {
      print(err);
      error = true;
      notifyListeners();
    }
  }
}
