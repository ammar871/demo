import 'dart:convert';

import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/network/usermodel.dart';
import 'package:demo/pojo/data/responsRegister.dart';
import 'package:demo/widgit/textField2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../constans.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

  String _name, _email, _password, _mobil;
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();
  bool isloading = false;
  DataRegister data;
  Future<ResponseRegester> registerApi(
      String name, String email, String password, String mobil) async {
    setState(() {
      isloading = true;
    });
    var uri = Uri.parse("https://demo.wna.net.kw/api/register");

    final response = await http.post(uri, body: {
      "first_name": name,
      "last_name": ".",
      "email": email,
      "password": password,
      "avatar": "",
      "phone": mobil,
      "firebase_token": "towewewewead"
    });

    if (response.statusCode == 201) {
      var dataDecode = json.decode(response.body);
      data = DataRegister.fromJson(dataDecode["data"]);
      print(data.id.toString());
      shardPreferencesEditor.setUserId(data.id.toString());

      shardPreferencesEditor.setIsLogin(true);
      setState(() {
        isloading = false;
      });
      Fluttertoast.showToast(
          msg: "تم التسجيل بنجاح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 15.0);

      final String responseString = response.body;
      print(response.body);
      return responseRegesterFromJson(responseString);
    } else {
      print(response.body);
      setState(() {
        // isloading = false;
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _globalKeyscafield,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "Sign up",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
          ),
        ),
        body: Container(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 10, right: 10, bottom: 20),
              child: Form(
                key: _globalKey,
                child: ListView(
                  children: [
                    CustomTextFyled2(
                        onClick: (value) {
                          _name = value;
                        },
                        hint: "Full Name"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFyled2(
                        onClick: (value) {
                          _email = value;
                        },
                        hint: "Email"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFyled2(
                        onClick: (value) {
                          _password = value;
                        },
                        hint: "Password"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFyled2(
                        onClick: (value) {
                          _mobil = value;
                        },
                        hint: "Mobile"),
                    SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_globalKey.currentState.validate()) {
                          _globalKey.currentState.save();
                          print(
                              "print$_name  +  $_email + $_password + $_mobil");
                          final ResponseRegester user = (await registerApi(
                              _name, _email, _password, _mobil));
                          shardPreferencesEditor.setAuthToken(user.token);
                          print(
                              "" + await shardPreferencesEditor.getAuthToken());
                          Navigator.pushNamed(context, HomeScreen.id);
                          setState(() {
                            print(user.data.email + "");
                          });
                        } else {
                          // ignore: deprecated_member_use
                          _globalKeyscafield.currentState.showSnackBar(SnackBar(
                            content: Text(
                              "Please Fill Your Detaiils",
                            ),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                      focusColor: KColoreblue,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: KColoreblue),
                          borderRadius: BorderRadius.circular(4.0),
                          color: KColorecart,
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isloading
                              ? Container(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.white),
                                    strokeWidth: 3,
                                  ),
                                )
                              : Text("Sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white,
                                  )),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            child: Container(
                          color: KColorecart,
                          height: 1.5,
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text("OR",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: KColorecart,
                              )),
                        ),
                        Expanded(
                            child: Container(
                          color: KColorecart,
                          height: 1.5,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: KColoreblue),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/google.png",
                                width: 15,
                                height: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Login with Google",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: KColorecart,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: KColoreblue),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/apple.png",
                                width: 15,
                                height: 15,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text("Login with Apple",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: KColorecart,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: KColoreblue),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/facebook-f.png",
                                width: 15,
                                height: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Login with Facebook",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: KColorecart,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: KColoreblue),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text("Continue as guest",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: KColorecart,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: KColoreText,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: KColoreblue,
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
