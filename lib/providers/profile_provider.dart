import 'dart:convert';

import 'package:demo/cemmon/helper.dart';
import 'package:demo/editor/shard_prefrance.dart';

import 'package:demo/pojo/data/dataProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProfileProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
  DataProfile dataProfile;

  //======================================================
  bool loading = true;

  getDataProfile() async {
    // ignore: unnecessary_statements
    String userId = await shardPreferencesEditor.getUserId();
    // ignore: await_only_futures
    print(userId);
    var uri =
        Uri.parse("https://demo.wna.net.kw/api/profile?user_id=${Helper.USER_ID}");

    final response = await http.get(uri, headers: {
      'Accept-country': 'kw',
      'Accept-Language': Helper.LANG,
      'Accept-currency': 'kw',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      // print(response.body);
      var dataProducts;
      dataProducts = json.decode(response.body);
      dataProfile = DataProfile.fromJson(dataProducts["data"]);
      print(dataProfile.name);
      Helper.name = dataProfile.name;
      Helper.email = dataProfile.email;
      Helper.phone = dataProfile.phone;
      Helper.createdAt = dataProfile.createdAt.toString();

      loading = false;
      notifyListeners();
      ResponseProfile.fromJson(dataProducts);
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
