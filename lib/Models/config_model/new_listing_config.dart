// To parse this JSON data, do
//
//     final newListingConfig = newListingConfigFromJson(jsonString);

import 'dart:convert';

NewListingConfig newListingConfigFromJson(String str) =>
    NewListingConfig.fromJson(json.decode(str));

String newListingConfigToJson(NewListingConfig data) =>
    json.encode(data.toJson());

class NewListingConfig {
  NewListingConfig({
    this.eligible,
    this.listingTypes,
    this.priceTypes,
    this.hiddenFields,
  });

  bool? eligible;
  List<Type>? listingTypes;
  List<Type>? priceTypes;
  List<dynamic>? hiddenFields;

  factory NewListingConfig.fromJson(Map<String, dynamic> json) =>
      NewListingConfig(
        eligible: json["eligible"],
        listingTypes:
            List<Type>.from(json["listing_types"].map((x) => Type.fromJson(x))),
        priceTypes:
            List<Type>.from(json["price_types"].map((x) => Type.fromJson(x))),
        hiddenFields: List<dynamic>.from(json["hidden_fields"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "eligible": eligible,
        "listing_types":
            List<dynamic>.from(listingTypes!.map((x) => x.toJson())),
        "price_types": List<dynamic>.from(priceTypes!.map((x) => x.toJson())),
        "hidden_fields": List<dynamic>.from(hiddenFields!.map((x) => x)),
      };
}

class Type {
  Type({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
