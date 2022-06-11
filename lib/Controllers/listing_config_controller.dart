import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Models/listing_configuration_model.dart';

class ListingConfigController extends GetxController {
  final token = GetStorage().read('token');
  var listingConfig = ListingConfiguration().obs;

  getConfiguration(categoryId) async {
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/listing/form?category_id=$categoryId';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );

    listingConfig.value = listingConfigurationFromJson(response.body);
  }
}
