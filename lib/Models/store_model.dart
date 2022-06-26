import 'dart:convert';

MyStore myStoreFromJson(String str) => MyStore.fromJson(json.decode(str));

class MyStore {
  MyStore({
    this.id,
    this.title,
    this.logo,
    this.listingsCount,
    this.slug,
    this.banner,
    this.description,
    this.slogan,
    this.email,
    this.address,
    this.phone,
    this.ownerId,
    this.website,
    this.createdAt,
    this.createdAtGmt,
    this.openingHours,
    this.social,
    this.review,
    this.config,
  });

  var id;
  var title;
  var logo;
  var listingsCount;
  var slug;
  var banner;
  var description;
  var slogan;
  var email;
  var address;
  var phone;
  var ownerId;
  var website;
  var createdAt;
  var createdAtGmt;
  var openingHours;
  var social;
  var review;
  var config;

  factory MyStore.fromJson(Map<String, dynamic> json) => MyStore(
        id: json["id"],
        title: json["title"],
        logo: json["logo"],
        listingsCount: json["listings_count"],
        slug: json["slug"],
        banner: json["banner"],
        description: json["description"],
        slogan: json["slogan"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        ownerId: json["owner_id"],
        website: json["website"],
        createdAt: DateTime.parse(json["created_at"]),
        createdAtGmt: DateTime.parse(json["created_at_gmt"]),
        openingHours: OpeningHours.fromJson(json["opening_hours"]),
        social: json["social"],
        review: Review.fromJson(json["review"]),
        config: Config.fromJson(json["config"]),
      );
}

class Config {
  Config({
    this.banner,
    this.logo,
  });

  var banner;
  var logo;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        banner: Banner.fromJson(json["banner"]),
        logo: Banner.fromJson(json["logo"]),
      );
}

class Banner {
  Banner({
    this.width,
    this.height,
  });

  var width;
  var height;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        width: json["width"],
        height: json["height"],
      );
}

class OpeningHours {
  OpeningHours({
    this.type,
    this.hours,
  });

  var type;
  var hours;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        type: json["type"],
        hours: List<dynamic>.from(json["hours"].map((x) => x)),
      );
}

class Review {
  Review({
    this.total,
    this.average,
  });

  var total;
  var average;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        total: json["total"],
        average: json["average"],
      );
}
