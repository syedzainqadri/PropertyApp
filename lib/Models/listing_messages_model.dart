import 'dart:convert';

import 'package:get/utils.dart';

Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));

class Messages {
  Messages({
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
    this.messages,
  });

  int? conId;
  int? listingId;
  int? senderId;
  int? recipientId;
  int? senderDelete;
  int? recipientDelete;
  int? lastMessageId;
  int? senderReview;
  int? recipientReview;
  int? invertReview;
  List<MessageStart>? messages;

  factory Messages.fromJson(Map<dynamic, dynamic> json) => Messages(
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
        messages: List<MessageStart>.from(
            json["messages"].map((x) => MessageStart.fromJson(x))),
      );
}

class MessageStart {
  MessageStart({
    this.messageId,
    this.conId,
    this.sourceId,
    this.message,
    this.isRead,
    this.createdAt,
  });

  String? messageId;
  String? conId;
  String? sourceId;
  String? message;
  String? isRead;
  DateTime? createdAt;

  factory MessageStart.fromJson(Map<dynamic, dynamic> json) => MessageStart(
        messageId: json["message_id"],
        conId: json["con_id"],
        sourceId: json["source_id"],
        message: json["message"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
