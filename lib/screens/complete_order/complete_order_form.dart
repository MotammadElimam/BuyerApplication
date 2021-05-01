import 'package:buyer_application/components/buttons/primary_button.dart';
import 'package:buyer_application/controllers/ProductProvider.dart';
import 'package:buyer_application/controllers/databasehelper.dart';
import 'package:buyer_application/enums.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/components/custom_surfix_icon.dart';
import 'package:buyer_application/components/form_error.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CompleteOrderForm extends StatefulWidget {
 // final Payment paymentselected;
 

  const CompleteOrderForm({Key key}) : super(key: key);

  @override
  _CompleteOrderFormState createState() => _CompleteOrderFormState();
}

class _CompleteOrderFormState extends State<CompleteOrderForm> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
 TextEditingController address = new TextEditingController();
  String msgStatus = '';
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final Color inActiveIconColor = Color(0xFFB6B6B6);
  bool selected = true;
  // String address;

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
                 Provider.of<ProductProvider>(context, listen: false).address,
                 );
        //          .whenComplete((){
        //         if(databaseHelper.status){
        //         _showDialog();
        //         msgStatus = 'Check email or password';
        //         }else{
        //         Navigator.pushNamed(context, HomeScreen.routeName);
        //            }
        // });
      }
       });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          Text('Choose your Payment Method'),
          Listtile(),
          SizedBox(height: 200),
          
          // PrimaryButton(
          //     text: "Confirm Order",
          //     press: () {
          //       // _onpress();
          //     })
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) =>
          Provider.of<ProductProvider>(context, listen: false).address =
              newValue,
         controller: address,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
          Provider.of<ProductProvider>(context, listen: false).address = value;
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

  List<String> paymentMethod = ['Cash', 'Discount from wallet'];
  List<IconButton> _icons = [
    IconButton(
        icon: SvgPicture.asset(
          "assets/icons/money.svg",
        ),
        onPressed: () {}),
         IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/wallet.svg",
                ),
                onPressed: () {}
              ),
  ];

  // ignore: non_constant_identifier_names
  Widget Listtile() {
    return ListView.builder(
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemCount: paymentMethod.length,
  itemBuilder: (BuildContext context, int index) {
    return  Container(
      child: Column(
        children: [
          ListTile(
            title: Text(paymentMethod[index]),
           leading: _icons[index],
           onTap: _onpress(),
           
           // () async{databaseHelper.ConfirmOrder(address.text.toString(), paymentMethod[index]);} ,
          )
        ],
      ),
    );
  }
);
  }
}
