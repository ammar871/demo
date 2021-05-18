import 'package:demo/widgit/textField3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class AddNewAddress extends StatefulWidget {
  static String id="AddNewAddress";

  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  int _listandGrid = 0;

  String _checkboxValue;

  String _checkboxValueCites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:AppBar(
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
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
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
          CustomTextFyled3(hint: "Address Name"),
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: KColorecart),

                    ),
                    height: 35,

                    child: Center(
                        child: DropdownButton<String>(
                          hint: Text("Area",style:TextStyle(color: KColorecart)),
                          style: TextStyle(color: Colors.red, fontSize: 15),
                          underline: Container(
                            height: 0,
                            color: Colors.deepPurpleAccent,
                          ),
                          iconDisabledColor: Colors.white,
                          elevation: 0,

                          focusNode: null,
                          icon: Icon(Icons.keyboard_arrow_down,color:KColorecart,),
                          value: _checkboxValue,
                          items: <String>['Area', 'Apple', 'Amazon', 'Tesla']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: TextStyle(color: KColorecart),),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _checkboxValue = value ;
                            });
                          },
                        )

                    ),
                  ),
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: KColorecart),

                    ),
                    height: 35,

                    child: Center(
                        child: DropdownButton<String>(
                          hint: Text("Cites",style:TextStyle(color: KColorecart)),
                          style: TextStyle(color: Colors.red, fontSize: 15),
                          underline: Container(
                            height: 0,
                            color: Colors.deepPurpleAccent,
                          ),
                          iconDisabledColor: Colors.white,
                          elevation: 0,

                          focusNode: null,
                          icon: Icon(Icons.keyboard_arrow_down,color:KColorecart,),
                          value: _checkboxValueCites,
                          items: <String>['cites', 'Apple', 'Amazon', 'Tesla']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: TextStyle(color: KColorecart),),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _checkboxValueCites = value ;
                            });
                          },
                        )

                    ),
                  ),
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
                child: CustomTextFyled3(hint: "Block"),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextFyled3(hint: "Street"),
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
                child: CustomTextFyled3(hint: "Avenue"),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextFyled3(hint: "House/Apartment No."),
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
                child: CustomTextFyled3(hint: "Phone"),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextFyled3(hint: "Email"),
              )
            ],
          ),
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
}
