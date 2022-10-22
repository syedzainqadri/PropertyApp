// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.firstName,
    this.lastName,
    this.description,
    this.id,
    this.isAdmin,
    this.email,
    this.username,
    this.phone,
    this.whatsappNumber,
    this.website,
    this.locations,
    this.zipcode,
    this.address,
    this.latitude,
    this.longitude,
    this.ppThumbUrl,
    this.store,
  });

  var firstName;
  var lastName;
  var description;
  var id;
  var isAdmin;
  var email;
  var username;
  var phone;
  var whatsappNumber;
  var website;
  var locations;
  var zipcode;
  var address;
  var latitude;
  var longitude;
  var ppThumbUrl;
  var store;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        description: json["description"],
        id: json["id"],
        isAdmin: json["isAdmin"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        whatsappNumber: json["whatsapp_number"],
        website: json["website"],
        locations: List<dynamic>.from(json["locations"].map((x) => x)),
        zipcode: json["zipcode"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        ppThumbUrl: json["pp_thumb_url"],
        store: json["store"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "description": description,
        "id": id,
        "isAdmin": isAdmin,
        "email": email,
        "username": username,
        "phone": phone,
        "whatsapp_number": whatsappNumber,
        "website": website,
        "locations": List<dynamic>.from(locations.map((x) => x)),
        "zipcode": zipcode,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "pp_thumb_url": ppThumbUrl,
        "store": store,
      };
}
