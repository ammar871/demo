

import 'dart:convert';

ResponseCheckOut responseCheckOutFromJson(String str) => ResponseCheckOut.fromJson(json.decode(str));

String responseCheckOutToJson(ResponseCheckOut data) => json.encode(data.toJson());

class ResponseCheckOut {
  ResponseCheckOut({
    this.data,
  });

  Data data;

  factory ResponseCheckOut.fromJson(Map<String, dynamic> json) => ResponseCheckOut(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.phone,
    this.city,
    this.area,
    this.address,
    this.status,
    this.giftMessage,
    this.discount,
    this.subTotal,
    this.total,
    this.items,
  });

  int id;
  String name;
  String phone;
  String city;
  String area;
  String address;
  String status;
  String giftMessage;
  double discount;
  SubTotal subTotal;
  SubTotal total;
  List<Item> items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    city: json["city"],
    area: json["area"],
    address: json["address"],
    status: json["status"],
    giftMessage: json["gift_message"],
    discount: json["discount"].toDouble(),
    subTotal: SubTotal.fromJson(json["sub_total"]),
    total: SubTotal.fromJson(json["total"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "city": city,
    "area": area,
    "address": address,
    "status": status,
    "gift_message": giftMessage,
    "discount": discount,
    "sub_total": subTotal.toJson(),
    "total": total.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.orderId,
    this.qty,
    this.price,
    this.total,
    this.item,
  });

  int id;
  int orderId;
  int qty;
  SubTotal price;
  SubTotal total;
  dynamic item;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    orderId: json["order_id"],
    qty: json["qty"],
    price: SubTotal.fromJson(json["price"]),
    total: SubTotal.fromJson(json["total"]),
    item: json["item"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "qty": qty,
    "price": price.toJson(),
    "total": total.toJson(),
    "item": item,
  };
}

class SubTotal {
  SubTotal({
    this.price,
    this.formatted,
  });

  double price;
  String formatted;

  factory SubTotal.fromJson(Map<String, dynamic> json) => SubTotal(
    price: json["price"].toDouble(),
    formatted: json["formatted"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "formatted": formatted,
  };
}
