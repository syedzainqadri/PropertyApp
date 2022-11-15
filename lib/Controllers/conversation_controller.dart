// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Utils/const.dart';

class ConversationController extends GetxController {
  startConversation(listingId, message) async {
    var response = await http.post(
      Uri.parse(myConversationsUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
      },
      body: jsonEncode(<String, dynamic>{
        'listing_id': listingId,
        'text': message,
      }),
    );
    if (kDebugMode) {}
  }

  sendMessage(listingId, message, connectionId) async {
    var response = await http.post(
      Uri.parse(myMessagesUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
      },
      body: jsonEncode(<String, dynamic>{
        'listing_id': listingId,
        'text': message,
        'con_id': connectionId,
      }),
    );
    if (kDebugMode) {}
  }

  getChatConversation(connectionId) async {
    String url = myConversationsByIdUrl;
    url = url + connectionId;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
      },
    );
    if (kDebugMode) {}
  }

  getListingsChat(listingId) async {
    String url = myConversationsByListingIdUrl;
    url = url + listingId;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
      },
    );
    if (kDebugMode) {}
  }

  getAllChat() async {
    String url = myChatUrl;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
      },
    );
    if (kDebugMode) {}
  }
}
