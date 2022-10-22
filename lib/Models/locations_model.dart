// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

List<LocationsModel> locationsModelFromJson(String str) =>
    List<LocationsModel>.from(
        json.decode(str).map((x) => LocationsModel.fromJson(x)));

class LocationsModel {
  LocationsModel({
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
  });

  var termId;
  var name;
  var slug;
  var termGroup;
  var termTaxonomyId;
  var taxonomy;
  var description;
  var parent;
  var count;
  var filter;

  factory LocationsModel.fromJson(Map<String, dynamic> json) => LocationsModel(
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
      );
}
