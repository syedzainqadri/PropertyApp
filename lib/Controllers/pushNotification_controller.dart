import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Controllers/sign_in_controller.dart';

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
      Uri.parse(
          "https://lagosabuja.com/wp-json/rtcl/v1/push-notification/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
    print(response.body);
    isLoading.value = false;
  }
}
