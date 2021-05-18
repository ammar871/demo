

import 'dart:convert';

ResponseWishList responseWishListFromJson(String str) => ResponseWishList.fromJson(json.decode(str));

String responseWishListToJson(ResponseWishList data) => json.encode(data.toJson());

class ResponseWishList {
    ResponseWishList({
        this.data,
    });

    List<DataWishList> data;

    factory ResponseWishList.fromJson(Map<String, dynamic> json) => ResponseWishList(
        data: List<DataWishList>.from(json["data"].map((x) => DataWishList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataWishList {
    DataWishList({
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
    List<Image> images;

    factory DataWishList.fromJson(Map<String, dynamic> json) => DataWishList(
        id: json["id"],
        name: json["name"],
        description: json["description"] == null ? null : json["description"],
        oldPrice: Discount.fromJson(json["old_price"]),
        hasDiscount: json["has_discount"],
        inStock: json["in_stock"],
        exclusive: json["exclusive"],
        discount: Discount.fromJson(json["discount"]),
        price: Discount.fromJson(json["price"]),
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description == null ? null : description,
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

class Image {
    Image({
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
    Links links;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
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
        links: Links.fromJson(json["links"]),
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

class Links {
    Links({
        this.delete,
    });

    Delete delete;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
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
