
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/sign_in_model.dart';
class SignInController extends GetxController{

signIn(username,password) async {
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
    // var result = jsonDecode(response.body);
    // var data = result['user'];
    // print(data['first_name']);

    return response.body;
}
}