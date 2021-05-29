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
  final String serverUrl = "https://motamed.eanqod.website";
  IconData _selectedIcon;
  bool _isVertical = false;
  double _rating;
  double _initialRating = 2.0;

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
                  child: Center(child: Text("ليس هناك أي منتجات")));
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
                              direction:
                                  _isVertical ? Axis.vertical : Axis.horizontal,
                              allowHalfRating: true,
                              unratedColor: Colors.amber.withAlpha(50),
                              itemCount: 5,
                              itemSize: 30.0,
                              itemBuilder: (context, _) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              },
                              updateOnDrag: true,
                            )
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


