import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class DrawLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      "images/arbic.png",
                      width: 30,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: Text(
                        "Arabic",
                        style: TextStyle(color: KColoreblue),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.close,
                  size: 30,
                )
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
                          border: Border.all(color: KColoreblue),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 1, bottom: 1, left: 18, right: 18),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Delivery",
                                  style: TextStyle(
                                      color: KColoreblue,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ))),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: KColoreblue),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 1, bottom: 1, left: 18, right: 18),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Pick up",
                                  style: TextStyle(
                                      color: KColoreblue,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        )))
              ],
            ),
            SizedBox(
              height: 25,
            ),
            _itemMenue(
              name: "Home",
            ),
            _itemMenue(
              name: "Location",
            ),
            _itemMenue(
              name: "Login",
            ),
            InkWell(
                onTap: () {},
                child: _itemMenue(
                  name: "My orders",
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo_nav.png",
                  width: 30,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("جميع الحقوق محفوظة لشركة ",
                        style: TextStyle(
                            fontSize: 12,
                            color: KColoreblue,
                            fontWeight: FontWeight.bold)),
                    Text("(اسم الشركة) بدعم من ويب اند ابز ",
                        style: TextStyle(
                            fontSize: 12,
                            color: KColoreblue,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  width: 1,
                ),
                Image.asset(
                  "images/logo_navt.png",
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
// ignore: camel_case_types
class _itemMenue extends StatelessWidget {
  final String name;

  _itemMenue({this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            Icon(Icons.keyboard_arrow_right_outlined)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 1.2,
          color: KColorelin,
        )
      ],
    );
  }
}
