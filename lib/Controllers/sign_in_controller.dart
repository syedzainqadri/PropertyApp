import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/sign_in_model.dart';

class SignInController extends GetxController {
  Rx<SignInModel> signInModel = SignInModel().obs;

  signIn(username, password) async {
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username.toString(),
        'password': password.toString(),
      }),
    );
    signInModel.value = SignInModel.fromJson(response.body);
  }
}
