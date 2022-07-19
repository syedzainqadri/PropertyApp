import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../Models/user_model.dart';

class UserController extends GetxController {
  final token = GetStorage().read('token');
  var user = User().obs;
  @override
  onInit() {
    getUser();
    super.onInit();
  }

  getUser() async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    user.value = userFromJson(response.body);
  }
}
