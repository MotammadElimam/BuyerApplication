import 'package:buyer_application/models/AddOrder.dart';
import 'package:buyer_application/models/BuyerOrders/BuyerOrders.dart';
import 'package:buyer_application/models/ItemsOfOrders/ItemsOfOrders.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  final String serverUrl = "https://motamed.eanqod.website";
  var status;
  var token;

  loginData(String email, String password) async {
    String logininformation = "email=" + "$email" + "&password=" + "$password";

    print(logininformation);
    String myUrl = "$serverUrl/api/login?$logininformation";
    final response = await http.post(
      myUrl,
      headers: {'Accept': 'application/json'},
    );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    print(response.statusCode);
    print(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  registerData(
      String email,
      String password,
      String confirmPassword,
      String firstName,
      String lastName,
      String phoneNumber,
      String adress) async {
    Map information = {
      "email": "$email",
      "password": "$password",
      "confirm_password": "$confirmPassword",
      "first_name": "$firstName",
      "last_name": "$lastName",
      "phone_number": "$phoneNumber",
      "adress": "$adress",
      "is_seller": "seller",
    };
    print(information);
    String myUrl = "$serverUrl/api/register";
    final response = await http.post(myUrl,
        headers: {'Accept': 'application/json'}, body: information);
    status = response.body.contains('error');

    var data = json.decode(response.body);
    print(response.statusCode);
    print(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  // ignore: non_constant_identifier_names
  Future confirmOrder(AddOrder model) async {
    String myUrl = "$serverUrl/api/addOrder";
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    print(jsonEncode(model.toJson()));
    final response = await http.post(
      myUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $value',
      },
      body: jsonEncode(model.toJson()),
    );
    print(response.body);
  }

  Future<List<dynamic>> getSellerProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/seller_api/getallSellerproducts/";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    print(response.body);
    return jsonDecode(response.body);
  }

  // ignore: non_constant_identifier_names
  Future<List<dynamic>> showAllProducts() async {
    String myUrl = "$serverUrl/seller_api/showAllProducts/";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
    });
    print(response.body);
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> topProductsRating() async {
    String myUrl = "$serverUrl/api/TopProductsRating";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
    });
    print(response.body);
    return jsonDecode(response.body);
  }

  Future<List<Order>> showBuyerOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print("motammad");
    String myUrl = "$serverUrl/api/ShowBuyerOrders";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    print("motammad2");
    print("motammad3"+response.body);
    List<Order> buyerOrders = [];

    var jsonData = json.decode(response.body);
    for (var u in jsonData['data']) {
      Order buyerOrder = Order.fromJson(u);

      buyerOrders.add(buyerOrder);
    }

    print(response.body);
    return buyerOrders;
  }



  Future<List<ItemsOfOrders>> showItemsOfOrders(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print("motammad");
    String myUrl = "$serverUrl/api/ShowBuyeritemsOfOrder/?id=$id";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    print("motammad2");
    print("motammad3"+response.body);
    List<ItemsOfOrders> itemsOfOrders = [];

    var jsonData = json.decode(response.body);
    for (var u in jsonData['data']) {
      ItemsOfOrders itemsOfOrder = ItemsOfOrders.fromJson(u);

      itemsOfOrders.add(itemsOfOrder);
    }

    print(response.body);
    return itemsOfOrders;
  }

  rate(String id , double rate,String orderNumber) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
     
       

   Map rating = {
    "rate":rate.toString(),
    "order_id":orderNumber
    };


     String myUrl = "$serverUrl/api/rating/$id";
     

      http.Response response = await http.post(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    },
    body: rating
    
    );
    

    print(response.body);
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }
}
