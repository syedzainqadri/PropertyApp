import 'dart:convert';

StartConversation startConversationFromJson(String str) =>
    StartConversation.fromJson(json.decode(str));

String startConversationToJson(StartConversation data) =>
    json.encode(data.toJson());

class StartConversation {
  StartConversation({
    this.messageId,
    this.conId,
    this.sourceId,
    this.message,
    this.isRead,
    this.createdAt,
  });

  var messageId;
  var conId;
  var sourceId;
  var message;
  var isRead;
  DateTime? createdAt;

  factory StartConversation.fromJson(Map<String, dynamic> json) =>
      StartConversation(
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
        "created_at": createdAt!.toIso8601String(),
      };
}
