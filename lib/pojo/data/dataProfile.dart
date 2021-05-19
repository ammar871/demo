

import 'dart:convert';

ResponseProfile responseProfileFromJson(String str) => ResponseProfile.fromJson(json.decode(str));

String responseProfileToJson(ResponseProfile data) => json.encode(data.toJson());

class ResponseProfile {
  ResponseProfile({
    this.data,
  });

  DataProfile data;

  factory ResponseProfile.fromJson(Map<String, dynamic> json) => ResponseProfile(
    data: DataProfile.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class DataProfile {
  DataProfile({
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

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
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
