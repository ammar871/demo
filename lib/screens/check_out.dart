import 'package:demo/providers/all_address_providers.dart';
import 'package:demo/screens/recipet_screen.dart';
import 'package:demo/widgit/deowp/custom_dropdawn.dart';
import 'package:demo/widgit/deowp/model_drop.dart';
import 'package:demo/widgit/textField2.dart';

import 'package:demo/widgit/textField3.dart';
import 'package:demo/widgit/wedgits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../constans.dart';

class CheckOutScreen extends StatefulWidget {
  static String id = "CheckOutScreen";

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selectedRadio;
  final List<DropTwo> _favouriteFoodModelList = [
    DropTwo(foodName: 'DropTwo'),
    DropTwo(foodName: 'DropTwo Yogurt'),
    DropTwo(foodName: 'DropTwo Milk'),
  ];
  DropTwo _DropTwo = DropTwo();
  List<DropdownMenuItem<DropTwo>> _DropTwoModelDropdownList;

  List<DropdownMenuItem<DropTwo>> _buildDropTwoModelDropdown(
      List _dropTwoModelList) {
    // ignore: deprecated_member_use
    List<DropdownMenuItem<DropTwo>> items = List();
    for (DropTwo favouriteFoodModel in _favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(favouriteFoodModel.foodName),
      ));
    }
    return items;
  }

  _onChangeFavouriteFoodModelDropdown(DropTwo favouriteFoodModel) {
    setState(() {
      _DropTwo = favouriteFoodModel;

      print(_DropTwo.foodName);
    });
  }
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  int value;
  AllAddressProviders _addressProviders;

  initData() async {
    if (_addressProviders == null) {
      _addressProviders = Provider.of(context);
      _addressProviders.loading = true;
      _addressProviders.getDataProfile();
    }
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    _DropTwoModelDropdownList =
        _buildDropTwoModelDropdown(_favouriteFoodModelList);
    _DropTwo = _favouriteFoodModelList[0];
  }

  int _listandGrid = 0;
  String _checkboxValue;
  String _checkboxValueCites;
  String _name, _email, _mobil, _streat, _avenue, _house, _block;
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();
  @override
  Widget build(BuildContext context) {
    initData();

    return Scaffold(
      key: _globalKeyscafield,
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
                    'login'.tr().toString(),
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
                                color: _listandGrid == 0 ? KColorecart : null,
                              ),
                              height: 33,
                              child: Center(
                                child: Text(
                                  "New Address",
                                  style: TextStyle(
                                      color: _listandGrid == 0
                                          ? Colors.white
                                          : KColorecart,
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
                                border: Border.all(color: KColorecart),
                                color: _listandGrid == 1 ? KColorecart : null,
                              ),
                              height: 35,
                              child: Center(
                                child: Text(
                                  "Saved Address",
                                  style: TextStyle(
                                      color: _listandGrid == 1
                                          ? Colors.white
                                          : KColorecart,
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
                    child: _listandGrid == 0
                        ?   Form(
                      key: _globalKey,
                      child: Column(
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
                          CustomTextFyled2(
                            hint: "Address Name",
                            onClick: (value) {
                              _name = value;
                              print(_name);
                            },
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
                                  child: Center(
                                      child: CustomDropdown2(
                                        dropdownMenuItemList:
                                        _DropTwoModelDropdownList,
                                        onChanged: _onChangeFavouriteFoodModelDropdown,
                                        value: _DropTwo,
                                        isEnabled: true,
                                      )),
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
                                  child:CustomDropdown2(
                                    dropdownMenuItemList:
                                    _DropTwoModelDropdownList,
                                    onChanged: _onChangeFavouriteFoodModelDropdown,
                                    value: _DropTwo,
                                    isEnabled: true,
                                  )),
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
                                child: CustomTextFyled2(
                                    onClick: (value) {
                                      _block = value;
                                      print(_block);
                                    },
                                    hint: "Block"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomTextFyled2(
                                    onClick: (value) {
                                      _streat = value;
                                      print(_streat);
                                    },
                                    hint: "Street"),
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
                                child: CustomTextFyled2(
                                    onClick: (value) {
                                      _avenue = value;
                                      print(_avenue);
                                    },
                                    hint: "Avenue"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomTextFyled2(
                                    onClick: (value) {
                                      _house = value;
                                      print(_house);
                                    },
                                    hint: "House/Apartment No."),
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
                                child: CustomTextFyled2(
                                    onClick: (value) {
                                      _mobil = value;
                                      print(_mobil);
                                    },
                                    hint: "Phone"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomTextFyled2(
                                    onClick: (value) {
                                      _email = value;
                                      print(_email);
                                    },
                                    hint: "Email"),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                        : Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Center(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _addressProviders.loading
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 100),
                                                child: Center(
                                                  child: SpinKitRing(
                                                    color: KColorecart,
                                                    size: 30,
                                                    duration: Duration(
                                                        milliseconds: 700),
                                                    lineWidth: 5,
                                                  ),
                                                ),
                                              )
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: _addressProviders
                                                    .myAddressList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 2, bottom: 2),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        color: KColorecart,
                                                      ),
                                                      child: RadioListTile<int>(
                                                          title: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                  _addressProviders
                                                                      .myAddressList[
                                                                          index]
                                                                      .name
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ],
                                                          ),
                                                          activeColor:
                                                              Colors.white,
                                                          toggleable: true,
                                                          value:
                                                              _addressProviders
                                                                  .myAddressList[
                                                                      index]
                                                                  .id,
                                                          groupValue: value,
                                                          onChanged: (ind) {
                                                            setState(() {
                                                              value = ind;
                                                              print(value);
                                                            });
                                                          }),
                                                    ),
                                                  );
                                                },
                                              )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            width: 100,
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
                                              border: Border.all(
                                                  color: KColorecart)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13,
                                                right: 13,
                                                top: 6,
                                                bottom: 6),
                                            child: Text(
                                              "2",
                                              style: TextStyle(
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
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
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        if (_listandGrid ==1) {
                          _addressProviders.myAddressList.forEach((element) {
                            if (element.id == value) {
                              print(element.name + element.id.toString());
                            }
                          });
                        }else if(_listandGrid ==0){

                          if (_globalKey.currentState.validate()) {
                            _globalKey.currentState.save();
                          print(_name+ "aaa"+ "aaaaa"+ _email+
                                _mobil+ _streat+ _avenue+ _house+ _block);


                          } else {
                            _globalKeyscafield.currentState.showSnackBar(SnackBar(
                              content: Text(
                                "please  fill Details",
                              ),
                              duration: Duration(seconds: 2),
                            ));
                          }
                        }

                        // Navigator.pushNamed(context, ReceiptScreen.id);
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
