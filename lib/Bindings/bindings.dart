import 'package:get/get.dart';
import 'package:realestapp/Controllers/categories_controller.dart';
import 'package:realestapp/Controllers/chat_controller.dart';
import 'package:realestapp/Controllers/favorite_listing_controller.dart';
import 'package:realestapp/Controllers/listings_controller.dart';
import 'package:realestapp/Controllers/my_listings_controller.dart';
import 'package:realestapp/Controllers/socialAuthController/firebaseAuthController.dart';
import 'package:realestapp/Controllers/socialAuthController/socialAuthController.dart';
import 'package:realestapp/Controllers/user_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListingController>(() => ListingController(), fenix: true);
    Get.lazyPut(() => FavoriteListingController(), fenix: true);
    Get.lazyPut(() => MyListingController());
    Get.lazyPut(() => CategoriesController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut<MyListingController>(() => MyListingController(), fenix: true);
    Get.lazyPut<FirebaseAuthController>(() => FirebaseAuthController(),
        fenix: true);
    Get.lazyPut<SocialSignInController>(() => SocialSignInController(),
        fenix: true);
  }
}
