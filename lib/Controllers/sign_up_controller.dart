// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Utils/const.dart';

class SignUpController extends GetxController {
  signUp(username, email, password, firstName, lastName, phone) async {
    var response = await http.post(
      Uri.parse(signupUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
      body: {
        'username': username,
        'password': password,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
      },
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      var data = result['user'];

      return response.body;
    } else {
      Get.back();
      var result = jsonDecode(response.body);
      Get.defaultDialog(
          title: "",
          content: Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${result['error_message']}",
                  style: const TextStyle(color: Colors.black38),
                )
              ],
            ),
          ));
      Get.snackbar('Error', response.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: Colors.white));
      return null;
    }
  }
}
