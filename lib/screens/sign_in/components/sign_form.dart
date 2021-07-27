import 'package:buyer_application/components/buttons/primary_button.dart';
import 'package:buyer_application/controllers/databasehelper.dart';
import 'package:buyer_application/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/components/custom_surfix_icon.dart';
import 'package:buyer_application/components/form_error.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/screens/forgot_password/forgot_password_screen.dart';
import 'package:buyer_application/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('فشل'),
            content:  new Text('الرجاء التأكد من البريد الالكتروني او الرقم السري'),
            actions: <Widget>[
              // ignore: deprecated_member_use
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


read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    if(value != '0'){
     Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }

@override
initState(){
  super.initState();
  read();
}

 _onpress(){
    setState(() {             
              if (_formKey.currentState.validate()) {
               databaseHelper.loginData(email , password).whenComplete((){
                if(databaseHelper.status){
                _showDialog();
                msgStatus = 'Check email or password';
                }else{
                Navigator.pushNamed(context, HomeScreen.routeName);
                   }
        });
      }
       });
  }




  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
   // ignore: unused_field
   bool _autoValidate = false;
   
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height:getProportionateScreenHeight(30)
          ),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("تذكرني"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "نسيت الرقم السري؟",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
                    PrimaryButton(
            text: "تسجيل الدخول",
            press: () {
              if (_formKey.currentState.validate()) {
                // If all data are correct then save data to out variables
                _formKey.currentState.save();
                _onpress();
              //Navigator.pushNamed(context, HomeScreen.routeName);
              } else {
                // If all data are not valid then start auto validation.
                setState(() {
                  _autoValidate = true;
                });
              }
            },
          )
         /* DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),*/
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
           password = value;
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "الرقم السري",
        hintText: "ادخل الرقم السري الخاص بك",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
          email = value;
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "البريد الالكتروني",
        hintText: "ادخل البريد الالكتروني الخاص بك",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}



