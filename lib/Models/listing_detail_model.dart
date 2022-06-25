// To parse this JSON data, do
//
//     final listingsByIdModel = listingsByIdModelFromJson(jsonString);

import 'dart:convert';

import 'package:get_storage/get_storage.dart';

ListingsByIdModel listingsByIdModelFromJson(String str) =>
    ListingsByIdModel.fromJson(json.decode(str));

String listingsByIdModelToJson(ListingsByIdModel data) =>
    json.encode(data.toJson());

class ListingsByIdModel {
  ListingsByIdModel({
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
    this.videoUrls,
    this.author,
    this.customFields,
    this.amenities,
    this.related,
    this.review,
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
  var url;
  var description;
  var videoUrls;
  var author;
  var customFields;
  var amenities;
  var related;
  var review;

  factory ListingsByIdModel.fromJson(Map<String, dynamic> json) =>
      ListingsByIdModel(
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
        promotions: List<dynamic>.from(json["promotions"].map((x) => x)),
        badges: List<String>.from(json["badges"].map((x) => x)),
        contact: Contact.fromJson(json["contact"]),
        store: Store.fromJson(json["store"]),
        url: json["url"],
        description: json["description"],
        videoUrls: List<dynamic>.from(json["video_urls"].map((x) => x)),
        author: Author.fromJson(json["author"]),
        customFields: List<CustomField>.from(
            json["custom_fields"].map((x) => CustomField.fromJson(x))),
        amenities: Amenities.fromJson(json["amenities"]),
        related:
            List<Related>.from(json["related"].map((x) => Related.fromJson(x))),
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
        "price_units": List<dynamic>.from(priceUnits.map((x) => x.toJson())),
        "price_unit": priceUnit,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "ad_type": adType,
        "status": status,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "created_at_gmt": createdAtGmt.toIso8601String(),
        "view_count": viewCount,
        "promotions": List<dynamic>.from(promotions.map((x) => x)),
        "badges": List<dynamic>.from(badges.map((x) => x)),
        "contact": contact.toJson(),
        "store": store.toJson(),
        "url": url,
        "description": description,
        "video_urls": List<dynamic>.from(videoUrls.map((x) => x)),
        "author": author.toJson(),
        "custom_fields":
            List<dynamic>.from(customFields.map((x) => x.toJson())),
        "amenities": amenities.toJson(),
        "related": List<dynamic>.from(related.map((x) => x.toJson())),
        "review": review.toJson(),
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

  var id;
  var metaKey;
  var label;
  var slug;
  var description;
  var searchable;
  var listable;
  var type;
  var required;
  var placeholder;
  var value;
  var icon;
  var options;

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
        "value": List<dynamic>.from(value.map((x) => x)),
        "icon": icon,
        "options": options.toJson(),
      };
}

class AmenitiesOptions {
  AmenitiesOptions({
    this.optionsDefault,
    this.choices,
  });

  var optionsDefault;
  var choices;

  factory AmenitiesOptions.fromJson(Map<String, dynamic> json) =>
      AmenitiesOptions(
        optionsDefault: json["default"],
        choices: List<PurpleChoice>.from(
            json["choices"].map((x) => PurpleChoice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "default": optionsDefault,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
      };
}

class PurpleChoice {
  PurpleChoice({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory PurpleChoice.fromJson(Map<String, dynamic> json) => PurpleChoice(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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

  var firstName;
  var lastName;
  var description;
  var id;
  var isAdmin;
  var email;
  var username;
  var phone;
  var whatsappNumber;
  var website;
  var locations;
  var zipcode;
  var address;
  var latitude;
  var longitude;
  var ppThumbUrl;
  var membership;
  var store;

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
        "locations": List<dynamic>.from(locations.map((x) => x)),
        "zipcode": zipcode,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "pp_thumb_url": ppThumbUrl,
        "membership": membership.toJson(),
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

  var isExpired;
  var expiredAt;
  var remainingAds;
  var postedAds;
  var promotions;

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        isExpired: json["is_expired"],
        expiredAt: DateTime.parse(json["expired_at"]),
        remainingAds: json["remaining_ads"],
        postedAds: json["posted_ads"],
        promotions: Promotions.fromJson(json["promotions"]),
      );

  Map<String, dynamic> toJson() => {
        "is_expired": isExpired,
        "expired_at": expiredAt.toIso8601String(),
        "remaining_ads": remainingAds,
        "posted_ads": postedAds,
        "promotions": promotions.toJson(),
      };
}

class Promotions {
  Promotions({
    this.featured,
    this.top,
    this.bumpUp,
  });

  var featured;
  var top;
  var bumpUp;

  factory Promotions.fromJson(Map<String, dynamic> json) => Promotions(
        featured: BumpUp.fromJson(json["featured"]),
        top: BumpUp.fromJson(json["_top"]),
        bumpUp: BumpUp.fromJson(json["_bump_up"]),
      );

  Map<String, dynamic> toJson() => {
        "featured": featured.toJson(),
        "_top": top.toJson(),
        "_bump_up": bumpUp.toJson(),
      };
}

class BumpUp {
  BumpUp({
    this.ads,
    this.validate,
  });

  var ads;
  var validate;

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

  Map<String, dynamic> toJson() => {
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
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

  var id;
  var metaKey;
  var label;
  var slug;
  var description;
  var searchable;
  var listable;
  var type;
  var required;
  var placeholder;
  var value;
  var icon;
  var options;
  var min;
  var max;
  var stepSize;

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
        icon: json["icon"],
        options: json["options"] == null
            ? null
            : CustomFieldOptions.fromJson(json["options"]),
        min: json["min"] == null ? null : json["min"],
        max: json["max"] == null ? null : json["max"],
        stepSize: json["step_size"] == null ? null : json["step_size"],
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
        "value": value,
        "icon": icon,
        "options": options == null ? null : options.toJson(),
        "min": min == null ? null : min,
        "max": max == null ? null : max,
        "step_size": stepSize == null ? null : stepSize,
      };
}

class CustomFieldOptions {
  CustomFieldOptions({
    this.optionsDefault,
    this.choices,
  });

  var optionsDefault;
  var choices;

  factory CustomFieldOptions.fromJson(Map<String, dynamic> json) =>
      CustomFieldOptions(
        optionsDefault: json["default"],
        choices: List<FluffyChoice>.from(
            json["choices"].map((x) => FluffyChoice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "default": optionsDefault,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
      };
}

class FluffyChoice {
  FluffyChoice({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory FluffyChoice.fromJson(Map<String, dynamic> json) => FluffyChoice(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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

  Map<String, dynamic> toJson() => {
        "ID": id,
        "title": title,
        "caption": caption,
        "url": url,
        "alt": alt,
        "src": src,
        "srcset": srcset,
        "sizes": sizes.toJson(),
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

  var full;
  var medium;
  var thumbnail;

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        full: Full.fromJson(json["full"]),
        medium: Full.fromJson(json["medium"]),
        thumbnail: Full.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "full": full.toJson(),
        "medium": medium.toJson(),
        "thumbnail": thumbnail.toJson(),
      };
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

  var id;
  var name;
  var short;

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

class Related {
  Related({
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

  factory Related.fromJson(Map<String, dynamic> json) => Related(
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
        promotions: List<dynamic>.from(json["promotions"].map((x) => x)),
        badges: List<String>.from(json["badges"].map((x) => x)),
        contact: Contact.fromJson(json["contact"]),
        store: Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "listing_id": listingId,
        "author_id": authorId,
        "title": title,
        "pricing_type": pricingType,
        "price": price,
        "max_price": maxPrice,
        "price_type": priceType,
        "price_units": List<dynamic>.from(priceUnits.map((x) => x.toJson())),
        "price_unit": priceUnit,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "ad_type": adType,
        "status": status,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "created_at_gmt": createdAtGmt.toIso8601String(),
        "view_count": viewCount,
        "promotions": List<dynamic>.from(promotions.map((x) => x)),
        "badges": List<dynamic>.from(badges.map((x) => x)),
        "contact": contact.toJson(),
        "store": store.toJson(),
      };
}

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

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

class Review {
  Review({
    this.rating,
  });

  var rating;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating.toJson(),
      };
}

class Rating {
  Rating({
    this.average,
    this.count,
  });

  var average;
  var count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "average": average,
        "count": count,
      };
}
