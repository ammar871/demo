import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/constans.dart';
import 'package:demo/database/database_helber.dart';
import 'package:demo/database/model/CartModel.dart';
import 'package:demo/database/model/FavoraiteModel.dart';

import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/network/catogries.dart';

import 'package:demo/providers/data_providers.dart';
import 'package:demo/providers/home_provider.dart';
import 'package:demo/screens/detailes_screen.dart';
import 'package:demo/screens/products_screen/products_SeeAll.dart';
import 'package:demo/widgit/wedgits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String pagGride, name;
  bool isLogin = false;
  bool isFave = false;

  String getSizeData(int indexone, BuildContext context) {
    int size = Provider.of<HomeProviders>(context, listen: true)
        .categories[indexone]
        .arr
        .length;
    return size.toString();
  }

  final ShardPreferencesEditor shardPreferencesEditor =
      ShardPreferencesEditor();

  SQL_Helper helper = new SQL_Helper();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();
  bool isLoadingProducts = false;
  bool isLoading = false;
  var cartCount;
  List<Datum> services = [];
  Future<ResponsCategories> responsCategories;
  int _selectedIndex = 0;
  String page;
  int _listandGrid = 0;


  getIsLogin() async {
    isLogin = await shardPreferencesEditor.getIsLogin();
  }

  getCategories(String page) async {
    // ignore: unnecessary_statements
    services = [];
    ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

    setState(() {
      isLoading = true;
    });

    var uri = Uri.parse("https://demo.wna.net.kw/api/select/categories");

    final response = await http.get(uri, headers: {
      'Accept-Language': await shardPreferencesEditor.getlang(),
      'Accept-Country': 'kw',
      'Accept': 'application/json',
      'Authorization': 'Bearer $shardPreferencesEditor.getAuthToken()'
    });

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      if (services.isEmpty) {
        cartCount = json.decode(response.body);

        cartCount["data"].forEach((element) {
          services.add(Datum.fromJson(element));
        });

        return ResponsCategories.fromJson(cartCount);
      }
    } else {
      setState(() {
        isLoading = false;
      });
      return null;
    }
  }

  ////////////////////////////////////////////////////////////////////////catogeryies

  @override
  initState() {
    //  getProductsCategories("5");
    super.initState();
    getIsLogin();
  }

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  int _currentIndex = 0;
  DataProviders dataprovider;
  HomeProviders homeProviders;

  initData() async {
    if (dataprovider == null) {
      dataprovider = Provider.of(context);

      await getCategories("1");
      dataprovider.loading = true;
      dataprovider.getProductsCategories(services[0].id.toString());
      if (homeProviders == null) {
        homeProviders = Provider.of<HomeProviders>(context, listen: false);
        homeProviders.loading = true;
        homeProviders.getDataHome();
        //_buildList(homeProviders.categories[0]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    initData();

    return Scaffold(
      key: _globalKeyscafield,
      body: Column(
        children: [
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            color: KColoreblue,
            child: Image.asset("images/logo_home.png"),
          ),
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 4, right: 4),
                child: Container(
                  height: 30,
                  child: ListView.builder(
                    itemCount: services.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _onSelected(index);
                          page = services[index].id.toString();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => SeeAllProducts(
                                        idcategories: page,
                                        name: services[index].text.toString(),
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: KColoreblue),
                              borderRadius: BorderRadius.circular(15.0),

                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 1, bottom: 1, left: 18, right: 18),
                                child: Text(
                                  services[index].text,
                                  style: TextStyle(
                                      color: KColoreblue,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.format_list_bulleted_rounded,
                        color: _listandGrid == 0 ? KColoreblue : KColoreText,
                      ),
                      onTap: () {
                        setState(() {
                          _listandGrid = 0;
                          _currentIndex = 0;
                        });
                      },
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.widgets_outlined,
                        color: _listandGrid == 1 ? KColoreblue : KColoreText,
                      ),
                      onTap: () {
                        setState(() {
                          _listandGrid = 1;
                          _currentIndex = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              buildListView(context, _currentIndex, page)
            ],
          )),
        ],
      ),
    );
  }

  bool isExpand = false;

  // ignore: missing_return
  Widget buildListView(BuildContext context, int currentidex, String page) {
    if (currentidex == 0) {
      return dataprovider.loading
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
          : Column(
              children: [
                ListView.builder(
                    itemCount: Provider.of<HomeProviders>(context, listen: true)
                        .categories
                        .length,
                    //<--here
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, DetailsScreen.id);
                            },
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  accentColor: Colors.white,
                                  unselectedWidgetColor: Colors.white
                                    ..withOpacity(0.8)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                child: ExpansionTile(
                                  tilePadding:
                                      EdgeInsets.only(left: 8, right: 8),
                                  title: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      Provider.of<HomeProviders>(context,
                                                  listen: true)
                                              .categories[index]
                                              .title +
                                          "  (" +
                                          Provider.of<HomeProviders>(context,
                                                  listen: true)
                                              .categories[index]
                                              .arr
                                              .length
                                              .toString() +
                                          ")",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  backgroundColor: KColoreblue,
                                  collapsedBackgroundColor: KColoreblue,
                                  children: [
                                    ListView.builder(
                                      
                                        itemCount: Provider.of<HomeProviders>(
                                                context,
                                                listen: true)
                                            .categories[index]
                                            .arr
                                            .length,
                                        physics: NeverScrollableScrollPhysics(),
                                        //<--here
                                        shrinkWrap: true,
                                        itemBuilder: (context, index2) {
                                          return InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, DetailsScreen.id);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Container(
                                                  color: Colors.white,
                                                  height: 90,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom: 5,
                                                                      left: 5),
                                                              child: Container(
                                                                width: 60,
                                                                height: 60,
                                                                child: Provider.of<HomeProviders>(context,
                                                                                listen: true)
                                                                            .categories[index]
                                                                            .arr[index2]
                                                                            .images[0]
                                                                            .url ==
                                                                        null
                                                                    ? Container()
                                                                    : CachedNetworkImage(
                                                                        imageUrl: Provider.of<HomeProviders>(context,
                                                                                listen: true)
                                                                            .categories[index]
                                                                            .arr[index2]
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
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5,
                                                                      top: 3),
                                                              child: Container(
                                                                height: 80,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          120,
                                                                      child:
                                                                          Text(
                                                                        Provider.of<HomeProviders>(context, listen: true).categories[index].arr[index2].name !=
                                                                                null
                                                                            ? Provider.of<HomeProviders>(context, listen: true).categories[index].arr[index2].name
                                                                            : "",
                                                                        style: TextStyle(
                                                                            color:
                                                                                KColorecart,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize: 13),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          150,
                                                                      child: Text(
                                                                          Provider.of<HomeProviders>(context, listen: true).categories[index].arr[index2].description != null
                                                                              ? Provider.of<HomeProviders>(context, listen: true).categories[index].arr[index2].description
                                                                              : "",
                                                                          style: TextStyle(color: KColoredesc, fontWeight: FontWeight.w300, fontSize: 12),
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
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15),
                                                                    child: Text(
                                                                      Provider.of<HomeProviders>(
                                                                              context,
                                                                              listen:
                                                                                  true)
                                                                          .categories[
                                                                              index]
                                                                          .arr[
                                                                              index2]
                                                                          .oldPrice
                                                                          .formatted,
                                                                      style: TextStyle(
                                                                          color:
                                                                              KColorecart,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            25,
                                                                        child: FutureBuilder<bool>(
                                                                            future:
                                                                                isFav(Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString()),
                                                                            initialData: false,
                                                                            // you can define an initial value while the db returns the real value
                                                                            builder: (context, snapshot) {
                                                                              print(snapshot.data);
                                                                              if (snapshot.hasError)
                                                                                return const Icon(Icons.error, color: KColorecart); //just in case the db return an error
                                                                              return IconButton(
                                                                                  icon: snapshot.data ? Icon(Icons.favorite, color: KColorecart) : Icon(Icons.favorite_border, color: KColorecart),
                                                                                  onPressed: () => setState(() {
                                                                                        if (isLogin != null) {
                                                                                          if (snapshot.data) {
                                                                                            setState(() {
                                                                                              _deleteItemFave(Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString());
                                                                                            });
                                                                                          } else {
                                                                                            FavoraiteModel favM = new FavoraiteModel(Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.price.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.formatted.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].images[0].url.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].name.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].description.toString());
                                                                                            setState(() {
                                                                                              _saveFave(favM);
                                                                                            });
                                                                                          }
                                                                                        } else {
                                                                                          setState(() {
                                                                                            showAlertDialog(context);
                                                                                          });
                                                                                        }
                                                                                      }));
                                                                            }),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              8),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          CartModel cartmodel = new CartModel(
                                                                              Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString(),
                                                                              "1",
                                                                              Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.price.toString(),
                                                                              Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.formatted.toString(),
                                                                              Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.price.toString(),
                                                                              Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString(),
                                                                              Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].images[0].url.toString(),
                                                                              Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].name.toString(),
                                                                              1,
                                                                              "thankes");
                                                                          setState(
                                                                              () {
                                                                            _save(cartmodel);
                                                                          });
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              23,
                                                                          width:
                                                                              90,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(color: KColoreblue),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                            color:
                                                                                KColorecart,
                                                                          ),
                                                                          child: Center(
                                                                              child: Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 2,
                                                                                right: 2,
                                                                                top: 2,
                                                                                bottom: 2),
                                                                            child:
                                                                                Text("Add to cart", style: TextStyle(color: Colors.white, fontSize: 12)),
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ));
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    }),
              ],
            );
    } else if (currentidex == 1)
      return homeProviders.loading
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
          : ListView.builder(
              scrollDirection: Axis.vertical,
              //<--her

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: Provider.of<HomeProviders>(context, listen: true)
                  .categories
                  .length,
              itemBuilder: (context, index) {
                return Provider.of<HomeProviders>(context, listen: true)
                            .categories[index]
                            .arr
                            .length >
                        0
                    ? Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
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
                                              left: 1,
                                              right: 2,
                                              top: 1,
                                              bottom: 1),
                                          child: Text(
                                            Provider.of<HomeProviders>(context,
                                                    listen: true)
                                                .categories[index]
                                                .title,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 2,
                                              right: 2,
                                              top: 1,
                                              bottom: 1),
                                          child: Text(
                                            "(" +
                                                getSizeData(index, context) +
                                                ")",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3, bottom: 3, left: 8, right: 8),
                                  child: InkWell(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            page = Provider.of<HomeProviders>(
                                                    context,
                                                    listen: false)
                                                .categories[index]
                                                .id
                                                .toString();

                                            name = Provider.of<HomeProviders>(
                                                    context,
                                                    listen: false)
                                                .categories[index]
                                                .title
                                                .toString();
                                            print(page + name);
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        SeeAllProducts(
                                                          idcategories: Provider.of<
                                                                      HomeProviders>(
                                                                  context,
                                                                  listen: false)
                                                              .categories[index]
                                                              .id
                                                              .toString(),
                                                          name: name,
                                                        )));
                                          },
                                          child: Text(
                                            "See All",
                                            style: TextStyle(
                                                color: KColorecart,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_outlined,
                                          size: 18,
                                          color: KColorecart,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  //<--her

                                  shrinkWrap: true,
                                  itemCount: Provider.of<HomeProviders>(context,
                                          listen: true)
                                      .categories[index]
                                      .arr
                                      .length,
                                  itemBuilder: (context, index2) {
                                    return InkWell(
                                        onTap: () {
                                          // Navigator.pushNamed(context, DetailsScreen.id);
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(1),
                                            child: Container(
                                              height: 190,
                                              width: 130,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: CachedNetworkImage(
                                                      height: 130,
                                                      width: 120,
                                                      imageUrl: Provider.of<
                                                                  HomeProviders>(
                                                              context,
                                                              listen: true)
                                                          .categories[index]
                                                          .arr[index2]
                                                          .images[0]
                                                          .url,
                                                      placeholder: (context,
                                                              url) =>
                                                          Icon(
                                                              Icons.photo_sharp,
                                                              color: Colors
                                                                  .black12,
                                                              size: 130),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(
                                                        Icons.photo_sharp,
                                                        color: Colors.black12,
                                                        size: 130,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        Provider.of<HomeProviders>(
                                                                        context,
                                                                        listen:
                                                                            true)
                                                                    .categories[
                                                                        index]
                                                                    .arr[index2]
                                                                    .name !=
                                                                null
                                                            ? Provider
                                                                    .of<HomeProviders>(
                                                                        context,
                                                                        listen:
                                                                            true)
                                                                .categories[
                                                                    index]
                                                                .arr[index2]
                                                                .name
                                                            : "",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            width:
                                                            25,
                                                            child: FutureBuilder<bool>(
                                                                future:
                                                                isFav(Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString()),
                                                                initialData: false,
                                                                // you can define an initial value while the db returns the real value
                                                                builder: (context, snapshot) {
                                                                  print(snapshot.data);
                                                                  if (snapshot.hasError)
                                                                    return const Icon(Icons.error, color: KColorecart); //just in case the db return an error
                                                                  return IconButton(
                                                                      icon: snapshot.data ? Icon(Icons.favorite, color: KColorecart) : Icon(Icons.favorite_border, color: KColorecart),
                                                                      onPressed: () => setState(() {
                                                                        if (isLogin != null) {
                                                                          if (snapshot.data) {
                                                                            setState(() {
                                                                              _deleteItemFave(Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString());
                                                                            });
                                                                          } else {
                                                                            FavoraiteModel favM = new FavoraiteModel(Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.price.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.formatted.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].images[0].url.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].name.toString(), Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].description.toString());
                                                                            setState(() {
                                                                              _saveFave(favM);
                                                                            });
                                                                          }
                                                                        } else {
                                                                          setState(() {
                                                                            showAlertDialog(context);
                                                                          });
                                                                        }
                                                                      }));
                                                                }),
                                                          ),
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          Center(
                                                            child: Container(
                                                              child: Text(
                                                                Provider.of<HomeProviders>(context, listen: true)
                                                                            .categories[
                                                                                index]
                                                                            .arr[
                                                                                index2]
                                                                            .oldPrice
                                                                            .formatted !=
                                                                        null
                                                                    ? Provider.of<HomeProviders>(
                                                                            context,
                                                                            listen:
                                                                                true)
                                                                        .categories[
                                                                            index]
                                                                        .arr[
                                                                            index2]
                                                                        .oldPrice
                                                                        .formatted
                                                                    : "",
                                                                style: TextStyle(
                                                                    color:
                                                                        KColorecart,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              CartModel cartmodel = new CartModel(
                                                                  Provider.of<HomeProviders>(context, listen: false)
                                                                      .categories[
                                                                          index]
                                                                      .arr[
                                                                          index2]
                                                                      .id
                                                                      .toString(),
                                                                  "1",
                                                                  Provider.of<HomeProviders>(context, listen: false)
                                                                      .categories[
                                                                          index]
                                                                      .arr[
                                                                          index2]
                                                                      .oldPrice
                                                                      .price
                                                                      .toString(),
                                                                  Provider.of<HomeProviders>(context, listen: false)
                                                                      .categories[
                                                                          index]
                                                                      .arr[
                                                                          index2]
                                                                      .oldPrice
                                                                      .formatted
                                                                      .toString(),
                                                                  Provider.of<HomeProviders>(context, listen: false)
                                                                      .categories[
                                                                          index]
                                                                      .arr[
                                                                          index2]
                                                                      .oldPrice
                                                                      .price
                                                                      .toString(),
                                                                  Provider.of<HomeProviders>(context,
                                                                          listen:
                                                                              false)
                                                                      .categories[
                                                                          index]
                                                                      .arr[
                                                                          index2]
                                                                      .id
                                                                      .toString(),
                                                                  Provider.of<HomeProviders>(context,
                                                                          listen: false)
                                                                      .categories[index]
                                                                      .arr[index2]
                                                                      .images[0]
                                                                      .url
                                                                      .toString(),
                                                                  Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].name.toString(),
                                                                  1,
                                                                  "thankes");
                                                              setState(() {
                                                                _save(
                                                                    cartmodel);
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .shopping_bag_outlined,
                                                              color:
                                                                  KColorecart,
                                                              size: 20,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container();
              },
            );

    // Create button
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
                child: Text("?????????? ????????????",
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
          Text("???? ???????? ?????? ???????????? ",
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
          "???????? ?????? ????  ",
        ),
        duration: Duration(seconds: 2),
      ));
    } else {
      // ignore: deprecated_member_use
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "?????? ?????????????? ???????????? ",
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
          "???????? ?????? ????  ",
        ),
        duration: Duration(seconds: 2),
      ));
    } else {
      // ignore: deprecated_member_use
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "?????? ?????????????? ?????????????? ",
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
          "???????? ?????? ????  ",
        ),
        duration: Duration(seconds: 2),
      ));
      // showAlertDialog('Ok Delete', "No student was deleted");
    } else {
      _globalKeyscafield.currentState.showSnackBar(SnackBar(
        content: Text(
          "???? ?????????????? ???? ?????????????? ",
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }
}

// print(Provider.of<HomeProviders>(context, listen: false)
// .categories[index]
// .arr[index2]
// .name
//     .toString());
// CartModel cartmodel = new CartModel(
//     Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString(),
//     "1",
//     Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.price.toString(),
//     Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.formatted.toString(),
//     Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].oldPrice.price.toString(),
//     Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].id.toString(),
//     Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].images[0].url.toString(),
//     Provider.of<HomeProviders>(context, listen: false).categories[index].arr[index2].name.toString(),
//     1,
//     "thankes");
// setState(
// () {
// _save(cartmodel);
// });
