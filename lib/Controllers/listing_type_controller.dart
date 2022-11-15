import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/listing_types_model.dart';
import 'package:lagosabuja/Utils/const.dart';

class ListingTypeController extends GetxController {
  final token = GetStorage().read('token');
  var listingTypes = <ListingTypes>[].obs;

  @override
  onInit() {
    getListingTypes();
    super.onInit();
  }

  getListingTypes() async {
    String url = listingTypeUrl;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );

    listingTypes.value = listingTypesFromJson(response.body);
  }
}
