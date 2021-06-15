import 'package:buyer_application/components/product_card.dart';
import 'package:buyer_application/controllers/HomeProductProvider.dart';
import 'package:buyer_application/controllers/TopProductsRatingProvider.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/home/components/section_title.dart';
import 'package:provider/provider.dart';

class TopProductsRatings extends StatefulWidget {
  @override
  _TopProductsRatingsState createState() => _TopProductsRatingsState();
}

class _TopProductsRatingsState extends State<TopProductsRatings> {
  TopProductsRatingProvider topProductsRatingProvider = TopProductsRatingProvider();
  @override
  void initState() {
    super.initState();
    topProductsRatingProvider.loadData();
    topProductsRatingProvider.addListener(() {
      print("is loading ${topProductsRatingProvider.loading}");
      print("is error ${topProductsRatingProvider.error}");
      print("is data ${topProductsRatingProvider.products}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "الأكثر تقييما",
              press: () {
                topProductsRatingProvider.loadData();
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        ChangeNotifierProvider<TopProductsRatingProvider>(
          create: (context) => topProductsRatingProvider,
          child: Consumer<TopProductsRatingProvider>(
            builder: (context, data, child) {
              print("Data : ${data.products}");
              if (data.loading)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (data.error)
                return Text("Error");
              else if (data.products != null)
                return Container(
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ProductCard(
                          product: data.products[index], press: () {});
                    },
                    itemCount: data.products.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                );
              else
                return Container();
            },
          ),
        )
      ],
    );
  }
}
