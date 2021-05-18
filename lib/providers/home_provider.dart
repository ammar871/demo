import 'dart:convert';

import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/network/response_products.dart';
import 'package:demo/pojo/data/data_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
  List<DataCategory> categories = [];

  //======================================================
  bool loading = true;
ProductData productData;
  String name, id;

  getDataHome() async {
    // ignore: unnecessary_statements

    // ignore: await_only_futures

    categories = [];
    var uri = Uri.parse("https://demo.wna.net.kw/api/home-api");

    final response = await http.get(uri, headers: {
      'Accept-country': 'kw',
      'Accept-Language': await shardPreferencesEditor.getlang(),
      'Accept-currency': 'kw',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      loading = false;
   //   print(response.body);
      var dataProducts;

      if (categories.isEmpty) {
        dataProducts = json.decode(response.body);

        dataProducts["data"].forEach((element) {

          categories.add(DataCategory.fromJson(element));
        });
      }
    //  print(categories[0].title);
      notifyListeners();
      ResponseHome.fromJson(dataProducts);
    } else {
      loading = false;

      notifyListeners();
    }
  }
}

//======================================================
