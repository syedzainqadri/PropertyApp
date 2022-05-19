import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/AllListings/all_listings.dart';

class ListingController extends GetxController {
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
    var x = jsonDecode(response.body)['data'] as List;
    var mylist =
        x.map((listingsJson) => AllListings.fromJson(listingsJson)).toList();
        print(mylist[0].ad_type);
    return response.body;
  }
}
