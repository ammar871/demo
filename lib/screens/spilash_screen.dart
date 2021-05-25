import 'dart:async';
import 'dart:io';

import 'package:demo/cemmon/cemmon.dart';
import 'package:demo/constans.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class SpilashScreen extends StatefulWidget {
  static String id = "SpilashScreen";

  @override
  _SpilashScreenState createState() => _SpilashScreenState();
}

class _SpilashScreenState extends State<SpilashScreen>
    with SingleTickerProviderStateMixin {
  FirebaseMessaging messaging = FirebaseMessaging.instance;


  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    messaging.getToken().then((token) {
      print(token);
      Cemmon.FCMToken=token;
    });
  }
  //   messaging.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       print('on message $message');
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       print('on resume $message');
  //     },
  //     onLaunch: (Map<String, dynamic> message) async {
  //       print('on launch $message');
  //     },
  //   );
  // }

  void iOS_Permission() async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print(settings.authorizationStatus);
  }



  var _visible = true;
  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration,
      navigationPage
    );
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.id);
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();


    print("${Cemmon.SELECT_SERVICE} ,Cemmeon ");
    firebaseCloudMessaging_Listeners();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage("images/logo.png"),width: 200,height: 80,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Powered by",
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: KColoreText),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    "Webnapps",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: KColoreblue),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
