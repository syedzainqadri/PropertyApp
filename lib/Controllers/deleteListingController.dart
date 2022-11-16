// ignore_for_file: file_names, unused_local_variable

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Utils/const.dart';

class DeleteListingController extends GetxController {
  var isLoading = false.obs;
  final token = GetStorage().read('token');

  deleteListing(String id) async {
    isLoading.value = true;
    String url = deleteListingUrl + id;
    var response = await http.delete(
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
