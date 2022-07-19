import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

class Message {
  Message({
    required this.messageId,
    required this.conId,
    required this.sourceId,
    required this.message,
    required this.isRead,
    required this.createdAt,
  });

  int messageId;
  int conId;
  int sourceId;
  String message;
  int isRead;
  DateTime createdAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json["message_id"],
        conId: json["con_id"],
        sourceId: json["source_id"],
        message: json["message"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
