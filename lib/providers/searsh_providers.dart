import 'dart:convert';

import 'package:demo/cemmon/helper.dart';
import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/pojo/data/response_data_search.dart';


import 'package:demo/pojo/data/rsponse_myOrders.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constans.dart';

class SearchProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

  List<DataSearch> listSearchResult = [];

  ResponseDataSearch responseMyOrder;
  //======================================================
  bool loading = true;

  getDataSearch(String name) async {
    // ignore: unnecessary_statements
    String userId = await shardPreferencesEditor.getUserId();
    // ignore: await_only_futures

    var uri = Uri.parse(BASE_URL + "api/search/products");
    print(userId);
    final response = await http.post(uri, body: {

      "name": name,

    }, headers: {
      'Accept-country': 'kw',
      'Accept-Language': Helper.LANG,
      'Accept-currency': 'kw',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      loading = false;
      print(response.body);
      var dataProducts;
      dataProducts = json.decode(response.body);

      dataProducts["data"].forEach((element) {
        listSearchResult.add(DataSearch.fromJson(element));
      });
      print("${listSearchResult[0].id}, id ");
      notifyListeners();
      responseMyOrder = ResponseDataSearch.fromJson(dataProducts);
      print(responseMyOrder.data.length.toString());
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
