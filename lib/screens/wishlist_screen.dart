import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/editor/cemmon.dart';
import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/providers/wishlist.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

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

  bool loginName = false;
  Future<bool> getLogin() async {
    setState(() async {
      loginName = await shardPreferencesEditor.getIsLogin();
      print(loginName);
      if (loginName == null) {
     loadingData = false;
      }
        loadingData = false;
    });

  
    return loginName;
  }

  

  Cemmon cemmon = Cemmon();
  initData() async {
    if (dataprovider == null) {
      dataprovider = Provider.of(context);
      dataprovider.loading = true;
      dataprovider.getDataHome();
    }
  }

  @override
  void initState() {
    super.initState();
    // cemmon.getLogin();
    // print(cemmon.loginName);
  }

  @override
  Widget build(BuildContext context) {
    initData();
    getLogin();
    return Scaffold(
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
        body: loginName
            ? isLoginMethoed()
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
               
                height: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Please Login",
                              style:
                                  TextStyle(fontSize: 20, color: KColorecart),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, LoginScreen.id);
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: KColoreblue),
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: KColorecart,
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Go To Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.white,
                                      )),
                                )),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ));
  }

  isLoginMethoed() {
    if (dataprovider.loading) {
      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: SpinKitRing(
            color: KColorecart,
            size: 30,
            duration: Duration(milliseconds: 700),
            lineWidth: 5,
          ),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: dataprovider.wishLists.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: 70,
                                            width: 60,
                                            child:
                                                Provider.of<WishListProviders>(
                                                                context,
                                                                listen: true)
                                                            .wishLists[index]
                                                            .images[0]
                                                            .url ==
                                                        null
                                                    ? Container()
                                                    : CachedNetworkImage(
                                                        imageUrl: Provider.of<
                                                                    WishListProviders>(
                                                                context,
                                                                listen: true)
                                                            .wishLists[index]
                                                            .images[0]
                                                            .url,
                                                        placeholder:
                                                            (context, url) =>
                                                                Icon(
                                                          Icons.photo_sharp,
                                                          color: Colors.black12,
                                                          size: 70,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                          Provider.of<WishListProviders>(
                                                  context,
                                                  listen: true)
                                              .wishLists[index]
                                              .name,
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
                                          Provider.of<WishListProviders>(
                                                          context,
                                                          listen: true)
                                                      .wishLists[index]
                                                      .description !=
                                                  null
                                              ? Provider.of<WishListProviders>(
                                                      context,
                                                      listen: true)
                                                  .wishLists[index]
                                                  .description
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
                                "3.000 KWD",
                                style:
                                    TextStyle(color: KColorecart, fontSize: 12),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.delete_forever_outlined,
                                color: KColoreblue,
                                size: 20,
                              )
                            ],
                          ))
                    ],
                  ),
                  Padding(
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
                  )
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
