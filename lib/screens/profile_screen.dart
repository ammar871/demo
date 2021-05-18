import 'package:demo/screens/add_new_address.dart';
import 'package:demo/screens/detail_accounte.dart';
import 'package:demo/screens/saved_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class ProfileScreen extends StatelessWidget{


  static String id="ProfileScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
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
      ),
    );
  }


}