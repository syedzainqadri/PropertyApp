// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Controllers/sign_in_controller.dart';
import 'package:lagosabuja/Utils/const.dart';

class ProfileController extends GetxController {
  SignInController signInController = Get.put(SignInController());
  final token = GetStorage().read('token');
  changeProfile(image) async {
    var request = http.MultipartRequest('POST', Uri.parse(profileImageUrl));
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['X-API-KEY'] = '835c5442-20ca-4d51-9e32-fae11c35fd42';
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(http.MultipartFile.fromBytes(
        'image', File(image!.path).readAsBytesSync(),
        filename: image!.path));
    var res = await request.send();
  }

  changeProfileDetail(firstName, lastName, phone) async {
    var request = http.MultipartRequest('POST', Uri.parse(profileUrl));
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['X-API-KEY'] = '835c5442-20ca-4d51-9e32-fae11c35fd42';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields.addAll({
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
    });
    var res = await request.send();
  }
}
