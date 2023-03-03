import 'dart:convert';

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
    this.dateCreated,
    this.createdAt,
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

  int? listingId;
  int? authorId;
  String? title;
  String? pricingType;
  String? price;
  String? maxPrice;
  String? priceType;
  List<dynamic>? priceUnits;
  String? priceUnit;
  List<Category>? categories;
  String? adType;
  String? status;
  List<Image>? images;
  DateCreated? dateCreated;
  DateTime? createdAt;
  int? viewCount;
  List<String>? promotions;
  List<String>? badges;
  Contact? contact;
  Store? store;
  String? url;
  String? description;
  List<dynamic>? videoUrls;
  Author? author;
  List<CustomField>? customFields;
  List<Related>? related;
  Review? review;

  factory ListingsByIdModel.fromJson(Map<String, dynamic> json) =>
      ListingsByIdModel(
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
        dateCreated: DateCreated.fromJson(json["date_created"]),
        createdAt: DateTime.parse(json["created_at"]),
        viewCount: json["view_count"],
        promotions: List<String>.from(json["promotions"].map((x) => x)),
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

  Map<String, dynamic> toJson() => {
        "listing_id": listingId,
        "author_id": authorId,
        "title": title,
        "pricing_type": pricingType,
        "price": price,
        "max_price": maxPrice,
        "price_type": priceType,
        "price_units": List<dynamic>.from(priceUnits!.map((x) => x)),
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
        "url": url,
        "description": description,
        "video_urls": List<dynamic>.from(videoUrls!.map((x) => x)),
        "author": author!.toJson(),
        "custom_fields":
            List<dynamic>.from(customFields!.map((x) => x.toJson())),
        "related": List<dynamic>.from(related!.map((x) => x.toJson())),
        "review": review!.toJson(),
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
        "store": store,
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
    this.icon,
    this.required,
    this.placeholder,
    this.value,
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
  String? icon;
  bool? required;
  String? placeholder;
  dynamic value;
  Options? options;
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
        icon: json["icon"],
        required: json["required"],
        placeholder: json["placeholder"],
        value: json["value"],
        options: Options.fromJson(json["options"]),
        min: json["min"],
        max: json["max"],
        stepSize: json["step_size"],
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
        "icon": icon,
        "required": required,
        "placeholder": placeholder,
        "value": value,
        "options": options!.toJson(),
        "min": min,
        "max": max,
        "step_size": stepSize,
      };
}

class Options {
  Options({
    this.optionsDefault,
    this.choices,
  });

  dynamic optionsDefault;
  List<Choice>? choices;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
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
  String? pricingType;
  String? price;
  String? maxPrice;
  String? priceType;
  List<dynamic>? priceUnits;
  String? priceUnit;
  List<Category>? categories;
  String? adType;
  String? status;
  List<Image>? images;
  DateCreated? dateCreated;
  DateTime? createdAt;
  int? viewCount;
  List<String>? promotions;
  List<String>? badges;
  Contact? contact;
  Store? store;

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
        dateCreated: DateCreated.fromJson(json["date_created"]),
        createdAt: DateTime.parse(json["created_at"]),
        viewCount: json["view_count"],
        promotions: List<String>.from(json["promotions"].map((x) => x)),
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
        "price_units": List<dynamic>.from(priceUnits!.map((x) => x)),
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
