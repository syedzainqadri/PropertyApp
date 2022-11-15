// ignore_for_file: file_names, unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Utils/const.dart';

class EmailController extends GetxController {
  final token = GetStorage().read('token');

  sendEmail(listingId, message, name, email) async {
    var body = jsonEncode(<String, dynamic>{
      'listing_id': listingId,
      'email': email,
      'message': message,
      'name': name,
    });
    var response = await http.post(
      Uri.parse(sendEmailUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
  }
}
