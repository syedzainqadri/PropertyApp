// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

Checkout checkoutFromJson(String str) => Checkout.fromJson(json.decode(str));

class Checkout {
  Checkout({
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
    this.result,
    this.redirect,
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
  var result;
  var redirect;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
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
        result: json["result"],
        redirect: json["redirect"],
      );
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
}

class Plan {
  Plan({
    this.id,
    this.price,
    this.description,
    this.title,
    this.visible,
    this.type,
    this.regularAds,
  });

  var id;
  var price;
  var description;
  var title;
  var visible;
  var type;
  var regularAds;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        price: json["price"],
        description: json["description"],
        title: json["title"],
        visible: json["visible"],
        type: json["type"],
        regularAds: json["regular_ads"],
      );
}
