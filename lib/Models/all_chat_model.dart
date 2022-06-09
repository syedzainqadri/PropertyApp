// To parse this JSON data, do
//
//     final allChats = allChatsFromJson(jsonString);

import 'dart:convert';

List<AllChats> allChatsFromJson(String str) => List<AllChats>.from(json.decode(str).map((x) => AllChats.fromJson(x)));


class AllChats {
    AllChats({
        this.conId,
        this.listingId,
        this.senderId,
        this.recipientId,
        this.senderDelete,
        this.recipientDelete,
        this.lastMessageId,
        this.senderReview,
        this.recipientReview,
        this.invertReview,
        this.createdAt,
        this.message,
        this.isRead,
        this.sourceId,
        this.lastMessage,
        this.lastMessageCreatedAt,
        this.displayName,
        this.userLogin,
        this.otherId,
        this.listing,
    });

    String? conId;
    String? listingId;
    String? senderId;
    String? recipientId;
    String? senderDelete;
    String? recipientDelete;
    String? lastMessageId;
    String? senderReview;
    String? recipientReview;
    String? invertReview;
    DateTime? createdAt;
    String? message;
    String? isRead;
    String? sourceId;
    String? lastMessage;
    DateTime? lastMessageCreatedAt;
    String? displayName;
    String? userLogin;
    String? otherId;
    Listing? listing;

    factory AllChats.fromJson(Map<String, dynamic> json) => AllChats(
        conId: json["con_id"],
        listingId: json["listing_id"],
        senderId: json["sender_id"],
        recipientId: json["recipient_id"],
        senderDelete: json["sender_delete"],
        recipientDelete: json["recipient_delete"],
        lastMessageId: json["last_message_id"],
        senderReview: json["sender_review"],
        recipientReview: json["recipient_review"],
        invertReview: json["invert_review"],
        createdAt: DateTime.parse(json["created_at"]),
        message: json["message"],
        isRead: json["is_read"],
        sourceId: json["source_id"],
        lastMessage: json["last_message"],
        lastMessageCreatedAt: DateTime.parse(json["last_message_created_at"]),
        displayName: json["display_name"],
        userLogin: json["user_login"],
        otherId: json["other_id"],
        listing: Listing.fromJson(json["listing"]),
    );

    
}

class Listing {
    Listing({
        this.id,
        this.title,
        this.url,
        this.images,
        this.amount,
        this.location,
        this.category,
    });

    int? id;
    String? title;
    String? url;
    List<Image>? images;
    String? amount;
    List<Category>? location;
    List<Category>? category;

    factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        amount: json["amount"],
        location: List<Category>.from(json["location"].map((x) => Category.fromJson(x))),
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    );

  
}

class Category {
    Category({
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

    factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class Image {
    Image({
        this.id,
        this.title,
        this.caption,
        this.url,
        this.alt,
        this.src,
        this.srcset,
        this.sizes,
        this.srcW,
        this.srcH,
        this.srcsetSizes,
    });

    int? id;
    String? title;
    String? caption;
    String? url;
    String? alt;
    String? src;
    bool? srcset;
    Sizes? sizes;
    int? srcW;
    int? srcH;
    String? srcsetSizes;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["ID"],
        title: json["title"],
        caption: json["caption"],
        url: json["url"],
        alt: json["alt"],
        src: json["src"],
        srcset: json["srcset"],
        sizes: Sizes.fromJson(json["sizes"]),
        srcW: json["src_w"],
        srcH: json["src_h"],
        srcsetSizes: json["srcset_sizes"],
    );

    
}

class Sizes {
    Sizes({
        this.full,
        this.medium,
        this.thumbnail,
    });

    Full? full;
    Full? medium;
    Full? thumbnail;

    factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        full: Full.fromJson(json["full"]),
        medium: Full.fromJson(json["medium"]),
        thumbnail: Full.fromJson(json["thumbnail"]),
    );

   
}

class Full {
    Full({
        this.src,
        this.width,
        this.height,
    });

    String? src;
    int? width;
    int? height;

    factory Full.fromJson(Map<String, dynamic> json) => Full(
        src: json["src"],
        width: json["width"],
        height: json["height"],
    );

}
