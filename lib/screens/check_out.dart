
import 'package:demo/screens/recipet_screen.dart';

import 'package:demo/widgit/textField3.dart';
import 'package:demo/widgit/wedgits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';


class CheckOutScreen extends StatefulWidget {
  static String id = "CheckOutScreen";

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selectedRadio;
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }
  int _listandGrid = 0;
  String _checkboxValue;
  String _checkboxValueCites;
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
        centerTitle: true,
        title: Text(
          "Checkout",
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
                //  Login ======================================================
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: KColorecart),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFyled3(hint: "Name"),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFyled3(hint: "Password"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Don't have an account? Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: KColoreText),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "here.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: KColorecart),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _listandGrid = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                               border: Border.all(color: KColorecart),
                                color: _listandGrid==0? KColorecart:null,
                              ),
                              height: 33,
                              child: Center(
                                child: Text(
                                  "New Address",
                                  style: TextStyle(
                                      color: _listandGrid==0? Colors.white:KColorecart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _listandGrid = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(color: KColorecart)
                               , color: _listandGrid==1? KColorecart:null,
                              ),
                              height: 35,
                              child: Center(
                                child: Text(
                                  "Saved Address",
                                  style: TextStyle(
                                      color: _listandGrid==1? Colors.white:KColorecart,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 8,
                  ),
                  //End Login======================================================
                  //Shopping Address======================================================
                  Container(
                  child: _listandGrid==0?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Shipping Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: KColorecart),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _listandGrid = 0;
                                });
                              },
                              child: Container(
                      width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(color: KColorecart),

                                ),
                                height: 35,

                                child: Center(
                                  child: DropdownButton<String>(
                                    hint: Text("Area",style:TextStyle(color: KColorecart)),
                                    style: TextStyle(color: Colors.red, fontSize: 18),
                                    underline: Container(
                                      height: 0,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    iconDisabledColor: Colors.white,
                                  elevation: 0,

                                    focusNode: null,
                                    icon: Icon(Icons.keyboard_arrow_down,color:KColorecart,),
                                    value: _checkboxValue,
                                    items: <String>['Area', 'Apple', 'Amazon', 'Tesla']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,style: TextStyle(color: KColorecart),),
                                      );
                                    }).toList(),
                                    onChanged: (String value) {
                                      setState(() {
                                        _checkboxValue = value ;
                                      });
                                    },
                                  )

                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _listandGrid = 0;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(color: KColorecart),

                                ),
                                height: 35,

                                child: Center(
                                    child: DropdownButton<String>(
hint: Text("Cites",style:TextStyle(color: KColorecart)),
                                      style: TextStyle(color: Colors.red, fontSize: 18),
                                      underline: Container(
                                        height: 0,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      iconDisabledColor: Colors.white,
                                      elevation: 0,

                                      focusNode: null,
                                      icon: Icon(Icons.keyboard_arrow_down,color:KColorecart,),
                                      value: _checkboxValueCites,
                                      items: <String>['cites', 'Apple', 'Amazon', 'Tesla']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,style: TextStyle(color: KColorecart),),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          _checkboxValueCites = value ;
                                        });
                                      },
                                    )

                                ),
                              ),
                            ),
                          ),
                        ],

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: CustomTextFyled3(hint: "Block"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextFyled3(hint: "Street"),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: CustomTextFyled3(hint: "Avenue"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextFyled3(hint: "House/Apartment No."),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: CustomTextFyled3(hint: "Phone"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextFyled3(hint: "Email"),
                          )
                        ],
                      ),
                    ],
                  )  :

                  Container(
                   child: Column(

                     children: [

                       Container(
                         height: 45,
                         color: KColorecart,

                         child: Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   "Home",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 15),
                                 ),

                                 Radio(

                                   value: 1,
                                   activeColor: Colors.white,
                                   onChanged: (val) {
                                     setSelectedRadio(val);
                                   },
                                   groupValue: selectedRadio,
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                     SizedBox(
                       height: 10,
                     ),
                       Container(
                         height: 45,
                         color: KColorecart,

                         child: Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   "Work",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 15),
                                 ),

                                 Radio(

                                   value: 2,

                                   hoverColor: Colors.white,
                                   focusColor: Colors.white,
                                   activeColor: Colors.white,
                                   onChanged: (val) {
                                     setSelectedRadio(val);
                                   },
                                   groupValue: selectedRadio,
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),],
                   ),
                  ),

                  ),
                  // end Shopping Address =======================================================
                  SizedBox(
                    height: 15,
                  ),
                  //Order Details================================================================
                  Text(
                    "Order Details",
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
                                    MainAxisAlignment.spaceEvenly,
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
                                           width: 100 ,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal:",
                                    style: TextStyle(
                                        color: KColorecart,
                                        fontWeight: FontWeight.w400,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount:    CODE - PROMO",
                                    style: TextStyle(
                                        color: KColorecart,
                                        fontWeight: FontWeight.w400,
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
                            )
                          ],
                        )
                      ],
                    ),
                  )

                  // end Order Details=============================================================
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    //Total

                    //end total

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ReceiptScreen.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: KColorecart,
                        ),
                        height: 40,
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
