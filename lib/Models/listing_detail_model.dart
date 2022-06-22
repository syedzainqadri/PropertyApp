// To parse this JSON data, do
//
//     final listingDetail = listingDetailFromJson(jsonString);

import 'dart:convert';

ListingDetail listingDetailFromJson(String str) =>
    ListingDetail.fromJson(json.decode(str));

class ListingDetail {
  ListingDetail({
    this.config,
    this.listing,
    this.customFields,
  });

  var config;
  var listing;
  var customFields;

  factory ListingDetail.fromJson(Map<String, dynamic> json) => ListingDetail(
        config: Config.fromJson(json["config"]),
        listing: json["listing"],
        customFields: List<CustomField>.from(
            json["custom_fields"].map((x) => CustomField.fromJson(x))),
      );
}

class Config {
  Config({
    this.bhs,
    this.pricingTypes,
    this.priceTypes,
    this.currency,
    this.currencySymbol,
    this.priceUnits,
    this.hiddenFields,
    this.gallery,
    this.limit,
    this.videoUrls,
  });

  var bhs;
  var pricingTypes;
  var priceTypes;
  var currency;
  var currencySymbol;
  var priceUnits;
  var hiddenFields;
  var gallery;
  var limit;
  var videoUrls;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
      // bhs: json["bhs"],
      // pricingTypes: List<PricType>.from(
      //     json["pricing_types"].map((x) => PricType.fromJson(x))),
      // priceTypes: List<PricType>.from(
      //     json["price_types"].map((x) => PricType.fromJson(x))),
      // currency: json["currency"],
      // currencySymbol: json["currency_symbol"],
      // priceUnits: List<dynamic>.from(json["price_units"].map((x) => x)),
      // hiddenFields: List<dynamic>.from(json["hidden_fields"].map((x) => x)),
      // gallery: Gallery.fromJson(json["gallery"]),
      // limit: Limit.fromJson(json["limit"]),
      // videoUrls: json["video_urls"],
      );
}

class Gallery {
  Gallery({
    this.maxImageLimit,
    this.maxImageSize,
    this.extensions,
    this.imageRequired,
  });

  var maxImageLimit;
  var maxImageSize;
  var extensions;
  var imageRequired;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        maxImageLimit: json["max_image_limit"],
        maxImageSize: json["max_image_size"],
        extensions: List<String>.from(json["extensions"].map((x) => x)),
        imageRequired: json["image_required"],
      );
}

class Limit {
  Limit({
    this.title,
    this.description,
  });

  var title;
  var description;

  factory Limit.fromJson(Map<String, dynamic> json) => Limit(
        title: json["title"],
        description: json["description"],
      );
}

class PricType {
  PricType({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory PricType.fromJson(Map<String, dynamic> json) => PricType(
        id: json["id"],
        name: json["name"],
      );
}

class CustomField {
  CustomField({
    this.id,
    this.metaKey,
    this.label,
    this.slug,
    this.description,
    this.searchable,
    this.listable,
    this.type,
    this.required,
    this.placeholder,
    this.value,
    this.options,
    this.min,
    this.max,
    this.stepSize,
  });

  var id;
  var metaKey;
  var label;
  var slug;
  var description;
  var searchable;
  var listable;
  var type;
  var required;
  var placeholder;
  var value;
  var options;
  var min;
  var max;
  var stepSize;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        id: json["id"],
        metaKey: json["meta_key"],
        label: json["label"],
        slug: json["slug"],
        description: json["description"],
        searchable: json["searchable"],
        listable: json["listable"],
        type: json["type"],
        required: json["required"],
        placeholder: json["placeholder"],
        value: json["value"],
        options:
            json["options"] == null ? null : Options.fromJson(json["options"]),
        min: json["min"] == null ? null : json["min"],
        max: json["max"] == null ? null : json["max"],
        stepSize: json["step_size"] == null ? null : json["step_size"],
      );
}

class Options {
  Options({
    this.optionsDefault,
    this.choices,
  });

  var optionsDefault;
  var choices;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        optionsDefault: json["default"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );
}

class Choice {
  Choice({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        name: json["name"],
      );
}
