import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Utils/const.dart';
import '../Models/listing_configuration_model.dart';

class ListingConfigController extends GetxController {
  final token = GetStorage().read('token');
  var listingConfig = ListingConfiguration().obs;

  getConfiguration(categoryId) async {
    String url = listingConfigUrl + categoryId;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );

    listingConfig.value = listingConfigurationFromJson(response.body);
  }
}
