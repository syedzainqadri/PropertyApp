// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/featuredLisitngModel.dart';

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
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/listings?promotion_in[]=featured';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    featuredListing.value = featuredListingsFromJson(response.body);
    isLoading.value = false;
  }
}
