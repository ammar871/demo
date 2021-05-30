import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/constans.dart';
import 'package:demo/database/database_helber.dart';
import 'package:demo/database/model/CartModel.dart';
import 'package:demo/database/model/FavoraiteModel.dart';
import 'package:demo/editor/shard_prefrance.dart';

import 'package:demo/providers/data_providers.dart';
import 'package:demo/providers/home_provider.dart';
import 'package:demo/screens/search_screen.dart';
import 'package:demo/widgit/wedgits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';
import '../cart_screen.dart';
import '../wishlist_screen.dart';

class SeeAllProducts extends StatefulWidget {
  static String id = "SeeAllProducts";
  String idcategories, name;

  SeeAllProducts({this.idcategories, this.name});

  @override
  _SeeAllProductsState createState() =>
      _SeeAllProductsState(idcategories: idcategories, name: name);
}

class _SeeAllProductsState extends State<SeeAllProducts> {
  final String idcategories, name;

  _SeeAllProductsState({this.idcategories, this.name});

  SQL_Helper helper = new SQL_Helper();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();
  DataProviders dataprovider;
  HomeProviders homeProviders;
  bool isLoadingProducts = false;
  bool isLoading = false;
  var cartCount;
  final ShardPreferencesEditor shardPreferencesEditor =
      ShardPreferencesEditor();

  bool isLogin = false;
  bool isFave = false;

  getIsLogin() async {
    isLogin = await shardPreferencesEditor.getIsLogin();
  }

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
  initState() {
    //  getProductsCategories("5");
    super.initState();
    getIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    getCategories();
    // TODO: implement build
    return Scaffold(
      key: _globalKeyscafield,
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
        body: ListView(children: [
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
                    padding: const EdgeInsets.only(
                        top: 3, bottom: 3, left: 8, right: 12),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 1, right: 2, top: 1, bottom: 1),
                          child: Text(
                            name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 2, right: 2, top: 1, bottom: 1),
                          child: Text(
                            "(" + dataprovider.products.length.toString() + ")",
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
          dataprovider.loading
              ? Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: SpinKitRing(
                      color: KColorecart,
                      size: 30,
                      duration: Duration(milliseconds: 700),
                      lineWidth: 5,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: .60,
                    crossAxisCount: 3,

                    //<--here
                    shrinkWrap: true,
                    children: List.generate(
                      dataprovider.products.length,
                      (index) {
                        return InkWell(
                            onTap: () {},
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5, left: 1),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            child: CachedNetworkImage(
                                              imageUrl: dataprovider
                                                  .products[index]
                                                  .images[0]
                                                  .url,
                                              placeholder: (context, url) =>
                                                  Icon(
                                                Icons.photo_sharp,
                                                color: Colors.black12,
                                                size: 70,
                                              ),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                Icons.photo_sharp,
                                                color: Colors.black12,
                                                size: 70,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        Provider.of<DataProviders>(context,
                                                        listen: true)
                                                    .products[index]
                                                    .name !=
                                                null
                                            ? Provider.of<DataProviders>(
                                                    context,
                                                    listen: true)
                                                .products[index]
                                                .name
                                            : "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                            child: Container(
                                              width: 25,
                                              child: FutureBuilder<bool>(
                                                  future: isFav(
                                                      Provider.of<DataProviders>(
                                                              context,
                                                              listen: true)
                                                          .products[index]
                                                          .id
                                                          .toString()),
                                                  initialData: false,
                                                  // you can define an initial value while the db returns the real value
                                                  builder: (context, snapshot) {
                                                    print(snapshot.data);
                                                    if (snapshot.hasError)
                                                      return const Icon(
                                                          Icons.error,
                                                          color:
                                                              KColorecart); //just in case the db return an error
                                                    return IconButton(
                                                        icon: snapshot.data
                                                            ? Icon(Icons.favorite,
                                                                color:
                                                                    KColorecart)
                                                            : Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color:
                                                                    KColorecart),
                                                        onPressed:
                                                            () => setState(() {
                                                                  if (isLogin !=
                                                                      null) {
                                                                    if (snapshot
                                                                        .data) {
                                                                      setState(
                                                                          () {
                                                                        _deleteItemFave(Provider.of<DataProviders>(
                                                                                context,
                                                                                listen:
                                                                                    false)
                                                                            .products[
                                                                                index]
                                                                            .id
                                                                            .toString());
                                                                      });
                                                                    } else {
                                                                      FavoraiteModel favM = new FavoraiteModel(
                                                                          Provider.of<DataProviders>(context, listen: false)
                                                                              .products[
                                                                                  index]
                                                                              .oldPrice
                                                                              .price
                                                                              .toString(),
                                                                          Provider.of<DataProviders>(context, listen: false)
                                                                              .products[
                                                                                  index]
                                                                              .oldPrice
                                                                              .formatted
                                                                              .toString(),
                                                                          Provider.of<DataProviders>(context, listen: false)
                                                                              .products[
                                                                                  index]
                                                                              .id
                                                                              .toString(),
                                                                          Provider.of<DataProviders>(context, listen: false)
                                                                              .products[
                                                                                  index]
                                                                              .images[
                                                                                  0]
                                                                              .url
                                                                              .toString(),
                                                                          Provider.of<DataProviders>(context, listen: false)
                                                                              .products[
                                                                                  index]
                                                                              .name
                                                                              .toString(),
                                                                          Provider.of<DataProviders>(context,
                                                                                  listen: false)
                                                                              .products[index]
                                                                              .description
                                                                              .toString());
                                                                      setState(
                                                                          () {
                                                                        _saveFave(
                                                                            favM);
                                                                      });
                                                                    }
                                                                  } else {
                                                                    setState(() {
                                                                      showAlertDialog(
                                                                          context);
                                                                    });
                                                                  }
                                                                }));
                                                  }),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            Provider.of<DataProviders>(context,
                                                    listen: true)
                                                .products[index]
                                                .oldPrice
                                                .formatted,
                                            style: TextStyle(
                                                color: KColorecart,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          InkWell(
                                            onTap:
                                                () {
                                              CartModel cartmodel = new CartModel(
                                                  Provider.of<DataProviders>(context, listen: false)
                                                      .products[
                                                  index]
                                                      .id
                                                      .toString(),
                                                  "1",
                                                  Provider.of<DataProviders>(context, listen: false)
                                                      .products[
                                                  index]
                                                      .oldPrice
                                                      .price
                                                      .toString(),
                                                  Provider.of<DataProviders>(context, listen: false)
                                                      .products[
                                                  index]
                                                      .oldPrice
                                                      .formatted
                                                      .toString(),
                                                  Provider.of<DataProviders>(context, listen: false)
                                                      .products[
                                                  index]
                                                      .oldPrice
                                                      .price
                                                      .toString(),
                                                  Provider.of<DataProviders>(context, listen: false)
                                                      .products[
                                                  index]
                                                      .id
                                                      .toString(),
                                                  Provider.of<DataProviders>(context, listen: false)
                                                      .products[
                                                  index]
                                                      .images[
                                                  0]
                                                      .url
                                                      .toString(),
                                                  Provider.of<DataProviders>(context, listen: false)
                                                      .products[
                                                  index]
                                                      .name
                                                      .toString(),
                                                  1,
                                                  "thankes");



                                              setState(
                                                      () {
                                                    _save(cartmodel);
                                                  });
                                            },



                                            child: Icon(
                                              Icons.shopping_bag_outlined,
                                              color: KColorecart,
                                              size: 20,
                                            ),
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
                )
        ]));
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Container(
          width: double.infinity,
          decoration: WedgiteComponts.containerBorderandColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 6, right: 6, top: 8, bottom: 8),
            child: Center(
                child: Text("تسجيل الدخول",
                    style: TextStyle(color: Colors.white, fontSize: 14))),
          )),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("من فضلك سجل الدخول ",
              style: TextStyle(
                  color: KColorecart,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _save(CartModel cartModel) async {
    int result;

    result = await helper.insertStudent(cartModel);

    if (result == 0) {
      // ignore: deprecated_member_use
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "هناك خطأ ما  ",
        ),
        duration: Duration(seconds: 2),
      ));
    } else {
      // ignore: deprecated_member_use
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "تمت الاضافة للكارت ",
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }

  void _saveFave(FavoraiteModel cartModel) async {
    int result;

    result = await helper.insertStudentfav(cartModel);

    if (result == 0) {
      // ignore: deprecated_member_use
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "هناك خطأ ما  ",
        ),
        duration: Duration(seconds: 2),
      ));
    } else {
      // ignore: deprecated_member_use
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "تمت الاضافة للمفضلة ",
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }

  Icon buildIcon() {
    if (isFave) {
      return Icon(Icons.favorite, color: KColorecart);
    } else {
      return Icon(Icons.favorite_border, color: KColorecart);
    }
  }

  Future<bool> isFav(String id) async {
    final rowsPresent = await helper.queryForFav(id);
    if (rowsPresent > 0) {
      return true;
    } else {
      return false;
    }
  }

  void _deleteItemFave(String id) async {
    if (id == null) {
      return;
    }

    int result = await helper.deleteStudentfav(id);
    if (result == 0) {
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "هناك خطأ ما  ",
        ),
        duration: Duration(seconds: 2),
      ));
      // showAlertDialog('Ok Delete', "No student was deleted");
    } else {
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "تم الحــذف من المفضلة ",
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
