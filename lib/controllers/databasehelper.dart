import 'package:buyer_application/models/AddOrder.dart';
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

  registerData(String email,String password,String confirmPassword,String firstName,String lastName,String phoneNumber,String adress) async {
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
  Future ConfirmOrder(AddOrder model) async {
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
  Future<List<dynamic>> ShowAllProducts() async {
    String myUrl = "$serverUrl/seller_api/showAllProducts/";
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
    });
    print(response.body);
    return jsonDecode(response.body);
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
