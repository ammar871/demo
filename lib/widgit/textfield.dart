import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class CustomTextFelid extends StatelessWidget {
  final String hint;
  final IconData icon;

  final Function onClick;
  CustomTextFelid({@required this.onClick,@required this.icon, @required this.hint});

  // ignore: missing_return
  String _errorMassege(String str) {
    switch (str) {
      case "Enter your Name":
        return "Name is Empty";
          case "Enter your Email":
        return "Email is Empty";
          case "Enter your Password":
        return "Password is Password";
        
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:3.0),
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return _errorMassege(hint);
          }
        },
        obscureText: hint=="Enter your Password" ? true :false,
onSaved: onClick,

        cursorColor: KColoreText,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
            hintText: hint,
            suffixIcon: Icon(
              icon,
              color: KColoreblue,
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
