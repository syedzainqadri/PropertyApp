import 'dart:convert';

List<Membership> membershipFromJson(String str) =>
    List<Membership>.from(json.decode(str).map((x) => Membership.fromJson(x)));

class Membership {
  Membership({
    required this.id,
    required this.price,
    required this.description,
    required this.title,
    required this.visible,
    required this.type,
    required this.promotion,
    required this.regularAds,
  });

  int id;
  String price;
  String description;
  String title;
  int visible;
  String type;
  Promotion promotion;
  int regularAds;

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        id: json["id"],
        price: json["price"],
        description: json["description"],
        title: json["title"],
        visible: json["visible"],
        type: json["type"],
        promotion: Promotion.fromJson(json["promotion"]),
        regularAds: json["regular_ads"],
      );
}

class Promotion {
  Promotion({
    required this.membership,
  });

  MembershipClass membership;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        membership: MembershipClass.fromJson(json["membership"]),
      );
}

class MembershipClass {
  MembershipClass({
    required this.featured,
    required this.top,
    required this.bumpUp,
  });

  BumpUp featured;
  BumpUp top;
  BumpUp bumpUp;

  factory MembershipClass.fromJson(Map<String, dynamic> json) =>
      MembershipClass(
        featured: BumpUp.fromJson(json["featured"]),
        top: BumpUp.fromJson(json["_top"]),
        bumpUp: BumpUp.fromJson(json["_bump_up"]),
      );
}

class BumpUp {
  BumpUp({
    required this.ads,
    required this.validate,
  });

  int ads;
  int validate;

  factory BumpUp.fromJson(Map<String, dynamic> json) => BumpUp(
        ads: json["ads"],
        validate: json["validate"],
      );
}
