import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class CustomTextFyled3 extends StatelessWidget {
  final String hint;

  const CustomTextFyled3({this.hint});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Center(
        child: TextFormField(
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
              borderSide: const BorderSide(color: KColorecart, width: 1.4),
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: KColorecart, width: 1.4),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}
