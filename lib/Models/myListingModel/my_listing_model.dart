// To parse this JSON data, do
//
//     final myListingModel = myListingModelFromJson(jsonString);

import 'dart:convert';

MyListingModel myListingModelFromJson(String str) =>
    MyListingModel.fromJson(json.decode(str));

String myListingModelToJson(MyListingModel data) => json.encode(data.toJson());

class MyListingModel {
  MyListingModel({this.data});

  List<Datum>? data;

  factory MyListingModel.fromJson(Map<String, dynamic> json) => MyListingModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.listingId,
    this.authorId,
    this.title,
    this.pricingType,
    this.price,
    this.maxPrice,
    this.priceType,
    this.priceUnits,
    this.priceUnit,
    this.categories,
    this.adType,
    this.status,
    this.images,
    this.dateCreated,
    this.createdAt,
    this.viewCount,
    this.promotions,
    this.badges,
    this.contact,
    this.store,
    this.renew,
  });

  int? listingId;
  int? authorId;
  String? title;
  String? pricingType;
  String? price;
  String? maxPrice;
  String? priceType;
  List<PriceUnit>? priceUnits;
  String? priceUnit;
  List<Category>? categories;
  String? adType;
  String? status;
  List<Image>? images;
  DateCreated? dateCreated;
  DateTime? createdAt;
  int? viewCount;
  List<dynamic>? promotions;
  List<String>? badges;
  Contact? contact;
  Store? store;
  bool? renew;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        listingId: json["listing_id"],
        authorId: json["author_id"],
        title: json["title"],
        pricingType: json["pricing_type"],
        price: json["price"],
        maxPrice: json["max_price"],
        priceType: json["price_type"],
        priceUnits: List<PriceUnit>.from(
            json["price_units"].map((x) => PriceUnit.fromJson(x))),
        priceUnit: json["price_unit"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        adType: json["ad_type"],
        status: json["status"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        dateCreated: DateCreated.fromJson(json["date_created"]),
        createdAt: DateTime.parse(json["created_at"]),
        viewCount: json["view_count"],
        promotions: List<dynamic>.from(json["promotions"].map((x) => x)),
        badges: List<String>.from(json["badges"].map((x) => x)),
        contact: Contact.fromJson(json["contact"]),
        store: Store.fromJson(json["store"]),
        renew: json["renew"],
      );

  Map<String, dynamic> toJson() => {
        "listing_id": listingId,
        "author_id": authorId,
        "title": title,
        "pricing_type": pricingType,
        "price": price,
        "max_price": maxPrice,
        "price_type": priceType,
        "price_units": List<dynamic>.from(priceUnits!.map((x) => x.toJson())),
        "price_unit": priceUnit,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "ad_type": adType,
        "status": status,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "date_created": dateCreated!.toJson(),
        "created_at": createdAt!.toIso8601String(),
        "view_count": viewCount,
        "promotions": List<dynamic>.from(promotions!.map((x) => x)),
        "badges": List<dynamic>.from(badges!.map((x) => x)),
        "contact": contact!.toJson(),
        "store": store!.toJson(),
        "renew": renew,
      };
}

class Category {
  Category({
    this.termId,
    this.name,
    this.slug,
    this.termGroup,
    this.termTaxonomyId,
    this.taxonomy,
    this.description,
    this.parent,
    this.count,
    this.filter,
  });

  int? termId;
  String? name;
  String? slug;
  int? termGroup;
  int? termTaxonomyId;
  String? taxonomy;
  String? description;
  int? parent;
  int? count;
  String? filter;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        termGroup: json["term_group"],
        termTaxonomyId: json["term_taxonomy_id"],
        taxonomy: json["taxonomy"],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: json["filter"],
      );

  Map<String, dynamic> toJson() => {
        "term_id": termId,
        "name": name,
        "slug": slug,
        "term_group": termGroup,
        "term_taxonomy_id": termTaxonomyId,
        "taxonomy": taxonomy,
        "description": description,
        "parent": parent,
        "count": count,
        "filter": filter,
      };
}

class Contact {
  Contact({
    this.locations,
    this.latitude,
    this.longitude,
    this.hideMap,
    this.zipcode,
    this.address,
    this.phone,
    this.whatsappNumber,
    this.email,
    this.website,
    this.geoAddress,
  });

  List<Category>? locations;
  String? latitude;
  String? longitude;
  bool? hideMap;
  String? zipcode;
  String? address;
  String? phone;
  String? whatsappNumber;
  String? email;
  String? website;
  String? geoAddress;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        locations: List<Category>.from(
            json["locations"].map((x) => Category.fromJson(x))),
        latitude: json["latitude"],
        longitude: json["longitude"],
        hideMap: json["hide_map"],
        zipcode: json["zipcode"],
        address: json["address"],
        phone: json["phone"],
        whatsappNumber: json["whatsapp_number"],
        email: json["email"],
        website: json["website"],
        geoAddress: json["geo_address"],
      );

  Map<String, dynamic> toJson() => {
        "locations": List<dynamic>.from(locations!.map((x) => x.toJson())),
        "latitude": latitude,
        "longitude": longitude,
        "hide_map": hideMap,
        "zipcode": zipcode,
        "address": address,
        "phone": phone,
        "whatsapp_number": whatsappNumber,
        "email": email,
        "website": website,
        "geo_address": geoAddress,
      };
}

class DateCreated {
  DateCreated({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime? date;
  int? timezoneType;
  String? timezone;

  factory DateCreated.fromJson(Map<String, dynamic> json) => DateCreated(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date!.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}

class Image {
  Image({
    this.id,
    this.title,
    this.caption,
    this.url,
    this.alt,
    this.src,
    this.srcset,
    this.sizes,
    this.srcW,
    this.srcH,
    this.srcsetSizes,
  });

  int? id;
  String? title;
  String? caption;
  String? url;
  String? alt;
  String? src;
  bool? srcset;
  Sizes? sizes;
  int? srcW;
  int? srcH;
  String? srcsetSizes;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["ID"],
        title: json["title"],
        caption: json["caption"],
        url: json["url"],
        alt: json["alt"],
        src: json["src"],
        srcset: json["srcset"],
        sizes: Sizes.fromJson(json["sizes"]),
        srcW: json["src_w"],
        srcH: json["src_h"],
        srcsetSizes: json["srcset_sizes"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "title": title,
        "caption": caption,
        "url": url,
        "alt": alt,
        "src": src,
        "srcset": srcset,
        "sizes": sizes!.toJson(),
        "src_w": srcW,
        "src_h": srcH,
        "srcset_sizes": srcsetSizes,
      };
}

class Sizes {
  Sizes({
    this.full,
    this.medium,
    this.thumbnail,
  });

  Full? full;
  Full? medium;
  Full? thumbnail;

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        full: Full.fromJson(json["full"]),
        medium: Full.fromJson(json["medium"]),
        thumbnail: Full.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "full": full!.toJson(),
        "medium": medium!.toJson(),
        "thumbnail": thumbnail!.toJson(),
      };
}

class Full {
  Full({
    this.src,
    this.width,
    this.height,
  });

  String? src;
  int? width;
  int? height;

  factory Full.fromJson(Map<String, dynamic> json) => Full(
        src: json["src"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
        "width": width,
        "height": height,
      };
}

class PriceUnit {
  PriceUnit({
    this.id,
    this.name,
    this.short,
  });

  String? id;
  String? name;
  String? short;

  factory PriceUnit.fromJson(Map<String, dynamic> json) => PriceUnit(
        id: json["id"],
        name: json["name"],
        short: json["short"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short": short,
      };
}

class Store {
  Store({
    this.id,
    this.title,
  });

  int? id;
  String? title;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

// class Pagination {
//   Pagination({
//     this.total,
//     this.count,
//     this.perPage,
//     this.currentPage,
//     this.totalPages,
//   });

//   int? total;
//   int? count;
//   int? perPage;
//   int? currentPage;
//   int? totalPages;

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         total: json["total"] ?? '0',
//         count: json["count"] ?? '0',
//         perPage: json["per_page"],
//         currentPage: json["current_page"],
//         totalPages: json["total_pages"],
//       );

//   Map<String, dynamic> toJson() => {
//         "total": total,
//         "count": count,
//         "per_page": perPage,
//         "current_page": currentPage,
//         "total_pages": totalPages,
//       };
// }
