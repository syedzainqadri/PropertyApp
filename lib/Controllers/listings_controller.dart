import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/all_listing_model.dart';


class ListingController extends GetxController {
  var allListings = AllListings().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getAllListing();
    getCategories();
    getMyListing();
    getMyFavorites();
    super.onInit();
  }

  getCategories() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/categories';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
  }

  getListingTypes() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listing-types';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
  }

  getAllListing() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listings';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    allListings.value =  allListingsFromJson(response.body);
  }

  getMyListing() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/my/listings';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    return response.body;
  }

  getMyFavorites() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/my/favourites';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    return response.body;
  }
}
