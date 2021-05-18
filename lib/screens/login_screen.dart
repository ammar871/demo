import 'dart:convert';

import 'package:demo/constans.dart';
import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/network/usermodel.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/sign_up_screen.dart';
import 'package:demo/widgit/textField2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
  String _email, _password;
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();
  Data data;
  bool isloading = false;

  Future<UserLogin> createLogin(String email, String pass, String token) async {
    setState(() {
      isloading = true;
    });
    var uri = Uri.parse(BASE_URL + "api/login");

    final response = await http.post(uri,
        body: {"username": email, "password": pass, "firebase_token": token});

    if (response.statusCode == 200) {
      var dataDecode = json.decode(response.body);
      data = Data.fromJson(dataDecode["data"]);
      shardPreferencesEditor.setUserId(data.id.toString());
      shardPreferencesEditor.setIsLogin(true);

      print(await shardPreferencesEditor.getIsLogin());

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

      return userLoginFromJson(responseString);
    } else {
      setState(() {
        isloading = false;
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                CustomTextFyled2(
                  onClick: (value) {
                    _email = value;
                  },
                  hint: "Email",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFyled2(
                  onClick: (value) {
                    _password = value;
                  },
                  hint: "Password",
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: KColorecart),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () async {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();

                      print("print  +  $_email + $_password ");

                      final UserLogin user =
                          await createLogin("Admin@Wna.Net.Kw", "password", "kjsajkajlas");
                      shardPreferencesEditor.setAuthToken(user.token);
                      print("" + await shardPreferencesEditor.getAuthToken());
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
                  child: Container(
                    height: 40,
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
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                                strokeWidth: 3,
                              ),
                            )
                          : Text("Login",
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
                    Text("Don't have an account?",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: KColoreText,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: Text("Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: KColoreblue,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
