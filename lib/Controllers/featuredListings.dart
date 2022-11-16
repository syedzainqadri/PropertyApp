// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Models/featuredLisitngModel.dart';
import 'package:gharounda/Utils/const.dart';

class FeaturedListingController extends GetxController {
  var isLoading = false.obs;
  var featuredListing = FeaturedListings().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getFeaturedListing();
    super.onInit();
  }

  getFeaturedListing() async {
    isLoading.value = true;
    String url = featuredListingUrl;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
      },
    );
    featuredListing.value = featuredListingsFromJson(response.body);
    isLoading.value = false;
  }
}
