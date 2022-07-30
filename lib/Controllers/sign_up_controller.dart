import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Utils/color_scheme.dart';

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

    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      var data = result['user'];

      return response.body;
    }else{
      Get.back();
      var result = jsonDecode(response.body);
      Get.defaultDialog(
          title: "",
          content: Container(
            color: Colors.white,
            child: Column(
              children: [

                SizedBox(height: 10,),
                Text(
                  "${result['error_message']}",
                  style:  TextStyle(color: Colors.black38),
                )
              ],
            ),
          )
      );
      print(result);
      Get.snackbar('Error', response.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: Colors.white));
      return null;
    }

  }
}
