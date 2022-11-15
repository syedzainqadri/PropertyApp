import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Controllers/categories_controller.dart';
import 'package:lagosabuja/Controllers/chat_controller.dart';
import 'package:lagosabuja/Controllers/favorite_listing_controller.dart';
import 'package:lagosabuja/Controllers/listing_type_controller.dart';
import 'package:lagosabuja/Controllers/listings_controller.dart';
import 'package:lagosabuja/Controllers/location_controller.dart';
import 'package:lagosabuja/Controllers/my_listings_controller.dart';
import 'package:lagosabuja/Home/home.dart';
import 'package:lagosabuja/Utils/const.dart';
import '../Models/sign_in_model.dart';

class SignInController extends GetxController {
  Rx<SignInModel> signInModel = SignInModel().obs;

  signIn(username, password) async {
    Get.defaultDialog(
        title: "",
        content: Container(
          color: Colors.white,
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
                style: TextStyle(color: Colors.black38),
              )
            ],
          ),
        ));
    var response = await http.post(
      Uri.parse(loginUrl),
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
      Get.back();
      Get.offAll(const Home());
    } else {
      Get.back();
      Get.snackbar('Error', 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: Colors.white));
    }
  }
}
