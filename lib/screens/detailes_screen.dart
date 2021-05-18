import 'package:demo/screens/check_out.dart';
import 'package:demo/screens/search_screen.dart';
import 'package:demo/screens/wishlist_screen.dart';
import 'package:demo/widgit/textField2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';
import 'cart_screen.dart';

class DetailsScreen extends StatefulWidget {
  static String id = "DetailsScreen";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool valuefirst = false;
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
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
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                color: KColoreblue,
                child: Image.asset("images/logo_home.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Products",
                          style: TextStyle(
                              color: KColorecart,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 150,
                          child: Text("Lorem ipsum Lorem ifm",
                              style: TextStyle(
                                  color: KColoredesc,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            "3.000 KWD",
                            style: TextStyle(
                                color: KColorecart,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: KColoreblue,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 1, bottom: 1),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 19,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: KColorecart),
                                ),
                                child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 1,
                                          bottom: 1),
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: KColorecart,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: KColoreblue,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 1, bottom: 1),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 19,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  "Select Size",
                  style: TextStyle(
                      color: KColorecart,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: KColoreblue,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //size Product=======================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Small",
                                  style: TextStyle(
                                      color: KColorecart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "(30 ML)",
                                  style: TextStyle(
                                      color: KColoreText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "+5.000 KWD",
                                  style: TextStyle(
                                      color: KColorecart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Radio(
                                  value: 1,
                                  activeColor: KColorecart,
                                  onChanged: (val) {
                                    setSelectedRadio(val);
                                  },
                                  groupValue: selectedRadio,
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 1.5,
                          color: KColorecart,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Medium",
                                  style: TextStyle(
                                      color: KColorecart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "(30 ML)",
                                  style: TextStyle(
                                      color: KColoreText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "+5.000 KWD",
                                  style: TextStyle(
                                      color: KColorecart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Radio(
                                  value: 2,
                                  activeColor: KColorecart,
                                  onChanged: (val) {
                                    setSelectedRadio(val);
                                  },
                                  groupValue: selectedRadio,
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 1.5,
                          color: KColorecart,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Large",
                                  style: TextStyle(
                                      color: KColorecart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "(30 ML)",
                                  style: TextStyle(
                                      color: KColoreText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "+5.000 KWD",
                                  style: TextStyle(
                                      color: KColorecart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Radio(
                                  value: 3,
                                  activeColor: KColorecart,
                                  onChanged: (val) {
                                    setSelectedRadio(val);
                                  },
                                  groupValue: selectedRadio,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
//end Sizes
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
              //comment
              ,
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add Instructions",
                      style: TextStyle(
                          color: KColorecart,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "(optional)",
                      style: TextStyle(
                          color: KColoreText,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFyled2(
                  onClick: (value) {},
                  hint: "passord",
                ),
              )
              //button Buy
              ,
              SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CheckOutScreen.id);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: KColorecart,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
