import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/listing_types_model.dart';

class ListingTypeController extends GetxController {
  final token = GetStorage().read('token');
  var listingTypes = <ListingTypes>[].obs;

  @override
  onInit() {
    getListingTypes();
    super.onInit();
  }

  getListingTypes() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listing-types';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    listingTypes.value = listingTypesFromJson(response.body);
  }
}
