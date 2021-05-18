// To parse this JSON data, do
//
//     final productsCategories = productsCategoriesFromJson(jsonString);

import 'dart:convert';

ResponseProductsCategories productsCategoriesFromJson(String str) => ResponseProductsCategories.fromJson(json.decode(str));

String productsCategoriesToJson(ResponseProductsCategories data) => json.encode(data.toJson());

class ResponseProductsCategories {
  ResponseProductsCategories({
    this.data,
    this.links,
    this.meta,
  });

  List<ProductData> data;
  ProductsCategoriesLinks links;
  Meta meta;

  factory ResponseProductsCategories.fromJson(Map<String, dynamic> json) => ResponseProductsCategories(
    data: List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),
    links: ProductsCategoriesLinks.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class ProductData {
  ProductData({
    this.id,
    this.name,
    this.description,
    this.oldPrice,
    this.hasDiscount,
    this.inStock,
    this.exclusive,
    this.discount,
    this.price,
    this.sizes,
    this.images,
  });

  int id;
  String name;
  String description;
  Discount oldPrice;
  bool hasDiscount;
  bool inStock;
  bool exclusive;
  Discount discount;
  Discount price;
  List<dynamic> sizes;
  List<ImageData> images;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    oldPrice: Discount.fromJson(json["old_price"]),
    hasDiscount: json["has_discount"],
    inStock: json["in_stock"],
    exclusive: json["exclusive"],
    discount: Discount.fromJson(json["discount"]),
    price: Discount.fromJson(json["price"]),
    sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
    images: List<ImageData>.from(json["images"].map((x) => ImageData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "old_price": oldPrice.toJson(),
    "has_discount": hasDiscount,
    "in_stock": inStock,
    "exclusive": exclusive,
    "discount": discount.toJson(),
    "price": price.toJson(),
    "sizes": List<dynamic>.from(sizes.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Discount {
  Discount({
    this.price,
    this.formatted,
  });

  int price;
  String formatted;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
    price: json["price"],
    formatted: json["formatted"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "formatted": formatted,
  };
}

class ImageData {
  ImageData({
    this.id,
    this.url,
    this.preview,
    this.name,
    this.fileName,
    this.type,
    this.mimeType,
    this.size,
    this.humanReadableSize,
    this.details,
    this.status,
    this.conversions,
    this.links,
  });

  int id;
  String url;
  String preview;
  String name;
  String fileName;
  String type;
  String mimeType;
  int size;
  String humanReadableSize;
  Details details;
  dynamic status;
  Conversions conversions;
  ImageLinks links;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
    id: json["id"],
    url: json["url"],
    preview: json["preview"],
    name: json["name"],
    fileName: json["file_name"],
    type: json["type"],
    mimeType: json["mime_type"],
    size: json["size"],
    humanReadableSize: json["human_readable_size"],
    details: Details.fromJson(json["details"]),
    status: json["status"],
    conversions: Conversions.fromJson(json["conversions"]),
    links: ImageLinks.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "preview": preview,
    "name": name,
    "file_name": fileName,
    "type": type,
    "mime_type": mimeType,
    "size": size,
    "human_readable_size": humanReadableSize,
    "details": details.toJson(),
    "status": status,
    "conversions": conversions.toJson(),
    "links": links.toJson(),
  };
}

class Conversions {
  Conversions({
    this.thumb,
    this.small,
    this.medium,
    this.large,
  });

  String thumb;
  String small;
  String medium;
  String large;

  factory Conversions.fromJson(Map<String, dynamic> json) => Conversions(
    thumb: json["thumb"],
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "thumb": thumb,
    "small": small,
    "medium": medium,
    "large": large,
  };
}

class Details {
  Details({
    this.width,
    this.height,
    this.ratio,
  });

  dynamic width;
  dynamic height;
  int ratio;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    width: json["width"],
    height: json["height"],
    ratio: json["ratio"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "ratio": ratio,
  };
}

class ImageLinks {
  ImageLinks({
    this.delete,
  });

  Delete delete;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    delete: Delete.fromJson(json["delete"]),
  );

  Map<String, dynamic> toJson() => {
    "delete": delete.toJson(),
  };
}

class Delete {
  Delete({
    this.href,
    this.method,
  });

  String href;
  String method;

  factory Delete.fromJson(Map<String, dynamic> json) => Delete(
    href: json["href"],
    method: json["method"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "method": method,
  };
}

class ProductsCategoriesLinks {
  ProductsCategoriesLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory ProductsCategoriesLinks.fromJson(Map<String, dynamic> json) => ProductsCategoriesLinks(
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
