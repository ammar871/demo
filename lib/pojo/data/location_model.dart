// To parse this JSON data, do
//
//     final responseLocations = responseLocationsFromJson(jsonString);

import 'dart:convert';

ResponseLocations responseLocationsFromJson(String str) => ResponseLocations.fromJson(json.decode(str));

String responseLocationsToJson(ResponseLocations data) => json.encode(data.toJson());

class ResponseLocations {
  ResponseLocations({
    this.data,
    this.links,
    this.meta,
  });

  List<DataLocations> data;
  Links links;
  Meta meta;

  factory ResponseLocations.fromJson(Map<String, dynamic> json) => ResponseLocations(
    data: List<DataLocations>.from(json["data"].map((x) => DataLocations.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class DataLocations {
  DataLocations({
    this.id,
    this.name,
    this.longitude,
    this.latitude,
    this.block,
    this.phone,
  });

  int id;
  String name;
  String longitude;
  String latitude;
  String block;
  String phone;

  factory DataLocations.fromJson(Map<String, dynamic> json) => DataLocations(
    id: json["id"],
    name: json["name"] == null ? null : json["name"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    block: json["block"] == null ? null : json["block"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? null : name,
    "longitude": longitude,
    "latitude": latitude,
    "block": block == null ? null : block,
    "phone": phone == null ? null : phone,
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
