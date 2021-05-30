import 'dart:convert';

import 'package:demo/editor/shard_prefrance.dart';
import 'package:demo/network/response_products.dart';
import 'package:demo/pojo/body_checkout.dart';
import 'package:demo/pojo/data/response_check_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CheckProviders extends ChangeNotifier {
  ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();

  //======================================================
  bool loading = true;

  ckeckOutCall(BodyCheckOut item) async {

    BodyCheckOut bodyCheckOutapi = BodyCheckOut(
        name: item.name,
        email:   item.email,
        phone:  item.phone,
        city: item.city,
        area: item.area,
        address: item.address,
        giftMessage:  item.giftMessage,
        paymentMethod: item.paymentMethod,
        paymentId:  item.paymentId,
        userId: item.userId,
        totalCart: item.totalCart,
        coupon: item.coupon,
        cart:  item.cart);
String result=jsonEncode(bodyCheckOutapi);
    print(result);
    var uri = Uri.parse(
        "https://demo.wna.net.kw/api/checkout");

    final response = await http.post(uri,

        body:result,
        headers: {


      'Accept-country': 'kw',
      'Accept-Language': await shardPreferencesEditor.getlang(),
      'Accept-currency': 'kw',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      loading = false;

      var dataProducts;


        dataProducts = json.decode(response.body);

      print(dataProducts);

      notifyListeners();
      ResponseCheckOut.fromJson(dataProducts);
    } else {
      loading = false;
      notifyListeners();
    }
  }
}
