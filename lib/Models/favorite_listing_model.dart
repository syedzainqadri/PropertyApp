// To parse this JSON data, do
//
//     final favoriteListings = favoriteListingsFromJson(jsonString);

// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

import 'dart:convert';

FavoriteListings favoriteListingsFromJson(String str) =>
    FavoriteListings.fromJson(json.decode(str));

class FavoriteListings {
  FavoriteListings({
    this.data,
    this.pagination,
  });

  var data;
  var pagination;

  factory FavoriteListings.fromJson(Map<String, dynamic> json) =>
      FavoriteListings(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        // pagination: Pagination.fromJson(json["pagination"]),
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

  var listingId;
  var authorId;
  var title;
  var pricingType;
  var price;
  var maxPrice;
  var priceType;
  var priceUnits;
  var priceUnit;
  var categories;
  var adType;
  var status;
  var images;
  var createdAt;
  var createdAtGmt;
  var viewCount;
  var promotions;
  var badges;
  var contact;
  var store;

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
        createdAt: DateTime.parse(json["created_at"]),
        createdAtGmt: DateTime.parse(json["created_at_gmt"]),
        viewCount: json["view_count"],
        promotions: List<String>.from(json["promotions"].map((x) => x)),
        badges: List<String>.from(json["badges"].map((x) => x)),
        contact: Contact.fromJson(json["contact"]),
        store: Store.fromJson(json["store"]),
      );
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

  var termId;
  var name;
  var slug;
  var termGroup;
  var termTaxonomyId;
  var taxonomy;
  var description;
  var parent;
  var count;
  var filter;

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

  var locations;
  var latitude;
  var longitude;
  var hideMap;
  var zipcode;
  var address;
  var phone;
  var whatsappNumber;
  var email;
  var website;
  var geoAddress;

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
        srcsetSizes: json["srcset_sizes"],
      );
}

class Sizes {
  Sizes({
    this.full,
    this.medium,
    this.thumbnail,
  });

  var full;
  var medium;
  var thumbnail;

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

  var src;
  var width;
  var height;

  factory Full.fromJson(Map<String, dynamic> json) => Full(
        src: json["src"],
        width: json["width"],
        height: json["height"],
      );
}

class PriceUnit {
  PriceUnit({
    this.id,
    this.name,
    this.short,
  });

  var id;
  var name;
  var short;

  factory PriceUnit.fromJson(Map<String, dynamic> json) => PriceUnit(
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
        short: shortValues.map[json["short"]],
      );
}

enum Id { YEAR, MONTH, TOTAL }

final idValues =
    EnumValues({"month": Id.MONTH, "total": Id.TOTAL, "year": Id.YEAR});

enum Name { YEAR, MONTH, TOTAL_PRICE }

final nameValues = EnumValues(
    {"Month": Name.MONTH, "Total Price": Name.TOTAL_PRICE, "Year": Name.YEAR});

enum Short { I_I_YR, I_I_MO, I_I_TOTAL }

final shortValues = EnumValues({
  "<i>/</i>mo": Short.I_I_MO,
  "<i>/</i>total": Short.I_I_TOTAL,
  "<i>/</i>yr": Short.I_I_YR
});

class Store {
  Store({
    this.id,
    this.title,
  });

  var id;
  var title;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        title: json["title"],
      );
}

// class Pagination {
//   Pagination({
//     this.total,
//     this.count,
//     this.perPage,
//     this.currentPage,
//     this.totalPages,
//   });

//   var total;
//   var count;
//   var perPage;
//   var currentPage;
//   var totalPages;

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         total: json["total"],
//         count: json["count"],
//         perPage: json["per_page"],
//         currentPage: json["current_page"],
//         totalPages: json["total_pages"],
//       );
// }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
