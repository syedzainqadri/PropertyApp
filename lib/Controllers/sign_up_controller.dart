import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  signUp(username, email, password, firstName, lastName, phone) async {
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/signup"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'password': password,
        'email': email,
        'first name': firstName,
        'last name ': lastName,
        'phone': phone,
      }),
    );  
    print(response.body);
    var result = jsonDecode(response.body);
    var data = result['user'];
    print(data['first_name']);
    return response.body;
  }
}
