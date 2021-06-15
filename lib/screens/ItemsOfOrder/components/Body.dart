import 'package:buyer_application/components/buttons/primary_button.dart';
import 'package:buyer_application/constants.dart';
import 'package:buyer_application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/controllers/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Body extends StatefulWidget {
  Body({Key key, this.title, @required this.orderNumber}) : super(key: key);

  final String title;
  String orderNumber;

  @override
  _BodyState createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  final String serverUrl = "https://motamed.eanqod.website/storage/product/";
  IconData _selectedIcon;
  bool _isVertical = false;
  double _rating;
  double _initialRating = 2.0;

  var status;

  void _showRatingSuccessDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('نجاح'),
            content: new Text("شكرا لتفييمك"),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new RaisedButton(
                child: new Text(
                  'اغلاق',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _showRatingfaildDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('فشل'),
            content: new Text("عفوا لايمكنك تقييم المنتج أكثر من مرة"),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new RaisedButton(
                child: new Text(
                  'اغلاق',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: databaseHelper.showItemsOfOrders(widget.orderNumber),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print("hiiiiiiiiiiii" + snapshot.data.toString());
            if (snapshot.data == null) {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.data.length == 0) {
              return Container(child: Center(child: Text("ليس هناك أي طلبات")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 88,
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(10)),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(snapshot.data[index].image),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data[index].name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              maxLines: 2,
                            ),
                            SizedBox(height: 10),
                            Text.rich(
                              TextSpan(
                                text: "\$${snapshot.data[index].price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            RatingBar.builder(
                              initialRating: _initialRating,
                              minRating: 1,
                              maxRating: 5,
                              direction:
                                  _isVertical ? Axis.vertical : Axis.horizontal,
                              allowHalfRating: true,
                              unratedColor: Colors.blue.withAlpha(50),
                              itemCount: 5,
                              itemSize: 30.0,
                              itemBuilder: (context, _) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.blue,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              },
                              updateOnDrag: true,
                            ),
                            PrimaryButton(
                                text: "قيم المنتج",
                                press: () {
                                  databaseHelper
                                      .rate(snapshot.data[index].id, _rating,
                                          widget.orderNumber)
                                      .whenComplete(() {
                                    if (databaseHelper.status) {
                                      _showRatingSuccessDialog();
                                    } else {
                                      _showRatingfaildDialog();
                                    }
                                  });
                                })
                          ],
                        ),
                      )
                    ],
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


