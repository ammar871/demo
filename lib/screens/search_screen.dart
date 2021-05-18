import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constans.dart';

class SearchScreenn extends StatefulWidget {
  static String id = "SearchScreenn";

  @override
  _SearchScreennState createState() => _SearchScreennState();
}

class _SearchScreennState extends State<SearchScreenn> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: KColorecart,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 25,
                width: 190,
                child: Center(
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: KColorecart),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: KColorecart,
                        size: 20,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
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
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return itemListLiner();
              },
            ),
          ],
//listView
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class itemListLiner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "images/image.png",
                        width: 80,
                        height: 70,
                        fit: BoxFit.cover,
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
                            "Products",
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
                            child: Text("Lorem ipsum Lorem ifm",
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
                            "3.000 KWD",
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
                         
                            Container(
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
  }
}
