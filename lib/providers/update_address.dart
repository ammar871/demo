import 'dart:convert';

import 'package:demo/editor/shard_prefrance.dart';

import 'package:demo/pojo/data/model_add_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constans.dart';

class UpdateAddressProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

  //======================================================
  bool loading = false;
  int code;
  String message;

  addNewAddress(
      String addressId,
      String _name,
      String _area,
      String _cites,
      String _email,
      String _mobil,
      String _streat,
      String _avenue,
      String _house,
      String _block) async {
    // ignore: unnecessary_statements
    String userId = await shardPreferencesEditor.getUserId();
    // ignore: await_only_futures

    var uri = Uri.parse(BASE_URL + "api/update-address/$addressId");

    final response = await http.post(uri, body: {
      "user_id": userId,
      "name": _name,
      "governorate_id": "2",
      "area_id": "1",
      "street": _streat,
      "area": _area,
      "apartment_no": _house,
      "address": _streat,
      "phone": _mobil,
      "email": _mobil
    }, headers: {
      'Accept-country': 'kw',
      'Accept-Language': await shardPreferencesEditor.getlang(),
      'Accept-currency': 'kw',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      code = response.statusCode;
      loading = false;
      // print(response.body);
      var dataProducts;

      dataProducts = json.decode(response.body);
      message = dataProducts["msg"];
      print(message);
      notifyListeners();
      ResponseaddAddress.fromJson(dataProducts);
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
