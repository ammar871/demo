import 'dart:convert';

import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/network/response_products.dart';
import 'package:demo/pojo/data/location_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LocationsProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
  List<DataLocations> locations = [];

  //======================================================
  bool loading = true;

  getLocations() async {
    // ignore: unnecessary_statements

    // ignore: await_only_futures

    locations = [];
    var uri = Uri.parse(
        "https://demo.wna.net.kw/api/locations?user_id=1");

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

      if (locations.isEmpty) {
        dataProducts = json.decode(response.body);

        dataProducts["data"].forEach((element) {
          locations.add(DataLocations.fromJson(element));
        });
      }

      notifyListeners();
      ResponseLocations.fromJson(dataProducts);
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
