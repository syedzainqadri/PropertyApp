import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/favorite_listing_model.dart';

class DeleteListingController extends GetxController {
  var isLoading = false.obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    super.onInit();
  }

  deleteListing(String id) async {
    isLoading.value = true;
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/my/listings?listing_id=$id';
    var response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    isLoading.value = false;
    print(response.body);
  }
}
