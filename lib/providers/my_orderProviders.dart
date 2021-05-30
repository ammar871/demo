import 'dart:convert';

import 'package:demo/cemmon/helper.dart';
import 'package:demo/editor/shard_prefrance.dart';


import 'package:demo/pojo/data/rsponse_myOrders.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MyOrdersProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
 
  List<ItemElement> listOrder = [];
    List<DataOrder> listAll = [];
  ResponseMyOrder responseMyOrder;
  //======================================================
  bool loading = true;

  getDataMyOrders() async {
    // ignore: unnecessary_statements
    String userId = await shardPreferencesEditor.getUserId();
    // ignore: await_only_futures
    print(userId);
    var uri = Uri.parse("https://demo.wna.net.kw/api/my-orders?user_id=1");

    final response = await http.get(uri, headers: {
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
        listAll.add(DataOrder.fromJson(element));
      });
      print("${listAll[0].id}, id ");
      notifyListeners();
      responseMyOrder = ResponseMyOrder.fromJson(dataProducts);
      print(responseMyOrder.data.length.toString());
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
