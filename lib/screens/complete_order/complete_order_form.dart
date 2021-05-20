import 'package:buyer_application/components/buttons/primary_button.dart';
import 'package:buyer_application/controllers/ProductProvider.dart';
import 'package:buyer_application/controllers/databasehelper.dart';
import 'package:buyer_application/database/sqllite.dart';
import 'package:buyer_application/models/Order.dart';
import 'package:buyer_application/models/Product.dart';
import 'package:buyer_application/theme.dart';
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
  List<CartDatabase> products = [];
  String msgStatus = '';
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final Color inActiveIconColor = Color(0xFFB6B6B6);
  bool selected = true;

  @override
  void initState() {
    super.initState();
    readCart();
  }

  readCart() async {
    DatabaseHelperSqlLite cartdata = new DatabaseHelperSqlLite();
    products = await cartdata.getAllCartProduct();
  }

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
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          Text('Choose your Payment Method'),
          Listtile(),
          SizedBox(height: 200),
          PrimaryButton(
            text: "Confirm Order",
            press: addOrder,
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) =>
          Provider.of<ProductProvider>(context, listen: false).address =
              newValue,
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
        onPressed: () {}),
  ];

  String paymentType = "";

  addOrder() async {
    databaseHelper.ConfirmOrder(
      new AddOrderRequest(
        address: Provider.of<ProductProvider>(context, listen: false).address,
        paymentType: paymentType,
        orderProducts: products
            .map(
              (e) => OrderProducts(
                  productId: e.uid.toString(), quantity: e.quantity),
            )
            .toList(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Listtile() {
    return Container(
      height: 120,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          itemCount: paymentMethod.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                paymentMethod[index],
                style: TextStyle(
                  color: paymentMethod[index] == paymentType
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                ),
              ),
              leading: _icons[index],
              onTap: () {
                paymentType = paymentMethod[index];
                setState(() {});
              },
            );
          }),
    );
  }
}
