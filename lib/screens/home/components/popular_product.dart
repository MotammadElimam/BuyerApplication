import 'package:buyer_application/components/product_card.dart';
import 'package:buyer_application/controllers/HomeProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:buyer_application/size_config.dart';
import 'package:buyer_application/screens/home/components/section_title.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  HomeProductProvider homeProduct = HomeProductProvider();
  @override
  void initState() {
    super.initState();
    homeProduct.loadData();
    homeProduct.addListener(() {
      print("is loading ${homeProduct.loading}");
      print("is error ${homeProduct.error}");
      print("is data ${homeProduct.products}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "وصل حديثا",
              press: () {
                homeProduct.loadData();
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        ChangeNotifierProvider<HomeProductProvider>(
          create: (context) => homeProduct,
          child: Consumer<HomeProductProvider>(
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
                  height: 500,
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
