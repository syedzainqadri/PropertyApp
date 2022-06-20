import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../Models/all_chat_model.dart';
import '../Models/listing_messages_model.dart';

class ChatController extends GetxController {
  final token = GetStorage().read('token');
  var messages = Messages(
          conId: 0,
          listingId: 0,
          senderId: 0,
          recipientId: 0,
          senderDelete: 0,
          recipientDelete: 0,
          lastMessageId: 0,
          senderReview: 0,
          recipientReview: 0,
          invertReview: 0,
          messages: List<Message>.empty(growable: true))
      .obs;
  var allChats = List<AllChats>.empty(growable: true).obs;
  
  @override
  onInit() {
    getAllChats();
    super.onInit();
  }

  startChatConversation(listingId, text) async {
    var permas = {"listing_id": listingId, "text": text};
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/chat/conversation"),
      headers: <String, String>{
        'Content-Type': "application/json",
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(permas),
    );
   await sendChatConversation(listingId, text, jsonDecode(response.body)['con_id']);

    print(response.body);
  }

  sendChatConversation(listingId, text, conId) async {
    var body = jsonEncode(<String, dynamic>{
      'listing_id': listingId,
      'text': text,
      'con_id': conId,
    });
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/chat/message"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
    await sendChatMessage(conId, jsonDecode(response.body)['message_id'], listingId);

    print(response.body);
  }

  sendChatMessage(conId, messageId, listingId) async {
    var response = await http.put(
      Uri.parse(
          "https://lagosabuja.com/wp-json/rtcl/v1/my/chat/message?con_id=$conId&message_id=$messageId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
      },
    );
    await getAllMessages(listingId);
    print(response.body);
  }

  getAllMessages(listingId) async {
    var response = await http.get(
      Uri.parse(
          "https://lagosabuja.com/wp-json/rtcl/v1/my/chat/check?listing_id=$listingId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
   messages.value = messagesFromJson(response.body);
    print('All Messages API Hit '+response.body);
  }

  getAllChats() async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/chat"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    allChats.value = allChatsFromJson(response.body);
  }
}
