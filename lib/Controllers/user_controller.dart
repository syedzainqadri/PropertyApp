import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Controllers/sign_in_controller.dart';

import '../Models/user_model.dart';

class UserController extends GetxController {
  SignInController signInController = Get.put(SignInController());
  Rx<UserModel> user = UserModel().obs;
  updateUser(UserModel newUser) {
    user(newUser);
  }

  getUser(token_type, token) async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': '$token_type $token',
      },
    );
    return jsonDecode(response.body);
  }
}
