import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/database/database_helber.dart';
import 'package:demo/database/model/CartModel.dart';
import 'package:demo/pojo/data/response_data_search.dart';
import 'package:demo/providers/searsh_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constans.dart';

class SearchScreenn extends StatefulWidget {
  static String id = "SearchScreenn";

  @override
  _SearchScreennState createState() => _SearchScreennState();
}

class _SearchScreennState extends State<SearchScreenn> {
  TextEditingController controller = new TextEditingController();
  List<DataSearch> listData = [];
  SQL_Helper helper = new SQL_Helper();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();
  SearchProviders dataprovider;

  initData() async {
    if (dataprovider == null) {
       dataprovider = Provider.of(context);

      dataprovider.loading = true;
      dataprovider.getDataSearch(controller.text.toLowerCase());
      listData = dataprovider.listSearchResult;
    }
  }

  onSearchTextChanged(String text) async {
    listData.clear();
    dataprovider.loading=true;
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    listData = dataprovider.getDataSearch(text.toLowerCase());
    setState(() {});
    print(listData.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    initData();
    return Container(
      child: Scaffold(
        key: _globalKeyscafield,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left_outlined,
              color: KColorecart,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 35,
                width: 250,
                child: Center(
                  child: TextField(
                    onChanged: onSearchTextChanged,
                    controller: controller,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: KColorecart),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      hintText: "search",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: KColorecart),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: KColoreblue, width: 1.4),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: KColoreblue, width: 1.4),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                      color: KColorecart,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(

                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5, left: 5),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  child: listData[index]
                                      .images[0]
                                      .url ==
                                      null
                                      ? Container()
                                      : CachedNetworkImage(
                                    imageUrl: listData[index]
                                        .images[0]
                                        .url,
                                    placeholder:
                                        (context, url) =>
                                        Icon(
                                          Icons
                                              .photo_sharp,
                                          color:
                                          Colors.black12,
                                          size:
                                          70,
                                        ),
                                    errorWidget: (context,
                                        url,
                                        error) =>
                                        Icon(
                                          Icons
                                              .photo_sharp,
                                          color:
                                          Colors.black12,
                                          size:
                                          70,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 3),
                                child: Container(
                                  height: 80,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        listData[index].name,
                                        style: TextStyle(
                                            color: KColorecart,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        width: 150,
                                        child: Text( listData[index].description!=null? listData[index].description:null,
                                            style: TextStyle(
                                                color: KColoredesc,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        listData[index].price.formatted.toString() ,
                                        style: TextStyle(
                                            color: KColorecart,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            CartModel cartmodel = new CartModel(
                                                listData[index].id.toString(),
                                                "1",
                                                listData[index].oldPrice.price.toString(),
                                                listData[index].oldPrice.formatted.toString(),
                                                listData[index].oldPrice.price.toString(),
                                                listData[index].id.toString(),
                                                listData[index].images[0].url.toString(),
                                                listData[index].name.toString(),
                                                1,
                                                "thankes");
                                            setState(
                                                    () {
                                                  _save(cartmodel);
                                                });


                                          },
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
                                                      style: TextStyle(
                                                          color: Colors.white, fontSize: 12)),
                                                )),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: double.infinity * .6,
                            height: 1.5,
                            color: KColoreblue,
                          )
                        ],
                      ),
                    ),
                  ),

                );
              },
            ),
          ],
//listView
        ),
      ),
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
}

