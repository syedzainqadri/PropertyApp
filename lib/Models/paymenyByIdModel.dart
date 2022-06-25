// To parse this JSON data, do
//
//     final paymentByIdModel = paymentByIdModelFromJson(jsonString);

import 'dart:convert';

PaymentByIdModel paymentByIdModelFromJson(String str) =>
    PaymentByIdModel.fromJson(json.decode(str));

String paymentByIdModelToJson(PaymentByIdModel data) =>
    json.encode(data.toJson());

class PaymentByIdModel {
  PaymentByIdModel({
    this.id,
    this.price,
    this.method,
    this.status,
    this.transactionId,
    this.orderKey,
    this.paidDate,
    this.createdDate,
    this.gateway,
    this.plan,
  });

  var id;
  var price;
  var method;
  var status;
  var transactionId;
  var orderKey;
  var paidDate;
  var createdDate;
  var gateway;
  var plan;

  factory PaymentByIdModel.fromJson(Map<String, dynamic> json) =>
      PaymentByIdModel(
        id: json["id"],
        price: json["price"],
        method: json["method"],
        status: json["status"],
        transactionId: json["transaction_id"],
        orderKey: json["order_key"],
        paidDate: json["paid_date"],
        createdDate: DateTime.parse(json["created_date"]),
        gateway: Gateway.fromJson(json["gateway"]),
        plan: Plan.fromJson(json["plan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "method": method,
        "status": status,
        "transaction_id": transactionId,
        "order_key": orderKey,
        "paid_date": paidDate,
        "created_date": createdDate.toIso8601String(),
        "gateway": gateway.toJson(),
        "plan": plan.toJson(),
      };
}

class Gateway {
  Gateway({
    this.id,
    this.title,
    this.icon,
    this.instructions,
    this.description,
  });

  var id;
  var title;
  var icon;
  var instructions;
  var description;

  factory Gateway.fromJson(Map<String, dynamic> json) => Gateway(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
        instructions: json["instructions"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "icon": icon,
        "instructions": instructions,
        "description": description,
      };
}

class Plan {
  Plan({
    this.id,
    this.price,
    this.description,
    this.title,
    this.visible,
    this.type,
    this.promotion,
    this.regularAds,
  });

  var id;
  var price;
  var description;
  var title;
  var visible;
  var type;
  var promotion;
  var regularAds;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        price: json["price"],
        description: json["description"],
        title: json["title"],
        visible: json["visible"],
        type: json["type"],
        promotion: Promotion.fromJson(json["promotion"]),
        regularAds: json["regular_ads"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "description": description,
        "title": title,
        "visible": visible,
        "type": type,
        "promotion": promotion.toJson(),
        "regular_ads": regularAds,
      };
}

class Promotion {
  Promotion({
    this.regular,
    this.membership,
  });

  var regular;
  var membership;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        regular: List<dynamic>.from(json["regular"].map((x) => x)),
        membership: Membership.fromJson(json["membership"]),
      );

  Map<String, dynamic> toJson() => {
        "regular": List<dynamic>.from(regular.map((x) => x)),
        "membership": membership.toJson(),
      };
}

class Membership {
  Membership({
    this.featured,
    this.top,
    this.bumpUp,
  });

  var featured;
  var top;
  var bumpUp;

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
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
