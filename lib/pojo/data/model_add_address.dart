
import 'dart:convert';

ResponseaddAddress responseaddAddressFromJson(String str) => ResponseaddAddress.fromJson(json.decode(str));

String responseaddAddressToJson(ResponseaddAddress data) => json.encode(data.toJson());

class ResponseaddAddress {
  ResponseaddAddress({
    this.msg,
  });

  String msg;

  factory ResponseaddAddress.fromJson(Map<String, dynamic> json) => ResponseaddAddress(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
