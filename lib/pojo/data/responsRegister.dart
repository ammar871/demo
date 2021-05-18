// To parse this JSON data, do
//
//     final responseRegester = responseRegesterFromJson(jsonString);

import 'dart:convert';

ResponseRegester responseRegesterFromJson(String str) => ResponseRegester.fromJson(json.decode(str));

String responseRegesterToJson(ResponseRegester data) => json.encode(data.toJson());

class ResponseRegester {
    ResponseRegester({
        this.data,
        this.token,
    });

    DataRegister data;
    String token;

    factory ResponseRegester.fromJson(Map<String, dynamic> json) => ResponseRegester(
        data: DataRegister.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "token": token,
    };
}

class DataRegister {
    DataRegister({
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

    factory DataRegister.fromJson(Map<String, dynamic> json) => DataRegister(
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
