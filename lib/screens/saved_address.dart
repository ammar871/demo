import 'package:demo/providers/all_address_providers.dart';
import 'package:demo/screens/update_address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constans.dart';

class SavedAddress extends StatefulWidget {
  static String id = "SavedAddress";

  @override
  _SavedAddressState createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  AllAddressProviders _addressProviders;

  initData() async {
    if (_addressProviders == null) {
      _addressProviders = Provider.of(context);
      _addressProviders.loading = true;
      _addressProviders.getDataProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    initData();
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
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
        ),
      ),
      body: _addressProviders.loading
          ? Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: SpinKitRing(
                  color: KColorecart,
                  size: 30,
                  duration: Duration(milliseconds: 700),
                  lineWidth: 5,
                ),
              ),
            )
          : ListView.builder(
              itemCount: _addressProviders.myAddressList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5, top: 3, bottom: 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: KColorecart,
                          ),
                          height: 38,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _addressProviders.myAddressList[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){

                              Navigator.push(context, new MaterialPageRoute(builder:
                                  (context) => new UpdateAddressAddress(myAddressS: _addressProviders.myAddressList
                              [index])));

                            },

                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(color: KColorecart),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.edit,
                                color: KColorecart,
                                size: 18,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(color: KColorecart),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.delete_forever_outlined,
                              color: KColorecart,
                              size: 18,
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
/*
*
*  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: KColorecart,
                    ),
                    height: 38,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(color: KColorecart),

                        ),
                      child: Center(
                        child: Icon(
                          Icons.edit,color: KColorecart,size: 18,
                        )
                      ),

                    ),
                    SizedBox(width: 2,),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: KColorecart),

                      ),
                      child: Center(
                          child: Icon(
                            Icons.delete_forever_outlined,color: KColorecart,size: 18,
                          )
                      ),

                    )
                  ],
                ),





              ],
            ),
            SizedBox(
height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: KColorecart,
                    ),
                    height: 38,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Office",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: KColoreblue),

                      ),
                      child: Center(
                          child: Icon(
                            Icons.edit,color: KColoreblue,size: 18,
                          )
                      ),

                    ),
                    SizedBox(width: 2,),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: KColoreblue),

                      ),
                      child: Center(
                          child: Icon(
                            Icons.delete_forever_outlined,color: KColorecart,size: 18,
                          )
                      ),

                    )
                  ],
                ),





              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: KColorecart,
                    ),
                    height: 38,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Work",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: KColoreblue),

                      ),
                      child: Center(
                          child: Icon(
                            Icons.edit,color: KColorecart,size: 18,
                          )
                      ),

                    ),
                    SizedBox(width: 2,),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: KColoreblue),

                      ),
                      child: Center(
                          child: Icon(
                            Icons.delete_forever_outlined,color: KColorecart,size: 18,
                          )
                      ),

                    )
                  ],
                ),





              ],
            ),
          ],
        ),
      )
* */
