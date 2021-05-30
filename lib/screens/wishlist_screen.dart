import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/database/database_helber.dart';
import 'package:demo/database/model/CartModel.dart';
import 'package:demo/database/model/FavoraiteModel.dart';
import 'package:demo/editor/cemmon.dart';
import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/providers/wishlist.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../constans.dart';

class WishListScreen extends StatefulWidget {
  static String id = "WishListScreen";

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  WishListProviders dataprovider;
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
  bool loadingData = true;
  SQL_Helper helper = new SQL_Helper();
  List<FavoraiteModel> services;
  bool loginName = false;
  final _controller = ScrollController();
  getLogin() async {
    loginName = await shardPreferencesEditor.getIsLogin();
    print(loginName);
  }

  Cemmon cemmon = Cemmon();

  initData() async {
    if (dataprovider == null) {
      dataprovider = Provider.of(context);
      dataprovider.loading = true;
      dataprovider.getDataHome();
    }
  }

  void updateListView() {
    final Future<Database> db = helper.initializedDatabase();
    db.then((database) {
      Future<List<FavoraiteModel>> students = helper.getStudentListfav();
      students.then((theList) {
        setState(() {
          this.services = theList;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();

    // print(cemmon.loginName);
  }

  @override
  Widget build(BuildContext context) {
    getLogin();
    //  initData();
    if (services == null) {
      services = [];
      updateListView();
    }
    return Scaffold(
        key: _globalKeyscafield,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.keyboard_arrow_left_outlined,
              color: KColorecart,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Wishlist",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
          ),
        ),
        body: FutureBuilder(
          future: shardPreferencesEditor.getIsLogin(),

          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: snapshot.data == true
                    ? isLoginMethoed()
                    :Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please login to continue",
                            style: TextStyle(fontSize: 18, color: KColorecart),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: KColoreblue),
                                borderRadius: BorderRadius.circular(4.0),
                                color: KColorecart,
                              ),
                              child: Center(
                                  child: Text("Go To Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.white,
                                      ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Please login to continue",
                          style: TextStyle(fontSize: 18, color: KColorecart),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: KColoreblue),
                              borderRadius: BorderRadius.circular(4.0),
                              color: KColorecart,
                            ),
                            child: Center(
                                child: Text("Go To Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }

  isLoginMethoed() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,

        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          return  services.isEmpty ?
          Center(
            child: Text("Your wishList is Empty",
              style: TextStyle(fontSize: 20,color: KColoreblue,fontWeight: FontWeight.bold),),
          ):Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: KColorecart)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, left: 1),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          height: 70,
                                          width: 60,
                                          child: services[index].imageProduct ==
                                              null
                                              ? Container()
                                              : CachedNetworkImage(
                                            imageUrl: services[index]
                                                .imageProduct,
                                            placeholder: (context, url) =>
                                                Icon(
                                                  Icons.photo_sharp,
                                                  color: Colors.black12,
                                                  size: 70,
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                Icon(
                                                  Icons.photo_sharp,
                                                  color: Colors.black12,
                                                  size: 70,
                                                ),
                                          ),
                                        ))),
                                SizedBox(
                                  width: 3,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        services[index].nameProduct,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: KColorecart),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      child: Text(
                                        services[index].descProduct != null
                                            ? services[index].descProduct
                                            : "",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: KColoreText),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              services[index].priceWithCurrency,
                              style:
                              TextStyle(color: KColorecart, fontSize: 12),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _deletiitem(services[index].productId);
                                });
                                ;
                              },
                              child: Icon(
                                Icons.delete_forever_outlined,
                                color: KColoreblue,
                                size: 20,
                              ),
                            )
                          ],
                        ))
                  ],
                ),
                InkWell(
                  onTap: () {
                    CartModel cartmodel = new CartModel(
                        services[index].id.toString(),
                        "1",
                        services[index].price.toString(),
                        services[index].priceWithCurrency.toString(),
                        services[index].price.toString(),
                        services[index].productId.toString(),
                        services[index].imageProduct.toString(),
                        services[index].nameProduct.toString(),
                        1,
                        "thankes");
                    setState(() {
                      _save(cartmodel);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, top: 5),
                    child: Container(
                      height: 23,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: KColoreblue),
                        borderRadius: BorderRadius.circular(4.0),
                        color: KColorecart,
                      ),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 2, right: 2, top: 2, bottom: 2),
                            child: Text("Add to cart",
                                style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                          )),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();

  void _deletiitem(String productId) async {
    if (productId == null) {
      return;
    }

    int result = await helper.deleteStudentfav(productId);
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
      updateListView();
    }
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
}
