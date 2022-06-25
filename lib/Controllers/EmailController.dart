import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class EmailController extends GetxController {
  final token = GetStorage().read('token');

  @override
  onInit() {
    super.onInit();
  }

  sendEmail(listingId, message, name, email) async {
    var body = jsonEncode(<String, dynamic>{
      'listing_id': listingId,
      'email': email,
      'message': message,
      'name': name,
    });
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/listing/email-seller"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
    print(response.body);
  }
}
