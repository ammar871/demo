

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/constans.dart';

import 'package:demo/providers/data_providers.dart';
import 'package:demo/providers/home_provider.dart';
import 'package:demo/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';
import '../cart_screen.dart';
import '../wishlist_screen.dart';

class SeeAllProducts extends StatefulWidget {
  static String id = "SeeAllProducts";
String idcategories,name;

  SeeAllProducts({this.idcategories,this.name});

  @override
  _SeeAllProductsState createState() => _SeeAllProductsState(idcategories: idcategories,name: name);
}

class _SeeAllProductsState extends State<SeeAllProducts> {
  final String idcategories,name;
  _SeeAllProductsState({this.idcategories,this.name});

  DataProviders dataprovider;
  HomeProviders homeProviders;
  bool isLoadingProducts = false;
  bool isLoading = false;
  var cartCount;




  // ignore: missing_return
  getCategories() async {
    if (dataprovider == null) {
      dataprovider = Provider.of(context);

      dataprovider.loading = true;
      dataprovider.getProductsCategories(idcategories);
      
      print(idcategories);

    }
  }



  @override
  Widget build(BuildContext context) {
    getCategories() ;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: KColoreblue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 160,
              height: 30,
              // ignore: missing_required_param
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SearchScreenn.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.search,
                          color: KColoreblue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 3,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, WishListScreen.id);
              },
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 25,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushReplacementNamed(context, CartScreen.id);
                });
              },
              child: Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
                size: 25,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        

        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            color: KColoreblue,
            child: Image.asset("images/logo_home.png"),
          ),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(

          decoration: BoxDecoration(
            border: Border.all(color: KColoreblue),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: KColoreblue,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 3, left: 8, right: 12),
            child: Row(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 1, right: 2, top: 1, bottom: 1),
                  child: Text(
                   name ,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 2, right: 2, top: 1, bottom: 1),
                  child: Text(
                      "("+dataprovider.products.length.toString()+")",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
        ],
      ),

          dataprovider.loading? Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: SpinKitRing(
                color: KColorecart,
                size: 30,
                duration: Duration(milliseconds: 700),
                lineWidth: 5,
              ),
            ),
          ) :SingleChildScrollView(
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio:.60,
          crossAxisCount: 3,

        //<--here
        shrinkWrap: true,
          children: List.generate(dataprovider.products.length, (index) {
        return InkWell(
            onTap: (){

            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:  Container(
                            height: 70,
                            width: 70,
                            child: CachedNetworkImage(
                              imageUrl: dataprovider.products
                                  [index].images[0].url,
                              placeholder: (context, url) => Icon(
                                Icons.photo_sharp,
                                color: Colors.black12,
                                size: 70,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(
                                    Icons.photo_sharp,
                                    color: Colors.black12,
                                    size: 70,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                          Provider.of<DataProviders>(
                              context,
                              listen: true)
                              .products[index]
                              .name !=
                              null
                              ?  Provider.of<DataProviders>(
                              context,
                              listen: true)
                              .products[index]
                              .name
                              : "",
                        style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: KColorecart,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            Provider.of<DataProviders>(
                                context,
                                listen: true)
                                .products[index]
                                .oldPrice.formatted,
                            style: TextStyle(
                                color: KColorecart,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: KColorecart,
                            size: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
        },
        ),
        ),
      )]
      )
    );
  }
}
class itemListGride extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(

          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "images/image.png",
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Product Name",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: KColorecart,
                    size: 20,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "3.000 KWD",
                    style: TextStyle(
                        color: KColorecart,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: KColorecart,
                    size: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}