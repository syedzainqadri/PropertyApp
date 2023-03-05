// To parse this JSON data, do
//
//     final configModel = configModelFromJson(jsonString);

import 'dart:convert';

ConfigModel configModelFromJson(String str) =>
    ConfigModel.fromJson(json.decode(str));

String configModelToJson(ConfigModel data) => json.encode(data.toJson());

class ConfigModel {
  ConfigModel({
    this.currency,
    this.registeredOnly,
    this.renew,
    this.paymentCurrency,
    this.promotions,
    this.datetimeFmt,
    this.weekDays,
    this.locationType,
    this.markAsSold,
    this.radiusSearch,
    this.imageSize,
    this.imageType,
    this.pnEvents,
    this.iapDisabled,
    this.timezone,
    this.tz,
    this.dateFormat,
    this.timeFormat,
    this.startOfWeek,
    this.badges,
    this.review,
    this.map,
    this.membershipEnabled,
    this.storeEnabled,
    this.store,
  });

  Currency? currency;
  RegisteredOnly? registeredOnly;
  bool? renew;
  Currency? paymentCurrency;
  Promotions? promotions;
  DatetimeFmt? datetimeFmt;
  List<WeekDay>? weekDays;
  String? locationType;
  bool? markAsSold;
  RadiusSearch? radiusSearch;
  String? imageSize;
  List<String>? imageType;
  List<String>? pnEvents;
  bool? iapDisabled;
  Timezone? timezone;
  Timezone? tz;
  String? dateFormat;
  String? timeFormat;
  int? startOfWeek;
  Badges? badges;
  Review? review;
  MapClass? map;
  bool? membershipEnabled;
  bool? storeEnabled;
  Store? store;

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
        currency: Currency.fromJson(json["currency"]),
        registeredOnly: RegisteredOnly.fromJson(json["registered_only"]),
        renew: json["renew"],
        paymentCurrency: Currency.fromJson(json["payment_currency"]),
        promotions: Promotions.fromJson(json["promotions"]),
        datetimeFmt: DatetimeFmt.fromJson(json["datetime_fmt"]),
        weekDays: List<WeekDay>.from(
            json["week_days"].map((x) => WeekDay.fromJson(x))),
        locationType: json["location_type"],
        markAsSold: json["mark_as_sold"],
        radiusSearch: RadiusSearch.fromJson(json["radius_search"]),
        imageSize: json["image_size"],
        imageType: List<String>.from(json["image_type"].map((x) => x)),
        pnEvents: List<String>.from(json["pn_events"].map((x) => x)),
        iapDisabled: json["iap_disabled"],
        timezone: Timezone.fromJson(json["timezone"]),
        tz: Timezone.fromJson(json["tz"]),
        dateFormat: json["date_format"],
        timeFormat: json["time_format"],
        startOfWeek: json["start_of_week"],
        badges: Badges.fromJson(json["badges"]),
        review: Review.fromJson(json["review"]),
        map: MapClass.fromJson(json["map"]),
        membershipEnabled: json["membership_enabled"],
        storeEnabled: json["store_enabled"],
        store: Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency!.toJson(),
        "registered_only": registeredOnly!.toJson(),
        "renew": renew,
        "payment_currency": paymentCurrency!.toJson(),
        "promotions": promotions!.toJson(),
        "datetime_fmt": datetimeFmt!.toJson(),
        "week_days": List<dynamic>.from(weekDays!.map((x) => x.toJson())),
        "location_type": locationType,
        "mark_as_sold": markAsSold,
        "radius_search": radiusSearch!.toJson(),
        "image_size": imageSize,
        "image_type": List<dynamic>.from(imageType!.map((x) => x)),
        "pn_events": List<dynamic>.from(pnEvents!.map((x) => x)),
        "iap_disabled": iapDisabled,
        "timezone": timezone!.toJson(),
        "tz": tz!.toJson(),
        "date_format": dateFormat,
        "time_format": timeFormat,
        "start_of_week": startOfWeek,
        "badges": badges!.toJson(),
        "review": review!.toJson(),
        "map": map!.toJson(),
        "membership_enabled": membershipEnabled,
        "store_enabled": storeEnabled,
        "store": store!.toJson(),
      };
}

class Badges {
  Badges({
    this.badgesNew,
    this.popular,
    this.featured,
    this.top,
    this.bumpUp,
  });

  BumpUp? badgesNew;
  BumpUp? popular;
  BumpUp? featured;
  BumpUp? top;
  BumpUp? bumpUp;

  factory Badges.fromJson(Map<String, dynamic> json) => Badges(
        badgesNew: BumpUp.fromJson(json["new"]),
        popular: BumpUp.fromJson(json["popular"]),
        featured: BumpUp.fromJson(json["featured"]),
        top: BumpUp.fromJson(json["top"]),
        bumpUp: BumpUp.fromJson(json["bump_up"]),
      );

  Map<String, dynamic> toJson() => {
        "new": badgesNew!.toJson(),
        "popular": popular!.toJson(),
        "featured": featured!.toJson(),
        "top": top!.toJson(),
        "bump_up": bumpUp!.toJson(),
      };
}

class BumpUp {
  BumpUp({
    this.label,
    this.listing,
    this.single,
    this.color,
  });

  String? label;
  bool? listing;
  bool? single;
  Color? color;

  factory BumpUp.fromJson(Map<String, dynamic> json) => BumpUp(
        label: json["label"],
        listing: json["listing"],
        single: json["single"],
        color: Color.fromJson(json["color"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "listing": listing,
        "single": single,
        "color": color!.toJson(),
      };
}

class Color {
  Color({
    this.bg,
    this.text,
  });

  String? bg;
  String? text;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        bg: json["bg"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "bg": bg,
        "text": text,
      };
}

class Currency {
  Currency({
    this.id,
    this.symbol,
    this.position,
    this.separator,
  });

  String? id;
  String? symbol;
  String? position;
  Separator? separator;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        symbol: json["symbol"],
        position: json["position"],
        separator: Separator.fromJson(json["separator"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "position": position,
        "separator": separator!.toJson(),
      };
}

class Separator {
  Separator({
    this.decimal,
    this.thousand,
  });

  String? decimal;
  String? thousand;

  factory Separator.fromJson(Map<String, dynamic> json) => Separator(
        decimal: json["decimal"],
        thousand: json["thousand"],
      );

  Map<String, dynamic> toJson() => {
        "decimal": decimal,
        "thousand": thousand,
      };
}

class DatetimeFmt {
  DatetimeFmt({
    this.time,
    this.date,
  });

  String? time;
  String? date;

  factory DatetimeFmt.fromJson(Map<String, dynamic> json) => DatetimeFmt(
        time: json["time"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "date": date,
      };
}

class MapClass {
  MapClass({
    this.type,
    this.zoom,
    this.center,
  });

  String? type;
  int? zoom;
  Center? center;

  factory MapClass.fromJson(Map<String, dynamic> json) => MapClass(
        type: json["type"],
        zoom: json["zoom"],
        center: Center.fromJson(json["center"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "zoom": zoom,
        "center": center!.toJson(),
      };
}

class Center {
  Center({
    this.address,
    this.lat,
    this.lng,
  });

  String? address;
  String? lat;
  String? lng;

  factory Center.fromJson(Map<String, dynamic> json) => Center(
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "lat": lat,
        "lng": lng,
      };
}

class Promotions {
  Promotions({
    this.featured,
    this.top,
    this.bumpUp,
  });

  String? featured;
  String? top;
  String? bumpUp;

  factory Promotions.fromJson(Map<String, dynamic> json) => Promotions(
        featured: json["featured"],
        top: json["_top"],
        bumpUp: json["_bump_up"],
      );

  Map<String, dynamic> toJson() => {
        "featured": featured,
        "_top": top,
        "_bump_up": bumpUp,
      };
}

class RadiusSearch {
  RadiusSearch({
    this.units,
    this.maxDistance,
    this.defaultDistance,
  });

  String? units;
  int? maxDistance;
  int? defaultDistance;

  factory RadiusSearch.fromJson(Map<String, dynamic> json) => RadiusSearch(
        units: json["units"],
        maxDistance: json["max_distance"],
        defaultDistance: json["default_distance"],
      );

  Map<String, dynamic> toJson() => {
        "units": units,
        "max_distance": maxDistance,
        "default_distance": defaultDistance,
      };
}

class RegisteredOnly {
  RegisteredOnly({
    this.listingContact,
    this.storeContact,
  });

  bool? listingContact;
  bool? storeContact;

  factory RegisteredOnly.fromJson(Map<String, dynamic> json) => RegisteredOnly(
        listingContact: json["listing_contact"],
        storeContact: json["store_contact"],
      );

  Map<String, dynamic> toJson() => {
        "listing_contact": listingContact,
        "store_contact": storeContact,
      };
}

class Review {
  Review({
    this.rating,
    this.updateRating,
  });

  bool? rating;
  bool? updateRating;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        updateRating: json["update_rating"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "update_rating": updateRating,
      };
}

class Store {
  Store({
    this.timeOptions,
  });

  TimeOptions? timeOptions;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        timeOptions: TimeOptions.fromJson(json["time_options"]),
      );

  Map<String, dynamic> toJson() => {
        "time_options": timeOptions!.toJson(),
      };
}

class TimeOptions {
  TimeOptions();

  factory TimeOptions.fromJson(Map<String, dynamic> json) => TimeOptions();

  Map<String, dynamic> toJson() => {};
}

class Timezone {
  Timezone({
    this.timezoneType,
    this.timezone,
  });

  int? timezoneType;
  String? timezone;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}

class WeekDay {
  WeekDay({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory WeekDay.fromJson(Map<String, dynamic> json) => WeekDay(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
