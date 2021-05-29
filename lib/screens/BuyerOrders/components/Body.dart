import 'package:buyer_application/models/ItemsOfOrders/ItemsOfOrders.dart';
import 'package:buyer_application/screens/ItemsOfOrder/Items_of_Order_Screen.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/controllers/databasehelper.dart';



class Body extends StatefulWidget {
  Body({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> {
DatabaseHelper databaseHelper = new DatabaseHelper();
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          child: FutureBuilder(
            future: databaseHelper.showBuyerOrders(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print("hiiiiiiiiiiii"+snapshot.data.toString());
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text("ليس هناك أي طلبات")
                  )
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Order Number"+ snapshot.data[index].orderNumber),
                      onTap: (){

                        Navigator.push(context, 
                          new MaterialPageRoute(builder: (context) => ItemsofOrderScreen(orderNumber:snapshot.data[index].orderNumber))
                       );

                      },
                    );
                  },
                );
              }
            },
          ),
        ),
      );
  }
}

// class DetailPage extends StatelessWidget {

//   final User user;

//   DetailPage(this.user);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(user.name),
//         )
//     );
//   }
// }


