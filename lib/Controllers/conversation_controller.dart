import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ConversationController extends GetxController {
  startConversation(listingId, message) async {
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/chat/conversation"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
      body: jsonEncode(<String, dynamic>{
        'listing_id': listingId,
        'text': message,
      }),
    );
    if (kDebugMode) {
      print(response.body);
    }
  }

  sendMessage(listingId, message, connectionId) async {
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/chat/message"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
      body: jsonEncode(<String, dynamic>{
        'listing_id': listingId,
        'text': message,
        'con_id': connectionId,
      }),
    );
    if (kDebugMode) {
      print(response.body);
    }
  }

  getChatConversation(connectionId) async {
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/my/chat/conversation?con_id=';
    url = url + connectionId;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
  }
  getListingsChat(listingId) async {
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/my/chat/check?listing_id=';
    url = url + listingId;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
  }
  getAllChat() async {
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/my/chat';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
  }

   
}
