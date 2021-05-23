// To parse this JSON data, do
//
//     final responseaddMyAddress = responseaddMyAddressFromJson(jsonString);

import 'dart:convert';

ResponseaddMyAddress responseaddMyAddressFromJson(String str) => ResponseaddMyAddress.fromJson(json.decode(str));

String responseaddMyAddressToJson(ResponseaddMyAddress data) => json.encode(data.toJson());

class ResponseaddMyAddress {
  ResponseaddMyAddress({
    this.data,
    this.links,
    this.meta,
  });

  List<DatatMyAddress> data;
  Links links;
  Meta meta;

  factory ResponseaddMyAddress.fromJson(Map<String, dynamic> json) => ResponseaddMyAddress(
    data: List<DatatMyAddress>.from(json["data"].map((x) => DatatMyAddress.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class DatatMyAddress {
  DatatMyAddress({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.street,
    this.apartmentNo,
    this.area,
    this.datumDefault,
    this.address,
    this.state,
    this.city,
  });

  int id;
  String name;
  String phone;
  String email;
  String street;
  String apartmentNo;
  String area;
  int datumDefault;
  String address;
  City state;
  City city;

  factory DatatMyAddress.fromJson(Map<String, dynamic> json) => DatatMyAddress(
    id: json["id"],
    name: json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    street: json["street"],
    apartmentNo: json["apartment_no"],
    area: json["area"],
    datumDefault: json["default"] == null ? null : json["default"],
    address: json["address"],
    state: City.fromJson(json["state"]),
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "street": street,
    "apartment_no": apartmentNo,
    "area": area,
    "default": datumDefault == null ? null : datumDefault,
    "address": address,
    "state": state.toJson(),
    "city": city.toJson(),
  };
}

class City {
  City({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  dynamic label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}
