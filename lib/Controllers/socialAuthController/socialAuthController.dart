// ignore_for_file: file_names, unused_local_variable

import 'dart:convert';
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
import 'package:lagosabuja/Controllers/profile_controller.dart';
import 'package:lagosabuja/Controllers/user_controller.dart';
import 'package:lagosabuja/Home/home.dart';
import 'package:lagosabuja/Models/sign_in_model.dart';

class SocialSignInController extends GetxController {
  Rx<SignInModel> signInModel = SignInModel().obs;

  signInWithGoogle(googleIDToken) async {
    var response = await http
        .post(Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/social-login"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
            },
            body: jsonEncode(<String, dynamic>{
              'access_token': googleIDToken,
              'type': "google_firebase",
            }))
        .then((response) {
      signInModel.value = SignInModel.fromJson(response.body);
      GetStorage().write('isLoggedIn', true);
      GetStorage().write('token', signInModel.value.token);

      Get.put(ListingController());
      Get.put(FavoriteListingController());
      Get.put(MyListingController());
      Get.put(UserController());
      Get.put(ProfileController());
      Get.put(ChatController());
      Get.put(CategoriesController());
      Get.put(LocationsController());
      Get.put(ListingTypeController());
      Get.offAll(const Home());
    });
  }
}
