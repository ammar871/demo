import 'dart:convert';

import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/network/response_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DataProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
  List<ProductData> products = [];

  //======================================================
  bool loading = true;

  getProductsCategories(String idCategory) async {
    // ignore: unnecessary_statements

    // ignore: await_only_futures

    products = [];
    var uri = Uri.parse(
        "https://demo.wna.net.kw/api/select/products?category_id=$idCategory");

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

      if (products.isEmpty) {
        dataProducts = json.decode(response.body);

        dataProducts["data"].forEach((element) {
          products.add(ProductData.fromJson(element));
        });
      }

      notifyListeners();
      ResponseProductsCategories.fromJson(dataProducts);
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
