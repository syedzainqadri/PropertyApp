import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;
  updateUser(UserModel newUser){
    print(newUser.picture);
    user(newUser);
  }
  getUser(tokenType, token) async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': '$tokenType $token',
      },
    );
   // print('This is atest **********************');
    return jsonDecode(response.body);
  }
}
