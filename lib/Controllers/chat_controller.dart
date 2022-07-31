import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/listing_messages_model.dart';
import 'package:realestapp/Models/startConversationModel.dart';
import 'package:realestapp/Utils/full_screen_dialog.dart';
import '../Models/all_chat_model.dart';

class ChatController extends GetxController {
  var box = GetStorage();
  var isLoading = false.obs;
  final token = GetStorage().read('token');
  var allChats = List<AllChats>.empty(growable: true).obs;
  var messagesList = Messages().obs;

  @override
  onInit() {
    getAllChats();
    // getAllMessages();
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
    print('conversation id is : ${jsonDecode(response.body)["con_id"]}');
    await sendChatConversation(
        listingId, text, jsonDecode(response.body)['con_id']);
    var data = jsonDecode(response.body);
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
    print(
        'conversation initiated is: ${jsonDecode(response.body)['message_id'] = listingId}');
    await sendChatMessage(
        conId, jsonDecode(response.body)['message_id'], listingId);
  }

  sendChatMessage(conId, messageId, listingId) async {
    var response = await http.put(
      Uri.parse(
          "https://lagosabuja.com/wp-json/rtcl/v1/my/chat/message?con_id=$conId&message_id=$messageId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    await getAllMessages();
  }

  getAllMessages() async {
    isLoading.value = true;

    var listingId = box.read('listingId');
    print(listingId);
    var response = await http.get(
      Uri.parse(
          "https://lagosabuja.com/wp-json/rtcl/v1/my/chat/check?listing_id=$listingId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    response.body.contains('false') ? isLoading.value = false
        : messagesList.value = messagesFromJson(response.body);
    isLoading.value = false;
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
