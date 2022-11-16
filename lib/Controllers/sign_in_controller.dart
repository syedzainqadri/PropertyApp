import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Controllers/categories_controller.dart';
import 'package:gharounda/Controllers/chat_controller.dart';
import 'package:gharounda/Controllers/favorite_listing_controller.dart';
import 'package:gharounda/Controllers/listing_type_controller.dart';
import 'package:gharounda/Controllers/listings_controller.dart';
import 'package:gharounda/Controllers/location_controller.dart';
import 'package:gharounda/Controllers/my_listings_controller.dart';
import 'package:gharounda/Home/home.dart';
import 'package:gharounda/Utils/const.dart';
import '../Models/sign_in_model.dart';

class SignInController extends GetxController {
  Rx<SignInModel> signInModel = SignInModel().obs;

  signIn(username, password) async {
    Get.defaultDialog(
        title: "",
        content: Container(
          color: kWhite,
          child: Column(
            children: const [
              Center(
                child: CircularProgressIndicator(
                  color: kGreen,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "SigningIn! please wait",
                style: TextStyle(color: kLightBlackColor),
              )
            ],
          ),
        ));
    var response = await http.post(
      Uri.parse(loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': apiKey,
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
      Get.back();
      Get.offAll(const Home());
    } else {
      Get.back();
      Get.snackbar('Error', 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kRedColor,
          icon: const Icon(Icons.error, color: kWhite));
    }
  }
}
