import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class SavedAddress extends StatelessWidget {
  static String id="SavedAddress";
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
      body: Padding(
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
      ),
    );
  }
}
