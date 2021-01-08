import 'package:BuyerApplication/components/buttons/primary_button.dart';
import 'package:BuyerApplication/controllers/ProductProvider.dart';
import 'package:BuyerApplication/controllers/databasehelper.dart';
import 'package:BuyerApplication/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:BuyerApplication/components/custom_surfix_icon.dart';
import 'package:BuyerApplication/components/form_error.dart';
import 'package:BuyerApplication/constants.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/screens/otp/otp_screen.dart';
import 'package:provider/provider.dart';



class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  //TextEditingController _firstName = new TextEditingController();
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

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

  _onpress(){
    setState(() {             
              if (_formKey.currentState.validate()) {
               databaseHelper.registerData(
                 Provider.of<ProductProvider>(context, listen: false).email,
                 Provider.of<ProductProvider>(context, listen: false).password,
                 Provider.of<ProductProvider>(context, listen: false).confirmPassword,
                 Provider.of<ProductProvider>(context, listen: false).firstName,
                 Provider.of<ProductProvider>(context, listen: false).lastName,
                 Provider.of<ProductProvider>(context, listen: false).phoneNumber,
                 Provider.of<ProductProvider>(context, listen: false).adress,
                 ).whenComplete((){
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          PrimaryButton(
            text: "continue",
                  press: () {
              _onpress();
            }
          )],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => Provider.of<ProductProvider>(context, listen: false).adress=newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
          Provider.of<ProductProvider>(context, listen: false).adress=value;
        }
        return null;
      },
      //controller: ,
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) =>Provider.of<ProductProvider>(context, listen: false).phoneNumber=newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
          Provider.of<ProductProvider>(context, listen: false).phoneNumber=value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => Provider.of<ProductProvider>(context, listen: false).lastName=newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
           Provider.of<ProductProvider>(context, listen: false).lastName=value;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
    onSaved: (newValue) => Provider.of<ProductProvider>(context, listen: false).firstName=newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
           Provider.of<ProductProvider>(context, listen: false).firstName=value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
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

 