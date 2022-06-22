import 'dart:convert';

import 'package:get/get.dart';

AllListings allListingsFromJson(String str) =>
    AllListings.fromJson(json.decode(str));

class AllListings {
  AllListings({
    this.data,
    this.pagination,
  });

  List<Datum>? data;
  Pagination? pagination;

  factory AllListings.fromJson(Map<String, dynamic> json) => AllListings(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );
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
    this.createdAt,
    this.createdAtGmt,
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
  DateTime? createdAt;
  DateTime? createdAtGmt;
  int? viewCount;
  List<Promotion>? promotions;
  List<String>? badges;
  Contact? contact;
  Store? store;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        listingId: json["listing_id"],
        authorId: json["author_id"],
        title: json["title"],
        pricingType: pricingTypeValues.map![json["pricing_type"]],
        price: json["price"],
        maxPrice: json["max_price"],
        priceType: priceTypeValues.map![json["price_type"]],
        priceUnits: List<PriceUnitElement>.from(
            json["price_units"].map((x) => PriceUnitElement.fromJson(x))),
        priceUnit: priceUnitEnumValues.map![json["price_unit"]],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        adType: adTypeValues.map![json["ad_type"]],
        status: statusValues.map![json["status"]],
        images:
            RxList<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        createdAtGmt: DateTime.parse(json["created_at_gmt"]),
        viewCount: json["view_count"],
        promotions: List<Promotion>.from(
            json["promotions"].map((x) => promotionValues.map![x])),
        badges: List<String>.from(json["badges"].map((x) => x)),
        contact: Contact.fromJson(json["contact"]),
        store: Store.fromJson(json["store"]),
      );
}

enum AdType { RENT, SELL, BUY }

final adTypeValues =
    EnumValues({"buy": AdType.BUY, "rent": AdType.RENT, "sell": AdType.SELL});

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
        taxonomy: taxonomyValues.map![json["taxonomy"]],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: filterValues.map![json["filter"]],
      );
}

class Locations {
  Locations({
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

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        termGroup: json["term_group"],
        termTaxonomyId: json["term_taxonomy_id"],
        taxonomy: taxonomyValues.map![json["taxonomy"]],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: filterValues.map![json["filter"]],
      );
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

  List<Locations>? locations;
  String? latitude;
  String? longitude;
  bool? hideMap;
  String? zipcode;
  String? address;
  String? phone;
  WhatsappNumber? whatsappNumber;
  String? email;
  String? website;
  String? geoAddress;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        locations: List<Locations>.from(
            json["locations"].map((x) => Locations.fromJson(x))),
        latitude: json["latitude"],
        longitude: json["longitude"],
        hideMap: json["hide_map"],
        zipcode: json["zipcode"],
        address: json["address"],
        phone: json["phone"],
        whatsappNumber: whatsappNumberValues.map![json["whatsapp_number"]],
        email: json["email"],
        website: json["website"],
        geoAddress: json["geo_address"],
      );
}

enum WhatsappNumber { EMPTY, THE_5454545454 }

final whatsappNumberValues = EnumValues(
    {"": WhatsappNumber.EMPTY, "5454545454": WhatsappNumber.THE_5454545454});

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

  var id;
  var title;
  var caption;
  var url;
  var alt;
  var src;
  var srcset;
  var sizes;
  var srcW;
  var srcH;
  var srcsetSizes;

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
        srcsetSizes: srcsetSizesValues.map![json["srcset_sizes"]],
      );
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
}

enum SrcsetSizes {
  MAX_WIDTH_1240_PX_100_VW_1240_PX,
  MAX_WIDTH_1170_PX_100_VW_1170_PX,
  MAX_WIDTH_612_PX_100_VW_612_PX,
  MAX_WIDTH_509_PX_100_VW_509_PX,
  MAX_WIDTH_1600_PX_100_VW_1600_PX,
  MAX_WIDTH_1920_PX_100_VW_1920_PX
}

final srcsetSizesValues = EnumValues({
  "(max-width: 1170px) 100vw, 1170px":
      SrcsetSizes.MAX_WIDTH_1170_PX_100_VW_1170_PX,
  "(max-width: 1240px) 100vw, 1240px":
      SrcsetSizes.MAX_WIDTH_1240_PX_100_VW_1240_PX,
  "(max-width: 1600px) 100vw, 1600px":
      SrcsetSizes.MAX_WIDTH_1600_PX_100_VW_1600_PX,
  "(max-width: 1920px) 100vw, 1920px":
      SrcsetSizes.MAX_WIDTH_1920_PX_100_VW_1920_PX,
  "(max-width: 509px) 100vw, 509px": SrcsetSizes.MAX_WIDTH_509_PX_100_VW_509_PX,
  "(max-width: 612px) 100vw, 612px": SrcsetSizes.MAX_WIDTH_612_PX_100_VW_612_PX
});

enum PriceType { FIXED }

final priceTypeValues = EnumValues({"fixed": PriceType.FIXED});

enum PriceUnitEnum { MONTH, EMPTY, TOTAL, YEAR }

final priceUnitEnumValues = EnumValues({
  "": PriceUnitEnum.EMPTY,
  "month": PriceUnitEnum.MONTH,
  "total": PriceUnitEnum.TOTAL,
  "year": PriceUnitEnum.YEAR
});

class PriceUnitElement {
  PriceUnitElement({
    this.name,
    this.short,
  });

  Name? name;
  Short? short;

  factory PriceUnitElement.fromJson(Map<String, dynamic> json) =>
      PriceUnitElement(
        name: nameValues.map![json["name"]],
        short: shortValues.map![json["short"]],
      );
}

enum Name { YEAR, MONTH, TOTAL_PRICE }

final nameValues = EnumValues(
    {"Month": Name.MONTH, "Total Price": Name.TOTAL_PRICE, "Year": Name.YEAR});

enum Short { I_I_YR, I_I_MO, I_I_TOTAL }

final shortValues = EnumValues({
  "<i>/</i>mo": Short.I_I_MO,
  "<i>/</i>total": Short.I_I_TOTAL,
  "<i>/</i>yr": Short.I_I_YR
});

enum PricingType { RANGE, PRICE }

final pricingTypeValues =
    EnumValues({"price": PricingType.PRICE, "range": PricingType.RANGE});

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
        title: titleValues.map![json["title"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse![title],
      };
}

enum Title { SUNSHINE, MY_STORE, MARK_STREET }

final titleValues = EnumValues({
  "Mark Street": Title.MARK_STREET,
  "My Store": Title.MY_STORE,
  "Sunshine": Title.SUNSHINE
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
      // total: json["total"],
      // count: json["count"],
      // perPage: json["per_page"],
      // currentPage: json["current_page"],
      // totalPages: json["total_pages"],
      );
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
