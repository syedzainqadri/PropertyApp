// ignore_for_file: file_names, unused_local_variable

import 'dart:convert';
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
import 'package:gharounda/Models/sign_in_model.dart';
import 'package:gharounda/Utils/const.dart';

class SocialSignInController extends GetxController {
  Rx<SignInModel> signInModel = SignInModel().obs;

  signInWithGoogle(googleIDToken) async {
    var response = await http
        .post(Uri.parse(socialLoginUrl),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'X-API-KEY': apiKey,
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
      Get.put(ChatController());
      Get.put(CategoriesController());
      Get.put(LocationsController());
      Get.put(ListingTypeController());
      Get.offAll(const Home());
    });
  }
}
