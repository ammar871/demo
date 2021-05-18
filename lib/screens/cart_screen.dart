import 'dart:convert';
import 'dart:typed_data';

import 'package:demo/database/database_helber.dart';
import 'package:demo/database/model/CartModel.dart';
import 'package:demo/network/response_products.dart';
import 'package:demo/screens/check_out.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/widgit/wedgits.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String total;

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
    if (services == null) {
      services = [];
      updateListView();
    }

    return Scaffold(
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
              padding: const EdgeInsets.only(bottom: 80),
              child: ListView(
                children: [
                  Container(
                    decoration: WedgiteComponts.containerBorderandunColor,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: services.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5, left: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: services[index].imageProduct ==
                                                  null
                                              ? Icon(Icons.photo_sharp,
                                                  color: Colors.black12,
                                                  size: 60)
                                              : Image.network(
                                                  services[index].imageProduct,
                                                  width: 60,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        width: 100,
                                        child: Text(
                                          services[index].nameProduct == null
                                              ? ""
                                              : services[index].nameProduct,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: KColorecart),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: KColorecart,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: KColorecart,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 1,
                                                    bottom: 1),
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
                                            border:
                                                Border.all(color: KColorecart),
                                          ),
                                          child: Center(
                                            child: Padding(
                                                padding: const EdgeInsets.only(
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
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: KColorecart,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
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
                                        int.parse(services[index].qty)).toString(),
                                    style: TextStyle(
                                        color: KColorecart,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              Container(
                                height: 1.5,
                                color: KColorecart,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
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
                            "5.000 KWD",
                            style: TextStyle(
                                color: KColorecart,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                    )
                    //end total
                    ,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CheckOutScreen.id);
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
}
