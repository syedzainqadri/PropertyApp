// ignore_for_file: file_names, unused_local_variable

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Utils/const.dart';

class MarkAsSoldController extends GetxController {
  var isLoading = false.obs;
  final token = GetStorage().read('token');

  markAsSold(String id) async {
    isLoading.value = true;
    String url = markAsSoldUrl + id;
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    isLoading.value = false;
  }
}
