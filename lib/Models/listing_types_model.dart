// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

List<ListingTypes> listingTypesFromJson(String str) => List<ListingTypes>.from(
    json.decode(str).map((x) => ListingTypes.fromJson(x)));

class ListingTypes {
  ListingTypes({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory ListingTypes.fromJson(Map<String, dynamic> json) => ListingTypes(
        id: json["id"],
        name: json["name"],
      );
}
