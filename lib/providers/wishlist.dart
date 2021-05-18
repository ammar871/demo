import 'dart:convert';

import 'package:demo/editor/shard_prefrance.dart';

import 'package:demo/pojo/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WishListProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
  List<DataWishList> wishLists = [];

  //======================================================
  bool loading = true;

  String name, id;

  getDataHome() async {
    wishLists = [];
   id = await shardPreferencesEditor.getUserId();

  //  print(id);
    var uri = Uri.parse("https://demo.wna.net.kw/api/wishlist?user_id="+id);

    final response = await http.get(uri, headers: {
      'Accept-country': 'kw',
      'Accept-Language': await shardPreferencesEditor.getlang(),
      'Accept-currency': 'kw',
      'Accept':'application/json',
    });

    if (response.statusCode == 200) {
      loading = false;
   //   print(response.body);
      var dataProducts;

      if (wishLists.isEmpty) {
        dataProducts = json.decode(response.body);

        dataProducts["data"].forEach((element) {
          wishLists.add(DataWishList.fromJson(element));
        });
      }

      print(wishLists[0].name);
      notifyListeners();
      responseWishListFromJson(dataProducts);
    } else {
      loading = false;

      notifyListeners();
    }
  }
}

//======================================================
