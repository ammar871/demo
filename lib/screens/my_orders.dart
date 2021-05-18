import 'package:demo/screens/recipet_screen.dart';
import 'package:demo/widgit/wedgits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class MyOrdersScreen extends StatelessWidget {
  static String id = "MyOrdersScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              decoration: WedgiteComponts.containerBorderandunColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: (){

                        Navigator.pushNamed(context, ReceiptScreen.id);
                      },
                      child: itemListOrder("Status"));
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Previous Orders",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: KColorecart),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: WedgiteComponts.containerBorderandunColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return itemListOrder("Order Again");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding itemListOrder(String status) {
    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Order No. 12",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: KColorecart),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 2, left: 5),
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
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: KColorecart),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Products",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: KColorecart),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: Icon(
                                      Icons.close,
                                      color: KColorecart,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Qty",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: KColorecart),
                                      ),
                                      SizedBox(height: 15,),
                                      Container(

                                          decoration: BoxDecoration(
                                              color: KColorecart,
                                              ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 5,
                                                bottom: 5),
                                            child: Text(
                                              "2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 32),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: KColorecart),
                                        ),
                                        SizedBox(height: 15,),
                                        Text(
                                          "3.000 KWD",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: KColorecart),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),

                              Text(
                                "view details",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: KColoredetails),
                              ),

                              Text(
                                "view details Lorem Ipsum",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: KColoreText),
                              ),
                            ],
                          ),


                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8,top: 8),
                        child: Container(
                          height: 1.5,
                          color: KColorecart,
                        ),
                      ),
                      SizedBox(height: 10,)
                     , Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                                  child: Text(status,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                )),
                          ),
                       ],
                     ),
                    ],
                  ),
                );
  }
}
