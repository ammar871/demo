
import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/widgit/textField3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class DetailAccount extends StatefulWidget{
  static String id ="DetailAccount";

  @override
  _DetailAccountState createState() => _DetailAccountState();
}

class _DetailAccountState extends State<DetailAccount> {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

  String _name, _email, _password, _mobil;
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();
  bool isloading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:   AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {

        },
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
            Column(
              children: [
                CustomTextFyled3(hint: "Account Detail"),
                SizedBox(height: 15,),
                CustomTextFyled3(hint: "abc@abc.com"),
                SizedBox(height: 15,),
                CustomTextFyled3(hint: "*******"),

                SizedBox(height: 15,),
                CustomTextFyled3(hint: "+965 12345678"),
              ],
            ),

            InkWell(
              onTap: () {

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: KColorecart,
                ),
                height: 38,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Update",
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
    );

  }
}