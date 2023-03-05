import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../Models/config_model/config.dart';
import '../../Models/config_model/new_listing_config.dart';

class ConfigController extends GetxController {
  var config = ConfigModel().obs;
  final token = GetStorage().read('token');
  var newListingConfig = NewListingConfig().obs;
  @override
  onInit() {
    getConfig();
    getNewListingConfig();
    super.onInit();
  }

  getConfig() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/config';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    if (response.statusCode == 200) {
      config.value = configModelFromJson(response.body);
    } else {}
  }

  getNewListingConfig() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/config-new-listing';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      newListingConfig.value = newListingConfigFromJson(response.body);
    } else {}
  }
}
