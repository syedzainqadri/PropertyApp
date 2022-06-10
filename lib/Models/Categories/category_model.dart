import 'dart:convert';

List<CategoriesModel> categoriesFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

class CategoriesModel {
  CategoriesModel({
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
    this.icon,
  });

  int? termId;
  String? name;
  String? slug;
  int? termGroup;
  int? termTaxonomyId;
  String? taxonomy;
  String? description;
  int? parent;
  int? count;
  String? filter;
  Icon? icon;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        termGroup: json["term_group"],
        termTaxonomyId: json["term_taxonomy_id"],
        taxonomy: json["taxonomy"],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: json["filter"],
        icon: Icon.fromJson(json["icon"]),
      );
}

class Icon {
  Icon({
    this.url,
    this.iconClass,
  });

  String? url;
  String? iconClass;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        url: json["url"],
        iconClass: json["class"],
      );
}
