

import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

class Review {
  Review({
    required this.data,
    required this.pagination,
  });

  List<Data> data;
  Pagination pagination;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );
}

class Data {
  Data({
    required this.id,
    required this.listing,
    required this.parent,
    required this.author,
    required this.authorName,
    required this.authorEmail,
    required this.authorUrl,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        authorAvatarUrls: Map.from(json["author_avatar_urls"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );
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
}

class Pagination {
  Pagination({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
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
}

