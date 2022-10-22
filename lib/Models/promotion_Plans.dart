// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';

List<PromotionPlanModel> promotionPlanModelFromJson(String str) =>
    List<PromotionPlanModel>.from(
        json.decode(str).map((x) => PromotionPlanModel.fromJson(x)));

String promotionPlanModelToJson(List<PromotionPlanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PromotionPlanModel {
  PromotionPlanModel({
    this.id,
    this.price,
    this.description,
    this.title,
    this.visible,
    this.type,
    this.promotion,
  });

  var id;
  var price;
  var description;
  var title;
  var visible;
  var type;
  var promotion;

  factory PromotionPlanModel.fromJson(Map<String, dynamic> json) =>
      PromotionPlanModel(
        id: json["id"],
        price: json["price"],
        description: json["description"],
        title: json["title"],
        visible: json["visible"],
        type: json["type"],
        promotion: Promotion.fromJson(json["promotion"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "description": description,
        "title": title,
        "visible": visible,
        "type": type,
        "promotion": promotion.toJson(),
      };
}

class Promotion {
  Promotion({
    this.regular,
  });

  var regular;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        regular: Regular.fromJson(json["regular"]),
      );

  Map<String, dynamic> toJson() => {
        "regular": regular.toJson(),
      };
}

class Regular {
  Regular({
    this.featured,
    this.top,
    this.bumpUp,
  });

  var featured;
  var top;
  var bumpUp;

  factory Regular.fromJson(Map<String, dynamic> json) => Regular(
        featured: json["featured"],
        top: json["_top"],
        bumpUp: json["_bump_up"],
      );

  Map<String, dynamic> toJson() => {
        "featured": featured,
        "_top": top,
        "_bump_up": bumpUp,
      };
}
