// To parse this JSON data, do
//
//     final alllistings = alllistingsFromJson(jsonString);

import 'dart:convert';

Alllistings alllistingsFromJson(String str) =>
    Alllistings.fromJson(json.decode(str));

String alllistingsToJson(Alllistings data) => json.encode(data.toJson());

class Alllistings {
  Alllistings({
    this.data,
    this.pagination,
  });

  List<Datum>? data;
  Pagination? pagination;

  factory Alllistings.fromJson(Map<String, dynamic> json) => Alllistings(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
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
  });

  int? listingId;
  int? authorId;
  String? title;
  PricingType? pricingType;
  String? price;
  String? maxPrice;
  PriceType? priceType;
  List<PriceUnitElement>? priceUnits;
  PriceUnitEnum? priceUnit;
  List<Category>? categories;
  AdType? adType;
  Status? status;
  List<Image>? images;
  DateCreated? dateCreated;
  DateTime? createdAt;
  int? viewCount;
  List<Promotion>? promotions;
  List<Badge>? badges;
  Contact? contact;
  Store? store;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        listingId: json["listing_id"],
        authorId: json["author_id"],
        title: json["title"],
        pricingType: pricingTypeValues.map[json["pricing_type"]],
        price: json["price"],
        maxPrice: json["max_price"],
        priceType: priceTypeValues.map[json["price_type"]],
        priceUnits: List<PriceUnitElement>.from(
            json["price_units"].map((x) => PriceUnitElement.fromJson(x))),
        priceUnit: priceUnitEnumValues.map[json["price_unit"]],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        adType: adTypeValues.map[json["ad_type"]],
        status: statusValues.map[json["status"]],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        dateCreated: DateCreated.fromJson(json["date_created"]),
        createdAt: DateTime.parse(json["created_at"]),
        viewCount: json["view_count"],
        promotions: List<Promotion>.from(
            json["promotions"].map((x) => promotionValues.map[x])),
        badges: List<Badge>.from(json["badges"].map((x) => badgeValues.map[x])),
        contact: Contact.fromJson(json["contact"]),
        store: Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "listing_id": listingId,
        "author_id": authorId,
        "title": title,
        "pricing_type": pricingTypeValues.reverse[pricingType],
        "price": price,
        "max_price": maxPrice,
        "price_type": priceTypeValues.reverse[priceType],
        "price_units": List<dynamic>.from(priceUnits!.map((x) => x.toJson())),
        "price_unit": priceUnitEnumValues.reverse[priceUnit],
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "ad_type": adTypeValues.reverse[adType],
        "status": statusValues.reverse[status],
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "date_created": dateCreated!.toJson(),
        "created_at": createdAt!.toIso8601String(),
        "view_count": viewCount,
        "promotions": List<dynamic>.from(
            promotions!.map((x) => promotionValues.reverse[x])),
        "badges":
            List<dynamic>.from(badges!.map((x) => badgeValues.reverse[x])),
        "contact": contact!.toJson(),
        "store": store!.toJson(),
      };
}

enum AdType { SELL, SHORTLET }

final adTypeValues =
    EnumValues({"sell": AdType.SELL, "shortlet": AdType.SHORTLET});

enum Badge {
  IS_FEATURED,
  IS_SELL,
  IS_TOP,
  AS_TOP,
  IS_BUMP_UP,
  IS_NEW,
  NEW,
  IS_SHORTLET
}

final badgeValues = EnumValues({
  "as-top": Badge.AS_TOP,
  "is-bump-up": Badge.IS_BUMP_UP,
  "is-featured": Badge.IS_FEATURED,
  "is-new": Badge.IS_NEW,
  "is-sell": Badge.IS_SELL,
  "is-shortlet": Badge.IS_SHORTLET,
  "is-top": Badge.IS_TOP,
  "new": Badge.NEW
});

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
  Taxonomy? taxonomy;
  String? description;
  int? parent;
  int? count;
  Filter? filter;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        termGroup: json["term_group"],
        termTaxonomyId: json["term_taxonomy_id"],
        taxonomy: taxonomyValues.map[json["taxonomy"]],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: filterValues.map[json["filter"]],
      );

  Map<String, dynamic> toJson() => {
        "term_id": termId,
        "name": name,
        "slug": slug,
        "term_group": termGroup,
        "term_taxonomy_id": termTaxonomyId,
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "description": description,
        "parent": parent,
        "count": count,
        "filter": filterValues.reverse[filter],
      };
}

enum Filter { RAW }

final filterValues = EnumValues({"raw": Filter.RAW});

enum Taxonomy { RTCL_CATEGORY, RTCL_LOCATION }

final taxonomyValues = EnumValues({
  "rtcl_category": Taxonomy.RTCL_CATEGORY,
  "rtcl_location": Taxonomy.RTCL_LOCATION
});

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
  Latitude? latitude;
  Longitude? longitude;
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
        latitude: latitudeValues.map[json["latitude"]],
        longitude: longitudeValues.map[json["longitude"]],
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
        "latitude": latitudeValues.reverse[latitude],
        "longitude": longitudeValues.reverse[longitude],
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

enum Latitude { THE_90195845, THE_90537067, THE_64711251, THE_90643305, EMPTY }

final latitudeValues = EnumValues({
  "": Latitude.EMPTY,
  "6.4711251": Latitude.THE_64711251,
  "9.0195845": Latitude.THE_90195845,
  "9.0537067": Latitude.THE_90537067,
  "9.0643305": Latitude.THE_90643305
});

enum Longitude {
  THE_7477944431815214,
  THE_74883504,
  THE_38147502006869445,
  THE_74892974,
  EMPTY
}

final longitudeValues = EnumValues({
  "": Longitude.EMPTY,
  "3.8147502006869445": Longitude.THE_38147502006869445,
  "7.477944431815214": Longitude.THE_7477944431815214,
  "7.4883504": Longitude.THE_74883504,
  "7.4892974": Longitude.THE_74892974
});

class DateCreated {
  DateCreated({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime? date;
  int? timezoneType;
  Timezone? timezone;

  factory DateCreated.fromJson(Map<String, dynamic> json) => DateCreated(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: timezoneValues.map[json["timezone"]],
      );

  Map<String, dynamic> toJson() => {
        "date": date!.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezoneValues.reverse[timezone],
      };
}

enum Timezone { THE_0000 }

final timezoneValues = EnumValues({"+00:00": Timezone.THE_0000});

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
  SrcsetSizes? srcsetSizes;

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
        srcsetSizes: srcsetSizesValues.map[json["srcset_sizes"]],
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
        "srcset_sizes": srcsetSizesValues.reverse[srcsetSizes],
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

enum SrcsetSizes {
  MAX_WIDTH_750_PX_100_VW_750_PX,
  MAX_WIDTH_800_PX_100_VW_800_PX,
  MAX_WIDTH_768_PX_100_VW_768_PX,
  MAX_WIDTH_1024_PX_100_VW_1024_PX,
  MAX_WIDTH_1080_PX_100_VW_1080_PX,
  MAX_WIDTH_640_PX_100_VW_640_PX,
  MAX_WIDTH_690_PX_100_VW_690_PX,
  MAX_WIDTH_600_PX_100_VW_600_PX,
  MAX_WIDTH_500_PX_100_VW_500_PX
}

final srcsetSizesValues = EnumValues({
  "(max-width: 1024px) 100vw, 1024px":
      SrcsetSizes.MAX_WIDTH_1024_PX_100_VW_1024_PX,
  "(max-width: 1080px) 100vw, 1080px":
      SrcsetSizes.MAX_WIDTH_1080_PX_100_VW_1080_PX,
  "(max-width: 500px) 100vw, 500px": SrcsetSizes.MAX_WIDTH_500_PX_100_VW_500_PX,
  "(max-width: 600px) 100vw, 600px": SrcsetSizes.MAX_WIDTH_600_PX_100_VW_600_PX,
  "(max-width: 640px) 100vw, 640px": SrcsetSizes.MAX_WIDTH_640_PX_100_VW_640_PX,
  "(max-width: 690px) 100vw, 690px": SrcsetSizes.MAX_WIDTH_690_PX_100_VW_690_PX,
  "(max-width: 750px) 100vw, 750px": SrcsetSizes.MAX_WIDTH_750_PX_100_VW_750_PX,
  "(max-width: 768px) 100vw, 768px": SrcsetSizes.MAX_WIDTH_768_PX_100_VW_768_PX,
  "(max-width: 800px) 100vw, 800px": SrcsetSizes.MAX_WIDTH_800_PX_100_VW_800_PX
});

enum PriceType { FIXED }

final priceTypeValues = EnumValues({"fixed": PriceType.FIXED});

enum PriceUnitEnum { EMPTY, TOTAL }

final priceUnitEnumValues =
    EnumValues({"": PriceUnitEnum.EMPTY, "total": PriceUnitEnum.TOTAL});

class PriceUnitElement {
  PriceUnitElement({
    this.id,
    this.name,
    this.short,
  });

  String? id;
  String? name;
  String? short;

  factory PriceUnitElement.fromJson(Map<String, dynamic> json) =>
      PriceUnitElement(
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

enum PricingType { PRICE }

final pricingTypeValues = EnumValues({"price": PricingType.PRICE});

enum Promotion { FEATURED, TOP, BUMP_UP }

final promotionValues = EnumValues({
  "_bump_up": Promotion.BUMP_UP,
  "featured": Promotion.FEATURED,
  "_top": Promotion.TOP
});

enum Status { PUBLISH }

final statusValues = EnumValues({"publish": Status.PUBLISH});

class Store {
  Store({
    this.id,
    this.title,
  });

  int? id;
  Title? title;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        title: titleValues.map[json["title"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
      };
}

enum Title { DEEPSPRINGS, BLUE, SUPERITE, EDGELINE, CHRISTIANREALTOR }

final titleValues = EnumValues({
  "blue": Title.BLUE,
  "christianrealtor": Title.CHRISTIANREALTOR,
  "deepsprings": Title.DEEPSPRINGS,
  "edgeline": Title.EDGELINE,
  "superite": Title.SUPERITE
});

class Pagination {
  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
