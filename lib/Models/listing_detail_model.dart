import 'dart:convert';

ListingDetail listingDetailFromJson(String str) =>
    ListingDetail.fromJson(json.decode(str));

class ListingDetail {
  ListingDetail({
    required this.listingId,
    required this.authorId,
    required this.title,
    required this.pricingType,
    required this.price,
    required this.maxPrice,
    required this.priceType,
    required this.priceUnits,
    required this.priceUnit,
    required this.categories,
    required this.adType,
    required this.status,
    required this.images,
    required this.createdAt,
    required this.createdAtGmt,
    required this.viewCount,
    required this.promotions,
    required this.badges,
    required this.contact,
    required this.store,
    required this.url,
    required this.description,
    required this.videoUrls,
    required this.author,
    required this.customFields,
    required this.related,
    required this.review,
  });

  int listingId;
  int authorId;
  String title;
  String pricingType;
  String price;
  String maxPrice;
  String priceType;
  List<dynamic> priceUnits;
  String priceUnit;
  List<Category> categories;
  String adType;
  String status;
  List<Image> images;
  DateTime createdAt;
  DateTime createdAtGmt;
  int viewCount;
  List<String> promotions;
  List<String> badges;
  Contact contact;
  Store store;
  String url;
  String description;
  List<String> videoUrls;
  List<dynamic> author;
  List<CustomField> customFields;
  List<Related> related;
  Review review;

  factory ListingDetail.fromJson(Map<String, dynamic> json) => ListingDetail(
        listingId: json["listing_id"],
        authorId: json["author_id"],
        title: json["title"],
        pricingType: json["pricing_type"],
        price: json["price"],
        maxPrice: json["max_price"],
        priceType: json["price_type"],
        priceUnits: List<dynamic>.from(json["price_units"].map((x) => x)),
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
        url: json["url"],
        description: json["description"],
        videoUrls: List<String>.from(json["video_urls"].map((x) => x)),
        author: List<dynamic>.from(json["author"].map((x) => x)),
        customFields: List<CustomField>.from(
            json["custom_fields"].map((x) => CustomField.fromJson(x))),
        related:
            List<Related>.from(json["related"].map((x) => Related.fromJson(x))),
        review: Review.fromJson(json["review"]),
      );
}

class Category {
  Category({
    required this.termId,
    required this.name,
    required this.slug,
    required this.termGroup,
    required this.termTaxonomyId,
    required this.taxonomy,
    required this.description,
    required this.parent,
    required this.count,
    required this.filter,
  });

  int termId;
  String name;
  String slug;
  int termGroup;
  int termTaxonomyId;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;

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
}

class Contact {
  Contact({
    required this.locations,
    required this.latitude,
    required this.longitude,
    required this.hideMap,
    required this.zipcode,
    required this.address,
    required this.phone,
    required this.whatsappNumber,
    required this.email,
    required this.website,
    required this.geoAddress,
  });

  List<Category> locations;
  String latitude;
  String longitude;
  bool hideMap;
  String zipcode;
  String address;
  String phone;
  String whatsappNumber;
  String email;
  String website;
  String geoAddress;

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

class CustomField {
  CustomField({
    required this.id,
    required this.metaKey,
    required this.label,
    required this.slug,
    required this.description,
    required this.searchable,
    required this.listable,
    required this.type,
    required this.required,
    required this.placeholder,
    required this.value,
  });

  int id;
  String metaKey;
  String label;
  String slug;
  String description;
  String searchable;
  String listable;
  String type;
  bool required;
  String placeholder;
  dynamic value;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        id: json["id"],
        metaKey: json["meta_key"],
        label: json["label"],
        slug: json["slug"],
        description: json["description"],
        searchable: json["searchable"],
        listable: json["listable"],
        type: json["type"],
        required: json["required"],
        placeholder: json["placeholder"],
        value: json["value"],
      );
}

class Options {
  Options({
    required this.optionsDefault,
    required this.choices,
  });

  dynamic optionsDefault;
  List<Choice> choices;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        optionsDefault: json["default"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );
}

class Choice {
  Choice({
    required this.id,
    required this.name,
  });

  dynamic id;
  String name;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        name: json["name"],
      );
}

class Image {
  Image({
    required this.id,
    required this.title,
    required this.caption,
    required this.url,
    required this.alt,
    required this.src,
    required this.srcset,
    required this.sizes,
    required this.srcW,
    required this.srcH,
  });

  int id;
  String title;
  String caption;
  String url;
  String alt;
  String src;
  bool srcset;
  Sizes sizes;
  int srcW;
  int srcH;

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
      );
}

class Sizes {
  Sizes({
    required this.full,
    required this.medium,
    required this.thumbnail,
  });

  Full full;
  Full medium;
  Full thumbnail;

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        full: Full.fromJson(json["full"]),
        medium: Full.fromJson(json["medium"]),
        thumbnail: Full.fromJson(json["thumbnail"]),
      );
}

class Full {
  Full({
    required this.src,
    required this.width,
    required this.height,
  });

  String src;
  int width;
  int height;

  factory Full.fromJson(Map<String, dynamic> json) => Full(
        src: json["src"],
        width: json["width"],
        height: json["height"],
      );
}

class Related {
  Related({
    required this.listingId,
    required this.authorId,
    required this.title,
    required this.pricingType,
    required this.price,
    required this.maxPrice,
    required this.priceType,
    required this.priceUnits,
    required this.priceUnit,
    required this.categories,
    required this.adType,
    required this.status,
    required this.images,
    required this.createdAt,
    required this.createdAtGmt,
    required this.viewCount,
    required this.promotions,
    required this.badges,
    required this.contact,
    required this.store,
  });

  int listingId;
  int authorId;
  String title;
  String pricingType;
  String price;
  String maxPrice;
  String priceType;
  List<dynamic> priceUnits;
  String priceUnit;
  List<Category> categories;
  String adType;
  String status;
  List<Image> images;
  DateTime createdAt;
  DateTime createdAtGmt;
  int viewCount;
  List<String> promotions;
  List<String> badges;
  Contact contact;
  Store store;

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        listingId: json["listing_id"],
        authorId: json["author_id"],
        title: json["title"],
        pricingType: json["pricing_type"],
        price: json["price"],
        maxPrice: json["max_price"],
        priceType: json["price_type"],
        priceUnits: List<dynamic>.from(json["price_units"].map((x) => x)),
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

class Store {
  Store({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        title: json["title"],
      );
}

class Review {
  Review({
    required this.rating,
  });

  Rating rating;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: Rating.fromJson(json["rating"]),
      );
}

class Rating {
  Rating({
    required this.average,
    required this.count,
  });

  String average;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"],
        count: json["count"],
      );
}
