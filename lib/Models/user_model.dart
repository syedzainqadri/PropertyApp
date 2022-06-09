

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));


class User {
    User({
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
        this.membership,
        this.store,
    });

    String? firstName;
    String? lastName;
    String? description;
    int? id;
    bool? isAdmin;
    String? email;
    String? username;
    String? phone;
    String? whatsappNumber;
    String? website;
    List<dynamic>? locations=[];
    String? zipcode;
    String? address;
    String? latitude;
    String? longitude;
    String? ppThumbUrl;
    Membership? membership;
    bool? store;

    factory User.fromJson(Map<String, dynamic> json) => User(
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
        membership: Membership.fromJson(json["membership"]),
        store: json["store"],
    );

   
}

class Membership {
    Membership({
        this.isExpired,
        this.expiredAt,
        this.remainingAds,
        this.postedAds,
        this.promotions,
    });

    bool? isExpired;
    DateTime? expiredAt;
    String? remainingAds;
    String? postedAds;
    Promotions? promotions;

    factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        isExpired: json["is_expired"],
        expiredAt: DateTime.parse(json["expired_at"]),
        remainingAds: json["remaining_ads"],
        postedAds: json["posted_ads"],
        promotions: Promotions.fromJson(json["promotions"]),
    );

}

class Promotions {
    Promotions({
        this.featured,
        this.top,
        this.bumpUp,
    });

    BumpUp? featured;
    BumpUp? top;
    BumpUp? bumpUp;

    factory Promotions.fromJson(Map<String, dynamic> json) => Promotions(
        featured: BumpUp.fromJson(json["featured"]),
        top: BumpUp.fromJson(json["_top"]),
        bumpUp: BumpUp.fromJson(json["_bump_up"]),
    );

  
}

class BumpUp {
    BumpUp({
        this.ads,
        this.validate,
    });

    int? ads;
    int? validate;

    factory BumpUp.fromJson(Map<String, dynamic> json) => BumpUp(
        ads: json["ads"],
        validate: json["validate"],
    );

}
