import 'dart:convert';

ListingsByIdModel listingsIdFromJson(String str) =>
    ListingsByIdModel.fromJson(json.decode(str));

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
        related:
            List<Related>.from(json["related"].map((x) => Related.fromJson(x))),
        review: Review.fromJson(json["review"]),
      );
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
        options:
            json["options"] == null ? null : Options.fromJson(json["options"]),
        min: json["min"] == null ? null : json["min"],
        max: json["max"] == null ? null : json["max"],
        stepSize: json["step_size"] == null ? null : json["step_size"],
      );
}

class Options {
  Options({
    this.optionsDefault,
    this.choices,
  });

  var optionsDefault;
  var choices;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        optionsDefault: json["default"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );
}

class Choice {
  Choice({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        name: json["name"],
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
        id: json["id"],
        name: json["name"],
        short: json["short"],
      );
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
}

class Review {
  Review({
    this.rating,
  });

  var rating;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: Rating.fromJson(json["rating"]),
      );
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
}
