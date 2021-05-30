// To parse this JSON data, do
//
//     final bodyCheckOut = bodyCheckOutFromJson(jsonString);

import 'dart:convert';

BodyCheckOut bodyCheckOutFromJson(String str) => BodyCheckOut.fromJson(json.decode(str));

String bodyCheckOutToJson(BodyCheckOut data) => json.encode(data.toJson());

class BodyCheckOut {
  BodyCheckOut({
    this.name,
    this.email,
    this.phone,
    this.city,
    this.area,
    this.address,
    this.giftMessage,
    this.paymentMethod,
    this.paymentId,
    this.pickupId,
    this.userId,
    this.totalCart,
    this.coupon,
    this.cart,
  });

  String name;
  String email;
  String phone;
  String city;
  String area;
  String address;
  String giftMessage;
  String paymentMethod;
  String paymentId;
  int pickupId;
  String userId;
  String totalCart;
  Coupon coupon;
  List<Cart> cart;

  factory BodyCheckOut.fromJson(Map<String, dynamic> json) => BodyCheckOut(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    city: json["city"],
    area: json["area"],
    address: json["address"],
    giftMessage: json["gift_message"],
    paymentMethod: json["payment_method"],
    paymentId: json["payment_id"],
    pickupId: json["pickup_id"],
    userId: json["user_id"],
    totalCart: json["total_cart"],
    coupon: Coupon.fromJson(json["coupon"]),
    cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "city": city,
    "area": area,
    "address": address,
    "gift_message": giftMessage,
    "payment_method": paymentMethod,
    "payment_id": paymentId,
    "pickup_id": pickupId,
    "user_id": userId,
    "total_cart": totalCart,
    "coupon": coupon.toJson(),
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
  };
}

class Cart {
  Cart({
    this.itemId,
    this.price,
    this.qty,
    this.total,
  });

  int itemId;
  String price;
  String qty;
  String total;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    itemId: json["item_id"],
    price: json["price"],
    qty: json["qty"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "price": price,
    "qty": qty,
    "total": total,
  };
}

class Coupon {
  Coupon({
    this.id,
    this.discount,
    this.total,
  });

  int id;
  double discount;
  double total;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    id: json["id"],
    discount: json["discount"].toDouble(),
    total: json["total"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "discount": discount,
    "total": total,
  };
}
