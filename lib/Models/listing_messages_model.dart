import 'dart:convert';

Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));

class Messages {
  Messages({
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
  List<MessageStart> messages;

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
  var isRead;
  DateTime createdAt;

  factory MessageStart.fromJson(Map<dynamic, dynamic> json) => MessageStart(
        messageId: json["message_id"],
        conId: json["con_id"],
        sourceId: json["source_id"],
        message: json["message"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
