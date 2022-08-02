import 'package:get/get.dart';
import 'package:lagosabuja/Controllers/categories_controller.dart';
import 'package:lagosabuja/Controllers/chat_controller.dart';
import 'package:lagosabuja/Controllers/favorite_listing_controller.dart';
import 'package:lagosabuja/Controllers/featuredListings.dart';
import 'package:lagosabuja/Controllers/listings_controller.dart';
import 'package:lagosabuja/Controllers/my_listings_controller.dart';
import 'package:lagosabuja/Controllers/socialAuthController/firebaseAuthController.dart';
import 'package:lagosabuja/Controllers/socialAuthController/socialAuthController.dart';
import 'package:lagosabuja/Controllers/user_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListingController>(() => ListingController(), fenix: true);
    Get.lazyPut<FeaturedListingController>(() => FeaturedListingController(),
        fenix: true);
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
