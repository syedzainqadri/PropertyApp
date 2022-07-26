import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Controllers/categories_controller.dart';
import 'package:realestapp/Controllers/chat_controller.dart';
import 'package:realestapp/Controllers/favorite_listing_controller.dart';
import 'package:realestapp/Controllers/listing_type_controller.dart';
import 'package:realestapp/Controllers/listings_controller.dart';
import 'package:realestapp/Controllers/location_controller.dart';
import 'package:realestapp/Controllers/my_listings_controller.dart';
import 'package:realestapp/Home/home.dart';
import '../Models/sign_in_model.dart';

class SignInController extends GetxController {
  Rx<SignInModel> signInModel = SignInModel().obs;

  signIn(username, password) async {
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username.toString(),
        'password': password.toString(),
      }),
    );
    signInModel.value = SignInModel.fromJson(response.body);
    if (response.statusCode == 200) {
      await GetStorage().write('isLoggedIn', true);
      await GetStorage().write('token', signInModel.value.token);
      Get.put(ListingController());
      Get.put(FavoriteListingController());
      Get.put(MyListingController());
      Get.put(ChatController());
      Get.put(CategoriesController());
      Get.put(LocationsController());
      Get.put(ListingTypeController());
      Get.put(ListingTypeController());
      Get.offAll(const Home());
    } else {
      Get.snackbar('Error', 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          icon: Icon(Icons.error, color: Colors.white));
    }
  }
}
