/*import 'package:BuyerApplication/screens/sign_in/components/sign_form.dart';
import 'package:flutter/material.dart';
import 'package:BuyerApplication/Controllers/databasehelper.dart';


class SignUp_Api extends StatefulWidget{

  SignUp_Api({Key key , this.title}) : super(key : key);
  final String title;

  @override
  SignUp_ApiState  createState() => SignUp_ApiState();ip
}

class SignUp_ApiState extends State<SignUp_Api> {

  

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _first_name_Controller = new TextEditingController(); 
 /* final TextEditingController _confirm_password = new TextEditingController();
  final TextEditingController _last_name_Controller = new TextEditingController();
  final TextEditingController _phone_number_Controller = new TextEditingController();
  final TextEditingController _adress_Controller = new TextEditingController();*/

  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
         _passwordController.text.trim().isNotEmpty/* &&
        (_confirm_password.text.trim().isNotEmpty  == _passwordController.text) &&
         _first_name_Controller.text.trim().toLowerCase().isNotEmpty &&
         _last_name_Controller.text.trim().isNotEmpty*/){
        databaseHelper.registerData(_first_name_Controller.text.trim(),_emailController.text.trim().toLowerCase(),

            _passwordController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password';
          }else{
            Navigator.pushReplacementNamed(context, '/HomeScreen');


          }
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    SignForm();
  }



  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(

                child: new Text(
                  'Close',
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );
  }



}

*/













