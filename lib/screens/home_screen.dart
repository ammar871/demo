import 'package:demo/cemmon/cemmon.dart';
import 'package:demo/cemmon/helper.dart';
import 'package:demo/constans.dart';
import 'package:demo/database/database_helber.dart';

import 'package:demo/editor/shard_prefrance.dart';

import 'package:demo/screens/cart_screen.dart';
import 'package:demo/screens/location_screen.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/screens/my_orders.dart';
import 'package:demo/screens/products_screen.dart';
import 'package:demo/screens/profile_screen.dart';
import 'package:demo/screens/search_screen.dart';
import 'package:demo/screens/spilash_screen.dart';
import 'package:demo/screens/wishlist_screen.dart';
import 'package:demo/cemmon/cemmon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

  int _currentIndex = 0;
  String lange = "";

  getlangNmaed() async {
    String langnameref = await shardPreferencesEditor.getlang();
    print(langnameref);
    if (langnameref == null) {
      final String defaultLocale = Localizations.localeOf(context).toString();
      var parts = defaultLocale.split('_');
      var prefix = parts[0].trim();
      if (prefix == "ar") {
        setState(() {
          lange = "English";
        });
      } else if (prefix == "en") {
        setState(() {
          lange = "Arabic";
        });
      }
      shardPreferencesEditor.setlang(prefix);
      Helper.LANG = prefix;
    } else {
      if (langnameref == "ar") {
        setState(() {
          lange = "English";
        });
      } else if (langnameref == "en") {
        setState(() {
          lange = "Arabic";
        });
      }
    }
  }

  final _tabs = [
    ProductsScreen(),
    LocationScreen(),
    MyOrdersScreen(),
    ProfileScreen()
  ];
  String lang;
  bool loadIsLogin;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      getlangNmaed();
    });
  }

  int selectServic;

  getSelectServic() async {
    selectServic = await shardPreferencesEditor.getSelectService();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    getSelectServic();
    return Scaffold(
      appBar: appBarWedgit(),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        fixedColor: KColorecart,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home)
              // ignore: deprecated_member_use
              ,
              // ignore: deprecated_member_use
              title: Text("product".tr().toString()),
              backgroundColor: KColoreblue),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on)
              // ignore: deprecated_member_use
              ,
              // ignore: deprecated_member_use
              title: Text('location'.tr().toString()),
              backgroundColor: KColoreblue),
          BottomNavigationBarItem(
              icon: Icon(Icons.update)
              // ignore: deprecated_member_use
              ,
              // ignore: deprecated_member_use
              title: Text('myorders'.tr().toString()),
              backgroundColor: KColoreblue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin)
              // ignore: deprecated_member_use
              ,
              // ignore: deprecated_member_use
              title: Text('myprofil'.tr().toString()),
              backgroundColor: KColoreblue)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "images/arbic.png",
                          width: 30,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          if (lange == "Arabic") {
                            setState(() {
                              // ignore: unnecessary_statements, deprecated_member_use
                              context.locale = Locale('ar', 'AR');
                              shardPreferencesEditor.setlang("ar");
                              Helper.LANG = "ar";
                              lange = "English";

                              Navigator.pushNamed(context, SpilashScreen.id);
                            });
                          } else if (lange == "English") {
                            setState(() {
                              // ignore: unnecessary_statements
                              // ignore: deprecated_member_use
                              context.locale = Locale('en', 'US');
                              shardPreferencesEditor.setlang("en");
                              Helper.LANG = "en";
                              lange = "Arabic";

                              Navigator.pushNamed(context, SpilashScreen.id);
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 13),
                          child: Text(
                            lange,
                            style: TextStyle(color: KColoreblue),
                          ),
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 30,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        Cemmon.SELECT_SERVICE = 1;

                        /// shardPreferencesEditor.setSelectService(1);
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color:
                              Cemmon.SELECT_SERVICE == 1 ? KColorecart : null,
                          border: Border.all(color: KColoreblue),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 1, bottom: 1, left: 18, right: 18),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Delivery",
                                  style: TextStyle(
                                      color: Cemmon.SELECT_SERVICE == 1
                                          ? Colors.white
                                          : null,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        )),
                  )),
                  SizedBox(
                    width: 3,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        Cemmon.SELECT_SERVICE = 0;
                        //  shardPreferencesEditor.setSelectService(2);
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color:
                              Cemmon.SELECT_SERVICE == 0 ? KColorecart : null,
                          border: Border.all(color: KColoreblue),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 1, bottom: 1, left: 18, right: 18),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Pick up",
                                  style: TextStyle(
                                      color: Cemmon.SELECT_SERVICE == 0
                                          ? Colors.white
                                          : null,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ))
                ],
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    // ignore: unnecessary_statements
                    _currentIndex = 0;
                  });
                  Navigator.pop(context);
                },
                child: _itemMenue(
                  name: 'home'.tr(),
                  lang: lange,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    // ignore: unnecessary_statements
                    _currentIndex = 1;
                  });
                },
                child: _itemMenue(name: 'location'.tr(), lang: lange),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: _itemMenue(name: 'login'.tr().toString(), lang: lange),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      // ignore: unnecessary_statements
                      _currentIndex = 2;
                    });
                    Navigator.pop(context);
                  },
                  child: _itemMenue(
                      name: "myorders".tr().toString(), lang: lange)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/logo_nav.png",
                    width: 30,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("جميع الحقوق محفوظة لشركة ",
                          style: TextStyle(
                              fontSize: 12,
                              color: KColoreblue,
                              fontWeight: FontWeight.bold)),
                      Text("(اسم الشركة) بدعم من ويب اند ابز ",
                          style: TextStyle(
                              fontSize: 12,
                              color: KColoreblue,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Image.asset(
                    "images/logo_navt.png",
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  appBarWedgit() {
    if (_currentIndex == 0) {
      return AppBar(
        elevation: 0,
        backgroundColor: KColoreblue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SearchScreenn.id);
              },
              child: Container(
                width: 160,
                height: 30,
                // ignore: missing_required_param
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
              onTap: () async {
                bool isLogin = await shardPreferencesEditor.getIsLogin();
                print(isLogin);
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
                  Navigator.pushNamed(context, CartScreen.id);
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
      );
    } else if (_currentIndex == 1) {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: KColorecart,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Location",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
        ),
      );
    } else if (_currentIndex == 2) {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: KColorecart,
          ),
        ),
        centerTitle: true,
        title: Text(
          "My Orders",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
        ),
      );
    } else {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: KColorecart,
          ),
        ),
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
        ),
      );
    }
  }
}

// ignore: camel_case_types
class _itemMenue extends StatefulWidget {
  final String name, lang;

  _itemMenue({this.name, this.lang});

  @override
  __itemMenueState createState() => __itemMenueState();
}

class __itemMenueState extends State<_itemMenue> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            Icon(icondraw())
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 1.2,
          color: KColorelin,
        )
      ],
    );
  }

  IconData icondraw() {
    if (widget.lang == "Arabic") {
      return Icons.keyboard_arrow_right;
    } else if (widget.lang == "English") {
      return Icons.keyboard_arrow_left_outlined;
    }
  }
}
