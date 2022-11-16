// ignore_for_file: file_names, unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Utils/const.dart';

class PushNotificationController extends GetxController {
  var box = GetStorage();
  var isLoading = false.obs;
  final token = GetStorage().read('token');
  pushNotificationRegistration(pushToken) async {
    isLoading.value = true;
    var body = jsonEncode(<String, dynamic>{
      'push_token': pushToken,
    });
    var response = await http.post(
      Uri.parse(pushNotificationUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
    isLoading.value = false;
  }
}
