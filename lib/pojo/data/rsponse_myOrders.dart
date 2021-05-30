// To parse this JSON data, do
//
//     final responseMyOrder = responseMyOrderFromJson(jsonString);

import 'dart:convert';

ResponseMyOrder responseMyOrderFromJson(String str) => ResponseMyOrder.fromJson(json.decode(str));

String responseMyOrderToJson(ResponseMyOrder data) => json.encode(data.toJson());

class ResponseMyOrder {
    ResponseMyOrder({
        this.data,
        this.links,
        this.meta,
    });

    List<DataOrder> data;
    ResponseMyOrderLinks links;
    Meta meta;

    factory ResponseMyOrder.fromJson(Map<String, dynamic> json) => ResponseMyOrder(
        data: List<DataOrder>.from(json["data"].map((x) => DataOrder.fromJson(x))),
        links: ResponseMyOrderLinks.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}

class DataOrder {
    DataOrder({
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
    Status status;
    String giftMessage;
    String discount;
    SubTotal subTotal;
    SubTotal total;
    List<ItemElement> items;

    factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
        phone: json["phone"] == null ? null : json["phone"],
        city: json["city"] == null ? null : json["city"],
        area: json["area"] == null ? null : json["area"],
        address: json["address"] == null ? null : json["address"],
        status: statusValues.map[json["status"]],
        giftMessage: json["gift_message"] == null ? null : json["gift_message"],
        discount: json["discount"] == null ? null : json["discount"],
        subTotal: SubTotal.fromJson(json["sub_total"]),
        total: SubTotal.fromJson(json["total"]),
        items: List<ItemElement>.from(json["items"].map((x) => ItemElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : datumNameValues.reverse[name],
        "phone": phone == null ? null : phone,
        "city": city == null ? null : city,
        "area": area == null ? null : area,
        "address": address == null ? null : address,
        "status": statusValues.reverse[status],
        "gift_message": giftMessage == null ? null : giftMessage,
        "discount": discount == null ? null : discount,
        "sub_total": subTotal.toJson(),
        "total": total.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class ItemElement {
    ItemElement({
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
    ItemItem item;

    factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
        id: json["id"],
        orderId: json["order_id"],
        qty: json["qty"],
        price: SubTotal.fromJson(json["price"]),
        total: SubTotal.fromJson(json["total"]),
        item: ItemItem.fromJson(json["item"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "qty": qty,
        "price": price.toJson(),
        "total": total.toJson(),
        "item": item.toJson(),
    };
}

class ItemItem {
    ItemItem({
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
    SubTotal oldPrice;
    bool hasDiscount;
    bool inStock;
    bool exclusive;
    SubTotal discount;
    SubTotal price;
    List<dynamic> sizes;
    List<Image> images;

    factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        id: json["id"],
        name:json["name"],
        description: json["description"] == null ? null : json["description"],
        oldPrice: SubTotal.fromJson(json["old_price"]),
        hasDiscount: json["has_discount"],
        inStock: json["in_stock"],
        exclusive: json["exclusive"],
        discount: SubTotal.fromJson(json["discount"]),
        price: SubTotal.fromJson(json["price"]),
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": itemNameValues.reverse[name],
        "description": description == null ? null : descriptionValues.reverse[description],
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

enum Description { P_CHOCOLATE_BOX_BR_P, P_CHOCOLAT_BR_P }

final descriptionValues = EnumValues({
    "<p>CHOCOLATE BOX<br></p>": Description.P_CHOCOLATE_BOX_BR_P,
    "<p>chocolat<br></p>": Description.P_CHOCOLAT_BR_P
});

class SubTotal {
    SubTotal({
        this.price,
        this.formatted,
    });

    int price;
    String formatted;

    factory SubTotal.fromJson(Map<String, dynamic> json) => SubTotal(
        price: json["price"],
        formatted: json["formatted"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "formatted": formattedValues.reverse[formatted],
    };
}

enum Formatted { THE_0_KWD, THE_5_KWD, THE_10_KWD }

final formattedValues = EnumValues({
    "0 KWD": Formatted.THE_0_KWD,
    "10 KWD": Formatted.THE_10_KWD,
    "5 KWD": Formatted.THE_5_KWD
});

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
    ImageName name;
    FileName fileName;
    Type type;
    MimeType mimeType;
    int size;
    HumanReadableSize humanReadableSize;
    Details details;
    dynamic status;
    Conversions conversions;
    ImageLinks links;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
        preview: json["preview"],
        name: imageNameValues.map[json["name"]],
        fileName: fileNameValues.map[json["file_name"]],
        type: typeValues.map[json["type"]],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        size: json["size"],
        humanReadableSize: humanReadableSizeValues.map[json["human_readable_size"]],
        details: Details.fromJson(json["details"]),
        status: json["status"],
        conversions: Conversions.fromJson(json["conversions"]),
        links: ImageLinks.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "preview": preview,
        "name": imageNameValues.reverse[name],
        "file_name": fileNameValues.reverse[fileName],
        "type": typeValues.reverse[type],
        "mime_type": mimeTypeValues.reverse[mimeType],
        "size": size,
        "human_readable_size": humanReadableSizeValues.reverse[humanReadableSize],
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

enum FileName { WHATSAPP_IMAGE_20210420_AT_11620_PM_JPEG, WHATSAPP_IMAGE_20210420_AT_11621_PM1_JPEG, OM3_PNG, WHATSAPP_IMAGE_20210420_AT_11622_PM_JPEG }

final fileNameValues = EnumValues({
    "om3.png": FileName.OM3_PNG,
    "whatsapp-image-2021-04-20-at-11620-pm.jpeg": FileName.WHATSAPP_IMAGE_20210420_AT_11620_PM_JPEG,
    "whatsapp-image-2021-04-20-at-11621-pm1.jpeg": FileName.WHATSAPP_IMAGE_20210420_AT_11621_PM1_JPEG,
    "whatsapp-image-2021-04-20-at-11622-pm.jpeg": FileName.WHATSAPP_IMAGE_20210420_AT_11622_PM_JPEG
});

enum HumanReadableSize { THE_9674_KB, THE_12684_KB, THE_23808_KB, THE_1028_KB }

final humanReadableSizeValues = EnumValues({
    "102.8 KB": HumanReadableSize.THE_1028_KB,
    "126.84 KB": HumanReadableSize.THE_12684_KB,
    "238.08 KB": HumanReadableSize.THE_23808_KB,
    "96.74 KB": HumanReadableSize.THE_9674_KB
});

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
    Method method;

    factory Delete.fromJson(Map<String, dynamic> json) => Delete(
        href: json["href"],
        method: methodValues.map[json["method"]],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "method": methodValues.reverse[method],
    };
}

enum Method { DELETE }

final methodValues = EnumValues({
    "DELETE": Method.DELETE
});

enum MimeType { IMAGE_JPEG, IMAGE_PNG }

final mimeTypeValues = EnumValues({
    "image/jpeg": MimeType.IMAGE_JPEG,
    "image/png": MimeType.IMAGE_PNG
});

enum ImageName { WHATS_APP_IMAGE_20210420_AT_11620_PM, WHATS_APP_IMAGE_20210420_AT_11621_PM_1, OM3, WHATS_APP_IMAGE_20210420_AT_11622_PM }

final imageNameValues = EnumValues({
    "om3": ImageName.OM3,
    "WhatsApp Image 2021-04-20 at 1.16.20 PM": ImageName.WHATS_APP_IMAGE_20210420_AT_11620_PM,
    "WhatsApp Image 2021-04-20 at 1.16.21 PM(1)": ImageName.WHATS_APP_IMAGE_20210420_AT_11621_PM_1,
    "WhatsApp Image 2021-04-20 at 1.16.22 PM": ImageName.WHATS_APP_IMAGE_20210420_AT_11622_PM
});

enum Type { IMAGE }

final typeValues = EnumValues({
    "image": Type.IMAGE
});

enum ItemName { CHOCOLATE_BOX, CAKE }

final itemNameValues = EnumValues({
    "cake": ItemName.CAKE,
    "CHOCOLATE BOX": ItemName.CHOCOLATE_BOX
});

enum DatumName { ADMIN }

final datumNameValues = EnumValues({
    "Admin": DatumName.ADMIN
});

enum Status { DELIVERED, PENDING, IN_PROGRESS }

final statusValues = EnumValues({
    "delivered": Status.DELIVERED,
    "in-progress": Status.IN_PROGRESS,
    "pending": Status.PENDING
});

class ResponseMyOrderLinks {
    ResponseMyOrderLinks({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    String first;
    String last;
    dynamic prev;
    String next;

    factory ResponseMyOrderLinks.fromJson(Map<String, dynamic> json) => ResponseMyOrderLinks(
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

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
