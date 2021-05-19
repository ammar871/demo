import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/providers/profile_provider.dart';
import 'package:demo/screens/add_new_address.dart';
import 'package:demo/screens/detail_accounte.dart';
import 'package:demo/screens/saved_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget{


  static String id="ProfileScreen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
  bool loginName = false;
  ProfileProviders profileProviders;
  initData() async {
    if (profileProviders == null) {
      profileProviders = Provider.of(context);


      profileProviders.loading = true;
      profileProviders.getDataProfile();


      }
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  getLogin() async {
    loginName = await shardPreferencesEditor.getIsLogin();
    print(loginName);
  }
  @override
  Widget build(BuildContext context) {
    getLogin();
    // initData();
    return Scaffold(

      body: Container(
        child: FutureBuilder(
          future:shardPreferencesEditor.getIsLogin() ,
          builder: (BuildContext context,AsyncSnapshot<bool> snapshot){
            if(snapshot.hasData){
              if(snapshot.data == true){
                return    Container(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, DetailAccount.id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: KColoreblue,
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Account Detail",
                                        style: TextStyle(
                                            color: Colors.white,

                                            fontSize: 15),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            InkWell(
                              onTap: (){

                                Navigator.pushNamed(context, AddNewAddress.id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: KColoreblue,
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add new Address",
                                        style: TextStyle(
                                            color: Colors.white,

                                            fontSize: 15),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, SavedAddress.id);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: KColoreblue,
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Saved Addresses",
                                        style: TextStyle(
                                            color: Colors.white,

                                            fontSize: 15),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
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
                                "Logout",
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

              }else{
            return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please Login",
                            style: TextStyle(
                                fontSize: 20, color: KColorecart),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, LoginScreen.id);
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
                                    child: Text("Go To Login",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.white,
                                        )),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

            }else{
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Please Login",
                          style: TextStyle(
                              fontSize: 20, color: KColorecart),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, LoginScreen.id);
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
                                  child: Text("Go To Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.white,
                                      )),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}