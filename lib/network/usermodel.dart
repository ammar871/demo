// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    this.data,
    this.token,
  });

  Data data;
  String token;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    data: Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "token": token,
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.avatar,
    this.localedType,
    this.createdAt,
    this.createdAtFormated,
  });

  int id;
  String name;
  String email;
  String phone;
  String type;
  String avatar;
  String localedType;
  DateTime createdAt;
  String createdAtFormated;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    type: json["type"],
    avatar: json["avatar"],
    localedType: json["localed_type"],
    createdAt: DateTime.parse(json["created_at"]),
    createdAtFormated: json["created_at_formated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "type": type,
    "avatar": avatar,
    "localed_type": localedType,
    "created_at": createdAt.toIso8601String(),
    "created_at_formated": createdAtFormated,
  };
}
