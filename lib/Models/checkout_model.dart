import 'dart:convert';

Checkout checkoutFromJson(String str) => Checkout.fromJson(json.decode(str));

class Checkout {
  Checkout({
    required this.id,
    required this.price,
    required this.method,
    required this.status,
    required this.transactionId,
    required this.orderKey,
    required this.paidDate,
    required this.createdDate,
    required this.gateway,
    required this.plan,
    required this.result,
    required this.redirect,
  });

  int id;
  String price;
  String method;
  String status;
  String transactionId;
  String orderKey;
  String paidDate;
  DateTime createdDate;
  Gateway gateway;
  Plan plan;
  String result;
  String redirect;

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
    required this.id,
    required this.title,
    required this.icon,
    required this.instructions,
    required this.description,
  });

  String id;
  String title;
  dynamic icon;
  String instructions;
  String description;

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
    required this.id,
    required this.price,
    required this.description,
    required this.title,
    required this.visible,
    required this.type,
    required this.regularAds,
  });

  int id;
  String price;
  String description;
  String title;
  int visible;
  String type;
  int regularAds;

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





