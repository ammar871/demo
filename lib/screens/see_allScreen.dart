import 'package:flutter/material.dart';

import '../constans.dart';
import 'home_screen.dart';

class SeeAllScreen extends StatefulWidget{
  @override
  _SeeAllScreenState createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Navigator.pushNamed(context, HomeScreen.id);
          },
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: KColorecart,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Cartv",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: KColorecart),
        ),
      ),
    );
  }
}