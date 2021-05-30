import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constans.dart';

class CustomTextFyled2 extends StatelessWidget {
  final String hint;
  final Function onClick;
  BuildContext context;
 final TextEditingController controller;
  // ignore: missing_return
  String _errorMassege(String str) {
    switch (str) {
      case "Full Name":
        return "Name is Empty";
      case "Email":
        return "Email is Empty";
      case "Password":
        return "Password is Empty";
      case "Mobile":
        return "Mobil is Empty";


    }
  }

  CustomTextFyled2({@required this.hint,@required this.onClick,@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Center(
        child: TextFormField(
          
          controller: controller,
          // ignore: missing_return
          validator: (value) {

            if (value.isEmpty) {


            }
          },
          keyboardType: hint=="Mobil" ?TextInputType.phone :TextInputType.text,
          onSaved: onClick,
          obscureText: hint=="Password" ? true : false,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: KColorecart),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: KColorecart),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: KColoreblue, width: 1.4),
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: KColoreblue, width: 1.4),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}
