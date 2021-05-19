import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/providers/profile_provider.dart';
import 'package:demo/widgit/textField2.dart';
import 'package:demo/widgit/textField3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constans.dart';

class DetailAccount extends StatefulWidget {
  static String id = "DetailAccount";

  @override
  _DetailAccountState createState() => _DetailAccountState();
}

class _DetailAccountState extends State<DetailAccount> {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

  String _name, _email, _password, _mobil;
  final GlobalKey<FormState> _globalKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKeyscafield = GlobalKey();

  TextEditingController _controllername = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerphone = new TextEditingController();
  TextEditingController _controllercreated = new TextEditingController();

  bool isloading = false;
  ProfileProviders profileProviders;

  initData() async {
    if (profileProviders == null) {
      profileProviders = Provider.of(context);

      profileProviders.loading = true;
      profileProviders.getDataProfile();
      _controllername.text = profileProviders.dataProfile.name;
      _controllerEmail.text = profileProviders.dataProfile.email;
      _controllerphone.text = profileProviders.dataProfile.phone;
      _controllercreated.text = profileProviders.dataProfile.createdAt.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      key: _globalKeyscafield,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {},
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
      body: profileProviders.loading
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
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomTextFyled2(
                          controller: _controllername,
                          onClick: (value) {
                            profileProviders.dataProfile.name = value;
                          },
                          hint: "name",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFyled2(
                          controller: _controllerEmail,
                          onClick: (value) {
                            profileProviders.dataProfile.email = value;
                          },
                          hint: "Email",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFyled2(
                          controller: _controllercreated,
                          onClick: (value) {
                            _email = value;
                          },
                          hint: "***********",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFyled2(
                          controller: _controllerphone,
                          onClick: (value) {
                            profileProviders.dataProfile.phone = value;
                          },
                          hint: "Email",
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: KColorecart,
                        ),
                        height: 38,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Update",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
