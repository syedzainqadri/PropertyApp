// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/favorite_listing_model.dart';
import 'package:lagosabuja/Utils/const.dart';

class FavoriteListingController extends GetxController {
  var isLoading = false.obs;
  var favoriteListings = FavoriteListings().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getMyFavorites();
    super.onInit();
  }

  getMyFavorites() async {
    isLoading.value = true;
    String url = favUrl;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    favoriteListings.value = favoriteListingsFromJson(response.body);
    isLoading.value = false;
  }

  addToFavorites(listingId) async {
    isLoading.value = true;
    String url = favUrl;
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
      body: <String, dynamic>{
        'listing_id': listingId.toString(),
      },
    );
    Get.snackbar('Success', 'Listing Updated',
        backgroundColor: kGreen,
        colorText: white,
        snackPosition: SnackPosition.BOTTOM);
    getMyFavorites();
    isLoading.value = false;
  }
}
