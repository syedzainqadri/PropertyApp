
// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
    Review({
        required this.data,
        required this.pagination,
    });

    List<Datum> data;
    Pagination pagination;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class Datum {
    Datum({
        required this.id,
required this.listing,
       required this.parent,
       required this.author,
      required  this.authorName,
      required  this.authorEmail,
      required  this.authorUrl,
        required this.authorIp,
        required this.authorUserAgent,
       required this.date,
       required this.dateGmt,
       required this.rating,
       required this.title,
       required this.content,
       required this.status,
       required this.authorAvatarUrls,
    });

    int id;
    int listing;
    int parent;
    int author;
    String authorName;
    String authorEmail;
    String authorUrl;
    String authorIp;
    String authorUserAgent;
    DateTime date;
    DateTime dateGmt;
    int rating;
    String title;
    Content content;
    String status;
    Map<String, String> authorAvatarUrls;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        listing: json["listing"],
        parent: json["parent"],
        author: json["author"],
        authorName: json["author_name"],
        authorEmail: json["author_email"],
        authorUrl: json["author_url"],
        authorIp: json["author_ip"],
        authorUserAgent: json["author_user_agent"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        rating: json["rating"],
        title: json["title"],
        content: Content.fromJson(json["content"]),
        status: json["status"],
        authorAvatarUrls: Map.from(json["author_avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "listing": listing,
        "parent": parent,
        "author": author,
        "author_name": authorName,
        "author_email": authorEmail,
        "author_url": authorUrl,
        "author_ip": authorIp,
        "author_user_agent": authorUserAgent,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "rating": rating,
        "title": title,
        "content": content.toJson(),
        "status": status,
        "author_avatar_urls": Map.from(authorAvatarUrls).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Content {
    Content({
       required this.rendered,
       required this.raw,
    });

    String rendered;
    String raw;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        raw: json["raw"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "raw": raw,
    };
}

class Pagination {
    Pagination({
      required  this.total,
      required  this.perPage,
      required  this.currentPage,
      required  this.totalPages,
    });

    int total;
    int perPage;
    int currentPage;
    int totalPages;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
    };
}


// import 'review_model.dart';

// class ReviewModel {
//   late int id, listing, rating;

//   late String author_name, author_email, author_url, date, title, content;

//   ReviewModel.fromJson(data) {
//     author_name = data['author_name'];
//     author_email = data['author_email'];
//     author_url = data['author_url'];
//     date = data['date'];
//     title = data['title'];
//     content = data['content']['raw'];
//     id = data['id'];
//     listing = data['listing'];
//     rating = data['rating'];
//     print(data['author_name']);
//   }
// }

// class Review {
//   List<ReviewModel> reviews = [];

//   Review.fromJson(data) {
//     var priceObjsJson = data['data'] as List;
//     reviews.addAll(priceObjsJson
//         .map((priceJson) => ReviewModel.fromJson(priceJson))
//         .toList());
//   }
//   Review();
// }
