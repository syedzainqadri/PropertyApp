import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  startChatConversation(tokenType, token, listingId, text) async {
    var body = jsonEncode(<String, dynamic>{
      'listing_id': listingId,
      'text': text,
    });
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/chat/conversation"),
      headers: <String, String>{
        'Content-Type':
            "multipart/form-data; boundary='<calculated when request is sent>'",
        'Connection': 'keep-alive',
        'Content-Length': '<calculated when request is sent>',
        'Host': '<calculated when request is sent>',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
      },
      body: body,
    );
    print(const Utf8Codec().decode(response.bodyBytes) + '*****##############');
    sendChatConversation(listingId, text, jsonDecode(response.body)['con_id']);
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
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
      },
      body: body,
    );
    print(text + text +text);
    sendChatMessage(conId, jsonDecode(response.body)['message_id']);
  }

  sendChatMessage(conId, messageId) async {
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
    return response.body;
  }
}


































// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:realestapp/Controllers/sign_in_controller.dart';

// class ChatController extends GetxController {
//   startChatConversation(tokenType, token, listingId, text) async {
//     var body = <String, dynamic>{
//       'listing_id': listingId,
//       'text': text,
//     };
//     var response = await http.post(
//       Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/chat/conversation"),
//       headers: <String, String>{
//         'Content-Type':
//             "multipart/form-data; boundary='<calculated when request is sent>'",
//         'Connection': 'keep-alive',
//         'Content-Length': '<calculated when request is sent>',
//         'Host': '<calculated when request is sent>',
//         'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
//         'Authorization':
//             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
//       },
//       body: body,
//     );
//      var myResult  = utf8.decoder.convert(response.bodyBytes);
//     print(myResult + '   *******************     ' + response.statusCode.toString());
//     sendChatConversation(listingId, text, jsonDecode(response.body)['con_id']);
//   }

//   sendChatConversation(listingId, text, conId) async {
//     var body = jsonEncode(<String, dynamic>{
//       'listing_id': listingId,
//       'text': text,
//       'con_id': conId,
//     });
//     var response = await http.post(
//       Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/chat/message"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
//         'Authorization':
//             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
//       },
//       body: body,
//     );
//     sendChatMessage(conId, jsonDecode(response.body)['message_id']);
//   }

//   sendChatMessage(conId, messageId) async {
//     var response = await http.put(
//       Uri.parse(
//           "https://lagosabuja.com/wp-json/rtcl/v1/my/chat/message?con_id=$conId&message_id=$messageId"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
//         'Authorization':
//             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
//       },
//     );
//     return response.body;
//   }
// }
