import 'package:BuyerApplication/components/product_card.dart';
import 'package:BuyerApplication/controllers/ProductProvider.dart';
import 'package:BuyerApplication/controllers/databasehelper.dart';
import 'package:BuyerApplication/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:BuyerApplication/models/Product.dart';
import 'package:BuyerApplication/size_config.dart';
import 'package:BuyerApplication/screens/home/components/section_title.dart';
import 'package:provider/provider.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  HomeProduct homeProduct = HomeProduct();
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
          child: SectionTitle(title: "Popular Products", press: () {
            homeProduct.loadData();
          }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       ...List.generate(
        //         demoProducts.length,
        //         (index) {
        //           if (demoProducts[index].isPopular)
        //             return ProductCard(
        //               product: demoProducts[index],
        //               press: () => Navigator.pushNamed(
        //                 context,
        //                 DetailsScreen.routeName,
        //                 arguments: ProductDetailsArguments(
        //                     product: demoProducts[index]),
        //               ),
        //             );

        //           return SizedBox
        //               .shrink(); // here by default width and height is 0
        //         },
        //       ),
        //       SizedBox(width: getProportionateScreenWidth(20)),
        //     ],
        //   ),
        // )
        // 
        Consumer<HomeProduct>(builder: (context,data,child){
print("Data : ${data.products}");          
          if(Provider.of<HomeProduct>(context).loading)
          return  Center(child: CircularProgressIndicator(),);
          else if(data.error)
          return  Text("ERrror");
          else if(data.products!=null) return ListView.builder(itemBuilder: (context,index){
            return ProductCard(product: data.products[index], press: (){});
          },itemCount: data.products.length,scrollDirection: Axis.horizontal,);
          else return Container();
        },child: Text("Hello"),)
      ],
    );
  }
}
class HomeProduct extends ChangeNotifier{
  bool loading = false;
  List<Product> products;
  bool error = false;
  var helper = DatabaseHelper();
  loadData()async{
    try{
      loading = true;
      notifyListeners();

   var data = await helper.getmyProducts();

   loading = false;
  products = data.map((e) => Product.fromJson(e)).toList();
  notifyListeners();
    }catch(err){
      print(err);
error = true; 
notifyListeners();
    }
  }
}