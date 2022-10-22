// ignore_for_file: file_names, prefer_typing_uninitialized_variables, unnecessary_null_in_if_null_operators

import 'dart:convert';

EditListingModel editListingModelFromJson(String str) =>
    EditListingModel.fromJson(json.decode(str));

String editListingModelToJson(EditListingModel data) =>
    json.encode(data.toJson());

class EditListingModel {
  EditListingModel({
    this.config,
    this.listing,
    this.customFields,
  });

  Config? config;
  Listing? listing;
  List<CustomField>? customFields;

  factory EditListingModel.fromJson(Map<String, dynamic> json) =>
      EditListingModel(
        config: Config.fromJson(json["config"]),
        listing: Listing.fromJson(json["listing"]),
        customFields: List<CustomField>.from(
            json["custom_fields"].map((x) => CustomField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "config": config!.toJson(),
        "listing": listing!.toJson(),
        "custom_fields":
            List<dynamic>.from(customFields!.map((x) => x.toJson())),
      };
}

class Config {
  Config({
    this.bhs,
    this.pricingTypes,
    this.priceTypes,
    this.currency,
    this.currencySymbol,
    this.priceUnits,
    this.hiddenFields,
    this.gallery,
    this.limit,
    this.videoUrls,
  });

  var bhs;
  List<PriceType>? pricingTypes;
  List<PriceType>? priceTypes;
  String? currency;
  String? currencySymbol;
  List<PriceUnit>? priceUnits;
  List<dynamic>? hiddenFields;
  Gallery? gallery;
  Limit? limit;
  bool? videoUrls;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        bhs: json["bhs"],
        pricingTypes: List<PriceType>.from(
            json["pricing_types"].map((x) => PriceType.fromJson(x))),
        priceTypes: List<PriceType>.from(
            json["price_types"].map((x) => PriceType.fromJson(x))),
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        priceUnits: List<PriceUnit>.from(
            json["price_units"].map((x) => PriceUnit.fromJson(x))),
        hiddenFields: List<dynamic>.from(json["hidden_fields"].map((x) => x)),
        gallery: Gallery.fromJson(json["gallery"]),
        limit: Limit.fromJson(json["limit"]),
        videoUrls: json["video_urls"],
      );

  Map<String, dynamic> toJson() => {
        "bhs": bhs,
        "pricing_types":
            List<dynamic>.from(pricingTypes!.map((x) => x.toJson())),
        "price_types": List<dynamic>.from(priceTypes!.map((x) => x.toJson())),
        "currency": currency,
        "currency_symbol": currencySymbol,
        "price_units": List<dynamic>.from(priceUnits!.map((x) => x.toJson())),
        "hidden_fields": List<dynamic>.from(hiddenFields!.map((x) => x)),
        "gallery": gallery!.toJson(),
        "limit": limit!.toJson(),
        "video_urls": videoUrls,
      };
}

class Gallery {
  Gallery({
    this.maxImageLimit,
    this.maxImageSize,
    this.extensions,
    this.imageRequired,
  });

  int? maxImageLimit;
  int? maxImageSize;
  List<String>? extensions;
  bool? imageRequired;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        maxImageLimit: json["max_image_limit"],
        maxImageSize: json["max_image_size"],
        extensions: List<String>.from(json["extensions"].map((x) => x)),
        imageRequired: json["image_required"],
      );

  Map<String, dynamic> toJson() => {
        "max_image_limit": maxImageLimit,
        "max_image_size": maxImageSize,
        "extensions": List<dynamic>.from(extensions!.map((x) => x)),
        "image_required": imageRequired,
      };
}

class Limit {
  Limit({
    this.title,
    this.description,
  });

  dynamic title;
  dynamic description;

  factory Limit.fromJson(Map<String, dynamic> json) => Limit(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class PriceType {
  PriceType({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory PriceType.fromJson(Map<String, dynamic> json) => PriceType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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

class CustomField {
  CustomField({
    this.id,
    this.metaKey,
    this.label,
    this.slug,
    this.description,
    this.searchable,
    this.listable,
    this.type,
    this.required,
    this.placeholder,
    this.value,
    this.icon,
    this.options,
    this.min,
    this.max,
    this.stepSize,
  });

  int? id;
  String? metaKey;
  String? label;
  String? slug;
  String? description;
  String? searchable;
  String? listable;
  String? type;
  bool? required;
  Placeholder? placeholder;
  dynamic value;
  String? icon;
  CustomFieldOptions? options;
  String? min;
  String? max;
  String? stepSize;

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
        placeholder: placeholderValues.map![json["placeholder"]],
        value: json["value"],
        icon: json["icon"],
        options: json["options"] == null
            ? null
            : CustomFieldOptions.fromJson(json["options"]),
        min: json["min"] ?? null,
        max: json["max"] ?? null,
        stepSize: json["step_size"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meta_key": metaKey,
        "label": label,
        "slug": slug,
        "description": description,
        "searchable": searchable,
        "listable": listable,
        "type": type,
        "required": required,
        "placeholder": placeholderValues.reverse[placeholder],
        "value": value,
        "icon": icon,
        "options": options == null ? null : options!.toJson(),
        "min": min ?? null,
        "max": max ?? null,
        "step_size": stepSize ?? null,
      };
}

class CustomFieldOptions {
  CustomFieldOptions({
    this.optionsDefault,
    this.choices,
  });

  dynamic optionsDefault;
  List<Choice>? choices;

  factory CustomFieldOptions.fromJson(Map<String, dynamic> json) =>
      CustomFieldOptions(
        optionsDefault: json["default"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "default": optionsDefault,
        "choices": List<dynamic>.from(choices!.map((x) => x.toJson())),
      };
}

class Choice {
  Choice({
    this.id,
    this.name,
  });

  dynamic id;
  String? name;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

// ignore: constant_identifier_names
enum Placeholder { EMPTY, AREA, LOCATION }

final placeholderValues = EnumValues({
  "Area": Placeholder.AREA,
  "": Placeholder.EMPTY,
  "Location": Placeholder.LOCATION
});

class Listing {
  Listing({
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
    this.url,
    this.description,
    this.isFavourite,
    this.videoUrls,
    this.author,
    this.customFields,
    this.amenities,
    this.related,
    this.review,
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
  DateTime? createdAt;
  String? createdAtGmt;
  int? viewCount;
  List<dynamic>? promotions;
  List<String>? badges;
  Contact? contact;
  Store? store;
  String? url;
  String? description;
  bool? isFavourite;
  List<dynamic>? videoUrls;
  Author? author;
  List<CustomField>? customFields;
  Amenities? amenities;
  List<dynamic>? related;
  Review? review;

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
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
        createdAtGmt: json["created_at_gmt"],
        viewCount: json["view_count"],
        promotions: List<dynamic>.from(json["promotions"].map((x) => x)),
        badges: List<String>.from(json["badges"].map((x) => x)),
        contact: Contact.fromJson(json["contact"]),
        store: Store.fromJson(json["store"]),
        url: json["url"],
        description: json["description"],
        isFavourite: json["is_favourite"],
        videoUrls: List<dynamic>.from(json["video_urls"].map((x) => x)),
        author: Author.fromJson(json["author"]),
        customFields: List<CustomField>.from(
            json["custom_fields"].map((x) => CustomField.fromJson(x))),
        // amenities: Amenities.fromJson(json["amenities"]),
        related: List<dynamic>.from(json["related"].map((x) => x)),
        review: Review.fromJson(json["review"]),
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
        "created_at": createdAt!.toIso8601String(),
        "created_at_gmt": createdAtGmt,
        "view_count": viewCount,
        "promotions": List<dynamic>.from(promotions!.map((x) => x)),
        "badges": List<dynamic>.from(badges!.map((x) => x)),
        "contact": contact!.toJson(),
        "store": store!.toJson(),
        "url": url,
        "description": description,
        "is_favourite": isFavourite,
        "video_urls": List<dynamic>.from(videoUrls!.map((x) => x)),
        "author": author!.toJson(),
        "custom_fields":
            List<dynamic>.from(customFields!.map((x) => x.toJson())),
        "amenities": amenities!.toJson(),
        "related": List<dynamic>.from(related!.map((x) => x)),
        "review": review!.toJson(),
      };
}

class Amenities {
  Amenities({
    this.id,
    this.metaKey,
    this.label,
    this.slug,
    this.description,
    this.searchable,
    this.listable,
    this.type,
    this.required,
    this.placeholder,
    this.value,
    this.icon,
    this.options,
  });

  int? id;
  String? metaKey;
  String? label;
  String? slug;
  String? description;
  String? searchable;
  String? listable;
  String? type;
  bool? required;
  String? placeholder;
  List<String>? value;
  String? icon;
  AmenitiesOptions? options;

  factory Amenities.fromJson(Map<String, dynamic> json) => Amenities(
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
        value: List<String>.from(json["value"].map((x) => x)),
        icon: json["icon"],
        options: AmenitiesOptions.fromJson(json["options"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meta_key": metaKey,
        "label": label,
        "slug": slug,
        "description": description,
        "searchable": searchable,
        "listable": listable,
        "type": type,
        "required": required,
        "placeholder": placeholder,
        "value": List<dynamic>.from(value!.map((x) => x)),
        "icon": icon,
        "options": options!.toJson(),
      };
}

class AmenitiesOptions {
  AmenitiesOptions({
    this.optionsDefault,
    this.choices,
  });

  dynamic optionsDefault;
  List<PriceType>? choices;

  factory AmenitiesOptions.fromJson(Map<String, dynamic> json) =>
      AmenitiesOptions(
        optionsDefault: json["default"],
        choices: List<PriceType>.from(
            json["choices"].map((x) => PriceType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "default": optionsDefault,
        "choices": List<dynamic>.from(choices!.map((x) => x.toJson())),
      };
}

class Author {
  Author({
    this.firstName,
    this.lastName,
    this.description,
    this.id,
    this.isAdmin,
    this.email,
    this.username,
    this.phone,
    this.whatsappNumber,
    this.website,
    this.locations,
    this.zipcode,
    this.address,
    this.latitude,
    this.longitude,
    this.ppThumbUrl,
    this.membership,
    this.store,
  });

  String? firstName;
  String? lastName;
  String? description;
  int? id;
  bool? isAdmin;
  String? email;
  String? username;
  String? phone;
  String? whatsappNumber;
  String? website;
  List<dynamic>? locations;
  String? zipcode;
  String? address;
  String? latitude;
  String? longitude;
  String? ppThumbUrl;
  Membership? membership;
  bool? store;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        firstName: json["first_name"],
        lastName: json["last_name"],
        description: json["description"],
        id: json["id"],
        isAdmin: json["isAdmin"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        whatsappNumber: json["whatsapp_number"],
        website: json["website"],
        locations: List<dynamic>.from(json["locations"].map((x) => x)),
        zipcode: json["zipcode"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        ppThumbUrl: json["pp_thumb_url"],
        membership: Membership.fromJson(json["membership"]),
        store: json["store"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "description": description,
        "id": id,
        "isAdmin": isAdmin,
        "email": email,
        "username": username,
        "phone": phone,
        "whatsapp_number": whatsappNumber,
        "website": website,
        "locations": List<dynamic>.from(locations!.map((x) => x)),
        "zipcode": zipcode,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "pp_thumb_url": ppThumbUrl,
        "membership": membership!.toJson(),
        "store": store,
      };
}

class Membership {
  Membership({
    this.isExpired,
    this.expiredAt,
    this.remainingAds,
    this.postedAds,
    this.promotions,
  });

  bool? isExpired;
  DateTime? expiredAt;
  String? remainingAds;
  String? postedAds;
  Promotions? promotions;

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        isExpired: json["is_expired"],
        expiredAt: DateTime.parse(json["expired_at"]),
        remainingAds: json["remaining_ads"],
        postedAds: json["posted_ads"],
        promotions: Promotions.fromJson(json["promotions"]),
      );

  Map<String, dynamic> toJson() => {
        "is_expired": isExpired,
        "expired_at": expiredAt!.toIso8601String(),
        "remaining_ads": remainingAds,
        "posted_ads": postedAds,
        "promotions": promotions!.toJson(),
      };
}

class Promotions {
  Promotions({
    this.featured,
    this.top,
    this.bumpUp,
  });

  BumpUp? featured;
  BumpUp? top;
  BumpUp? bumpUp;

  factory Promotions.fromJson(Map<String, dynamic> json) => Promotions(
        featured: BumpUp.fromJson(json["featured"]),
        top: BumpUp.fromJson(json["_top"]),
        bumpUp: BumpUp.fromJson(json["_bump_up"]),
      );

  Map<String, dynamic> toJson() => {
        "featured": featured!.toJson(),
        "_top": top!.toJson(),
        "_bump_up": bumpUp!.toJson(),
      };
}

class BumpUp {
  BumpUp({
    this.ads,
    this.validate,
  });

  int? ads;
  int? validate;

  factory BumpUp.fromJson(Map<String, dynamic> json) => BumpUp(
        ads: json["ads"],
        validate: json["validate"],
      );

  Map<String, dynamic> toJson() => {
        "ads": ads,
        "validate": validate,
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
    // this.locations,
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

  // List<Locations>? locations;
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
        // locations: List<Locations>.from(
        // json["locations"].map((x) => Category.fromJson(x))),
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
        // "locations": List<dynamic>.from(locations!.map((x) => x)),
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

class Review {
  Review({
    this.rating,
  });

  Rating? rating;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating!.toJson(),
      };
}

class Rating {
  Rating({
    this.average,
    this.count,
  });

  String? average;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "average": average,
        "count": count,
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

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
