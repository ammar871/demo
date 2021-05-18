import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_dropdown/custom_dropdown.dart';
import '../constans.dart';

class LocationScreen extends StatefulWidget {
  static String id = "LocationScreen";

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int _checkboxValue1,_checkboxValue2,_checkboxValue3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //End AppBar
      body: Column(
        children: [
          Container(
            height: 60,
            color: KColoreblue,
            child: Center(
              child: CustomDropdown(
                enabledColor: KColoreblue,
                enableTextColor: Colors.white,
                openColor: Colors.white,
                hint: 'hint',
                valueIndex: _checkboxValue1,
                disabledIconColor: Colors.white,
                enabledIconColor: Colors.white,
                items: [
                  CustomDropdownItem(text: "Kuwait City"),
                  CustomDropdownItem(text: "second"),
                  CustomDropdownItem(text: "third"),
                  CustomDropdownItem(text: "fourth"),
                ],
                onChanged: (newValue) {
                  setState(() {
                    _checkboxValue1 = newValue;
                  });
                },
              ),
            ),
          )
        ,SizedBox(height: 10,),

           Container(
            height: 60,
            color: KColoreblue,
            child: Center(
              child: CustomDropdown(
                enabledColor: KColoreblue,
                enableTextColor: Colors.white,
                openColor: Colors.white,
                hint: 'hint',
                valueIndex: _checkboxValue2,
                disabledIconColor: Colors.white,
                enabledIconColor: Colors.white,
                items: [
                  CustomDropdownItem(text: "Salmiya"),
                  CustomDropdownItem(text: "second"),
                  CustomDropdownItem(text: "third"),
                  CustomDropdownItem(text: "fourth"),
                ],
                onChanged: (newValue) {
                  setState(() {
                    _checkboxValue2 = newValue;
                  });
                },
              ),
            ),
          )
        ,SizedBox(height: 10,),

          Container(
            height: 60,
            color: KColoreblue,
            child: Center(
              child: CustomDropdown(
                enabledColor: KColoreblue,
                enableTextColor: Colors.white,
                openColor: Colors.white,
                hint: 'hint',
                valueIndex: _checkboxValue3,
                disabledIconColor: Colors.white,
                enabledIconColor: Colors.white,
                items: [
                  CustomDropdownItem(text: "Hawally"),
                  CustomDropdownItem(text: "second"),
                  CustomDropdownItem(text: "third"),
                  CustomDropdownItem(text: "fourth"),
                ],
                onChanged: (newValue) {
                  setState(() {
                    _checkboxValue3 = newValue;
                  });
                },
              ),
            ),
          )
        ,
       
        ],
      ),
    );
  }
}
