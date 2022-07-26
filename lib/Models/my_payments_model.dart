// To parse this JSON data, do
//
//     final myPayments = myPaymentsFromJson(jsonString);

import 'dart:convert';

MyPayments myPaymentsFromJson(String str) =>
    MyPayments.fromJson(json.decode(str));

class MyPayments {
  MyPayments({
    this.data,
    this.pagination,
  });

  var data;
  var pagination;

  factory MyPayments.fromJson(Map<String, dynamic> json) => MyPayments(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        // pagination: Pagination.fromJson(json["pagination"]),
      );
}

class Datum {
  Datum({
    this.id,
    this.price,
    this.method,
    this.status,
    this.transactionId,
    this.orderKey,
    this.paidDate,
    this.createdDate,
    this.gateway,
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        price: json["price"],
        method: methodValues.map[json["method"]],
        status: statusValues.map[json["status"]],
        transactionId: json["transaction_id"],
        orderKey: json["order_key"],
        paidDate: json["paid_date"],
        createdDate: DateTime.parse(json["created_date"]),
        gateway: Gateway.fromJson(json["gateway"]),
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
        id: idValues.map[json["id"]],
        title: titleValues.map[json["title"]],
        icon: json["icon"],
        instructions: json["instructions"],
        description: json["description"],
      );
}

enum Id { OFFLINE }

final idValues = EnumValues({"offline": Id.OFFLINE});

enum Title { DIRECT_BANK_TRANSFER }

final titleValues =
    EnumValues({"Direct Bank Transfer": Title.DIRECT_BANK_TRANSFER});

enum Method { OFFLINE }

final methodValues = EnumValues({"Offline": Method.OFFLINE});

enum Status { PENDING, COMPLETED }

final statusValues =
    EnumValues({"Completed": Status.COMPLETED, "Pending": Status.PENDING});

// class Pagination {
//   Pagination({
//     this.total,
//     this.count,
//     this.perPage,
//     this.currentPage,
//     this.totalPages,
//   });

//   var total;
//   var count;
//   var perPage;
//   var currentPage;
//   var totalPages;

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         total: json["total"] == null ? null : json["total"],
//         count: json["count"],
//         perPage: json["per_page"],
//         currentPage: json["current_page"],
//         totalPages: json["total_pages"],
//       );
// }

class EnumValues<T> {
  var map;
  var reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
