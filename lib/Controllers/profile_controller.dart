
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/sign_in_model.dart';
class ProfileController extends GetxController{

changeProfile(firstName,lastName,image) async {
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/categories"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
      body: <String, dynamic>{
        'image': image,
        'first_name': firstName,
        'last_name': lastName,
      },
    );

    print(response.body) ;
}
}