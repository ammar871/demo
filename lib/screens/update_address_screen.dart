import 'package:custom_dropdown/custom_dropdown.dart';
import 'package:demo/pojo/data/myAddress_model.dart';
import 'package:demo/providers/add_new_address.dart';
import 'package:demo/providers/update_address.dart';
import 'package:demo/screens/profile_screen.dart';
import 'package:demo/screens/saved_address.dart';
import 'package:demo/widgit/deowp/custom_dropdawn.dart';
import 'package:demo/widgit/deowp/model_drop.dart';
import 'package:demo/widgit/textField2.dart';
import 'package:demo/widgit/textField3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constans.dart';

class UpdateAddressAddress extends StatefulWidget {
  static String id = "AddNewAddress";
  DatatMyAddress myAddressS;

  UpdateAddressAddress({@required this.myAddressS});

  @override
  _UpdateAddressAddress createState() =>
      _UpdateAddressAddress(myAddress: myAddressS);
}

class _UpdateAddressAddress extends State<UpdateAddressAddress> {
  final DatatMyAddress myAddress;

  final List<FavouriteFoodModel> _favouriteFoodModelList = [
    FavouriteFoodModel(foodName: 'Pudding'),
    FavouriteFoodModel(foodName: 'Frozen Yogurt'),
    FavouriteFoodModel(foodName: 'Chocolate Milk'),
  ];

  FavouriteFoodModel _favouriteFoodModel = FavouriteFoodModel();
  List<DropdownMenuItem<FavouriteFoodModel>> _favouriteFoodModelDropdownList;

  List<DropdownMenuItem<FavouriteFoodModel>> _buildFavouriteFoodModelDropdown(
      List favouriteFoodModelList) {
    // ignore: deprecated_member_use
    List<DropdownMenuItem<FavouriteFoodModel>> items = List();
    for (FavouriteFoodModel favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(favouriteFoodModel.foodName),
      ));
    }
    return items;
  }

  _onChangeFavouriteFoodModelDropdown(FavouriteFoodModel favouriteFoodModel) {
    setState(() {
      _favouriteFoodModel = favouriteFoodModel;
      print(_favouriteFoodModel.foodName);
    });
  }

  _UpdateAddressAddress({@required this.myAddress});

  UpdateAddressProviders profileProviders;

  initData() async {
    if (profileProviders == null) {
      profileProviders = Provider.of(context);
    }
  }

  @override
  void initState() {
    print(myAddress.name);
    _favouriteFoodModelDropdownList =
        _buildFavouriteFoodModelDropdown(_favouriteFoodModelList);
    _favouriteFoodModel = _favouriteFoodModelList[0];

    getContrlorText();
    super.initState();
  }

  int _listandGrid = 0;
  String _name, _email, _mobil, _streat, _avenue, _house, _block;
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();

  TextEditingController _controllername = new TextEditingController();
  TextEditingController _controllerblock = new TextEditingController();
  TextEditingController _controllersteat = new TextEditingController();
  TextEditingController _controlleravenue = new TextEditingController();
  TextEditingController _controllehouse = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerphone = new TextEditingController();
  TextEditingController _controllercreated = new TextEditingController();
  String _checkboxValue;

  String _checkboxValueCites;

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      key: _globalKeyscafield,
      appBar: AppBar(
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
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
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
                    controller: _controllername,
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
                                _favouriteFoodModelDropdownList,
                            onChanged: _onChangeFavouriteFoodModelDropdown,
                            value: _favouriteFoodModel,
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
                          child: Center(
                              child: CustomDropdown2(
                            dropdownMenuItemList:
                                _favouriteFoodModelDropdownList,
                            onChanged: _onChangeFavouriteFoodModelDropdown,
                            value: _favouriteFoodModel,
                            isEnabled: true,
                          )),
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
                        child: CustomTextFyled2(
                            controller: _controllerblock,
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
                            controller: _controllersteat,
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
                            controller: _controlleravenue,
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
                            controller: _controllehouse,
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
                            controller: _controllerphone,
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
                            controller: _controllerEmail,
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
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  profileProviders.loading = true;
                });

                if (_globalKey.currentState.validate()) {
                  _globalKey.currentState.save();

                  profileProviders.addNewAddress(myAddress.id.toString(),_name, "aaa", "aaaaa", _email,
                      _mobil, _streat, _avenue, _house, _block);

                  if (profileProviders.code == 200) {
                    Fluttertoast.showToast(
                        msg: profileProviders.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 15.0);

                    Navigator.pushReplacementNamed(context, SavedAddress.id);
                  }
                } else {
                  _globalKeyscafield.currentState.showSnackBar(SnackBar(
                    content: Text(
                      "please  fill Details",
                    ),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: KColorecart,
                ),
                height: 38,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: profileProviders.loading
                      ? Container(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getContrlorText() {
    _controllerEmail.text = myAddress.email;
    _controllerphone.text = myAddress.phone;
    _controllehouse.text = myAddress.apartmentNo;
    _controllername.text = myAddress.name;
    _controllersteat.text = myAddress.street;
    _controllerblock.text = myAddress.address;
     _controlleravenue.text = myAddress.area;
    // _controllehouse.text = myAddress.apartmentNo;
    // _controllername.text = myAddress.name;
    // _controllersteat.text = myAddress.street;
  }
}
