import 'dart:convert';

import 'package:demo/editor/shard_prefrance.dart';

import 'package:demo/pojo/data/dataProfile.dart';
import 'package:demo/pojo/data/myAddress_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AllAddressProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

List<DatatMyAddress> myAddressList=[];
  //======================================================
  bool loading = true;

  getDataProfile() async {
    // ignore: unnecessary_statements
    myAddressList=[];
    String userId = await shardPreferencesEditor.getUserId();
    // ignore: await_only_futures
    print(userId);
    var uri = Uri.parse("https://demo.wna.net.kw/api/my-addresses?user_id=$userId");

    final response = await http.get(uri, headers: {
      'Accept-country': 'kw',
      'Accept-Language': await shardPreferencesEditor.getlang(),
      'Accept-currency': 'kw',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      loading = false;
      // print(response.body);
var dataProducts;
      if (myAddressList.isEmpty) {
        dataProducts = json.decode(response.body);

        dataProducts["data"].forEach((element) {
          myAddressList.add(DatatMyAddress.fromJson(element));
        });
      }


      notifyListeners();
      ResponseaddMyAddress.fromJson(dataProducts);
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
