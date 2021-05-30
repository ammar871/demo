import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/database/database_helber.dart';
import 'package:demo/database/model/CartModel.dart';
import 'package:demo/network/response_products.dart';
import 'package:demo/screens/check_out.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/widgit/wedgits.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money2/money2.dart';
import 'package:sqflite/sqflite.dart';

import '../constans.dart';

class CartScreen extends StatefulWidget {
  static String id = "CartScreen";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  SQL_Helper helper = new SQL_Helper();
  List<CartModel> services;
  double totalformate = 0;
  String total;

  getTotal(List<CartModel> serviceslist) {
    serviceslist.forEach((element) {
      if(element.total!=null){
        totalformate += int.parse(element.total);
      }

    });
    final formatCurrency = new NumberFormat.simpleCurrency(locale: "ar_KWD");
    total = formatCurrency.format(totalformate);
  }

  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();

  String getPriceCurrency(int price, int count) {
    var donPrice = price * count;
    final formatCurrency = new NumberFormat.simpleCurrency(locale: "ar_KWD");

    return formatCurrency.format(donPrice);
  }

  void updateListView() {
    final Future<Database> db = helper.initializedDatabase();
    db.then((database) {
      Future<List<CartModel>> students = helper.getStudentList();
      students.then((theList) {
        setState(() {
          this.services = theList;

          //  if(services.length>0){
          //   print( services[0].nameProduct);
          // for(int i=0;i<services.length;i++){
          //   total=total+services[i].price;
          // }
          // print(total);
          //
          //  }
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    totalformate = 0;
    if (services == null) {
      services = [];
      updateListView();
    }
    getTotal(services);
    return Scaffold(
      key: _globalKeyscafield,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, HomeScreen.id);
          },
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: KColorecart,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ListView(
                children: [
                  Container(
                    decoration: WedgiteComponts.containerBorderandunColor,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: services.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          background: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Colors.red,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (dir) {
                            setState(() {
                              _deleteFromDatabase(services[index].id);
                              services.removeAt(index);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, left: 5),
                                          child: services[index].imageProduct ==
                                                  null
                                              ? Container()
                                              : CachedNetworkImage(
                                                  imageUrl: services[index]
                                                      .imageProduct,
                                                  width: 55,
                                                  height: 45,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Icon(
                                                    Icons.photo_sharp,
                                                    color: Colors.black12,
                                                    size: 55,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(
                                                    Icons.photo_sharp,
                                                    color: Colors.black12,
                                                    size: 55,
                                                  ),
                                                ),
                                        ),



                                        SizedBox(
                                          width: 3,
                                        ),
                                        Container(
                                          width: 95,
                                          child: Text(
                                            services[index].nameProduct == null
                                                ? ""
                                                : services[index].nameProduct,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11,
                                                color: KColorecart),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: KColorecart,
                                      size: 23,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: KColorecart,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              int qunatity = int.parse(
                                                  services[index].qty);
                                              int totalproduct;
                                              if (qunatity > 1) {
                                                setState(() {
                                                  qunatity--;
                                                  totalproduct = int.parse(
                                                          services[index]
                                                              .price) *
                                                      qunatity;
                                                  CartModel cartModel =
                                                      new CartModel.withId(
                                                          services[index].id,
                                                          services[index]
                                                              .orderId,
                                                          qunatity.toString(),
                                                          services[index].price,
                                                          services[index]
                                                              .priceWithCurrency,
                                                          totalproduct
                                                              .toString(),
                                                          services[index]
                                                              .productId,
                                                          services[index]
                                                              .imageProduct,
                                                          services[index]
                                                              .nameProduct,
                                                          services[index]
                                                              .sizeProduct,
                                                          services[index]
                                                              .comment);
                                                  updateDatabase(cartModel);
                                                  updateListView();
                                                });
                                              } else {}
                                            },
                                            child: Container(
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                  ),
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: KColorecart),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 1,
                                                          bottom: 1),
                                                  child: Text(
                                                    services[index].qty,
                                                    style: TextStyle(
                                                        color: KColorecart,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  )),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              int qunatity = int.parse(
                                                  services[index].qty);
                                              int totalproduct;

                                              setState(() {
                                                qunatity++;
                                                totalproduct = int.parse(
                                                        services[index].price) *
                                                    qunatity;
                                                CartModel cartModel =
                                                    new CartModel.withId(
                                                        services[index].id,
                                                        services[index].orderId,
                                                        qunatity.toString(),
                                                        services[index].price,
                                                        services[index]
                                                            .priceWithCurrency,
                                                        totalproduct.toString(),
                                                        services[index]
                                                            .productId,
                                                        services[index]
                                                            .imageProduct,
                                                        services[index]
                                                            .nameProduct,
                                                        services[index]
                                                            .sizeProduct,
                                                        services[index]
                                                            .comment);
                                                updateDatabase(cartModel);
                                                updateListView();
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: KColorecart,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 1,
                                                          bottom: 1),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      getPriceCurrency(
                                              int.parse(services[index].price),
                                              int.parse(services[index].qty))
                                          .toString(),
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 1.5,
                                  color: KColorecart,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total :",
                          style: TextStyle(
                              color: KColorecart,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          total,
                          style: TextStyle(
                              color: KColorecart,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  )
                  //end item
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    //Total

                    //end total

                    InkWell(
                      onTap: () {
                        if(services.isEmpty){
                          Fluttertoast.showToast(
                              msg: "السلة فارغة",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 15.0);
                        }else{
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckOutScreen(services,total),
                              ));

                          Navigator.pushNamed(context, CheckOutScreen.id);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: KColorecart,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateDatabase(CartModel servic) async {
    int result;
    result = await helper.updateStudent(servic);
  }

  void _deleteFromDatabase(int id) async {
    if (id == null) {
      return;
    }

    int result = await helper.deleteStudent(id);
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
          "تم الحــذف من الكارت  ",
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
