import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/user_model.dart';
import 'package:lagosabuja/Utils/const.dart';

class UserController extends GetxController {
  final token = GetStorage().read('token');
  var userModel = UserModel().obs;
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
    userModel.value = userModelFromJson(response.body);
  }

  changeProfileDetail(firstName, lastName, phone) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://lagosabuja.com/wp-json/rtcl/v1/my'));
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['X-API-KEY'] = '835c5442-20ca-4d51-9e32-fae11c35fd42';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields.addAll({
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
    });
    var res = await request.send();
    var resData = await res.stream.bytesToString().then((value) {
      return json.decode(value);
    });
    userModel.value = userModelFromJson(jsonEncode(resData));
    update();
  }

  changePassword(email) async {
    var response = await http.post(
      Uri.parse(
          "https://lagosabuja.com/wp-json/rtcl/v1/reset-password?user_login=$email"),
      headers: <String, String>{
        'Content-Type': "application/json",
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Password reset link has been sent to your email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kGreen,
          colorText: white);
    } else {
      Get.snackbar(
        'Error',
        'Something went wrong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 10,
      );
    }
  }
}
