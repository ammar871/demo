import 'package:demo/widgit/wedgits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class ReceiptScreen extends StatelessWidget {
  static String id = "ReceiptScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: KColorecart,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),

        child: ListView(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFECECEC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 4, bottom: 4),
                    child: Center(
                      child: Text(
                        "Print",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFECECEC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 4, bottom: 4),
                    child: Center(
                      child: Text(
                        "Download",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Content================================================================
            Container(
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xFF707070))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Invoice No. 1", style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: KColorecart,
                            fontSize: 13)),

                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Order Successful", style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: KColorecart,
                            fontSize: 13)),

                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    viewDetailsCheckOut(context,"Order No.","123456789"),
                    SizedBox(
                      height: 10,
                    ),
                    viewDetailsCheckOut(context,"Address","abc 1, st 1, block 1, Kuwait city, Kuwait"),
                    SizedBox(
                      height: 10,
                    ),
                    viewDetailsCheckOut(context,"Phone","abc 1, st 1, block 1, Kuwait city, Kuwait"),

                    //address end =========================================================================
                    SizedBox(
                      height: 25,
                    ),
                    Text("Summary order", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: KColorecart,
                        fontSize: 13)),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: WedgiteComponts.containerBorderandunColor,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 2,
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
                                                child: Image.asset(
                                                  "images/image.png",
                                                  width: 70,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Container(

                                              child: Text(
                                                "Products",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
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


                                                border: Border.all(color: KColorecart)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 13,right: 13,top: 6,bottom: 6),
                                              child: Text("2",style:TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: KColorecart),
                                              ),
                                            )),

                                        Text(
                                          "3.000 KWD",
                                          style: TextStyle(
                                              color: KColorecart,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: Container(
                                        height: 1.5,
                                        color: KColorecart,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Subtotal: ",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "5.000 KWD",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 5,bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Delivery: ",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "5.000 KWD",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    )
                                  ],
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10,bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 2,
                      decoration: BoxDecoration(
                                        color: KColorecart,
              ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 5,bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Total: ",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "5.000 KWD",
                                      style: TextStyle(
                                          color: KColorecart,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    )
                                  ],
                                ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column viewDetailsCheckOut(BuildContext context,String title,String desc) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: KColorecart,
                          fontSize: 13)),
                      SizedBox(
                        height: 5,
                      )
                      ,Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration:
                        BoxDecoration(border: Border.all(color: KColorecart)),
                        child:Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(desc, style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: KColorecart,
                                fontSize: 13)),
                          ) ,
                        ) ,
                      )
                    ],
                  );
  }
}
