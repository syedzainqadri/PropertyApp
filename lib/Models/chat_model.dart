import 'dart:convert';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {
  Chat({
    required this.conId,
    required this.listingId,
    required this.senderId,
    required this.recipientId,
    required this.senderDelete,
    required this.recipientDelete,
    required this.lastMessageId,
    required this.senderReview,
    required this.recipientReview,
    required this.invertReview,
    required this.messages,
  });

  int conId;
  int listingId;
  int senderId;
  int recipientId;
  int senderDelete;
  int recipientDelete;
  int lastMessageId;
  int senderReview;
  int recipientReview;
  int invertReview;
  List<Message> messages;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
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
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "con_id": conId,
        "listing_id": listingId,
        "sender_id": senderId,
        "recipient_id": recipientId,
        "sender_delete": senderDelete,
        "recipient_delete": recipientDelete,
        "last_message_id": lastMessageId,
        "sender_review": senderReview,
        "recipient_review": recipientReview,
        "invert_review": invertReview,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    required this.messageId,
    required this.conId,
    required this.sourceId,
    required this.message,
    required this.isRead,
    required this.createdAt,
  });

  String messageId;
  String conId;
  String sourceId;
  String message;
  String isRead;
  DateTime createdAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json["message_id"],
        conId: json["con_id"],
        sourceId: json["source_id"],
        message: json["message"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "con_id": conId,
        "source_id": sourceId,
        "message": message,
        "is_read": isRead,
        "created_at": createdAt.toIso8601String(),
      };
}
