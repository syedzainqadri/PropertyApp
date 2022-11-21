import 'package:get/get.dart';
import 'package:gharounda/Controllers/categories_controller.dart';
import 'package:gharounda/Controllers/chat_controller.dart';
import 'package:gharounda/Controllers/favorite_listing_controller.dart';
import 'package:gharounda/Controllers/featuredListings.dart';
import 'package:gharounda/Controllers/listings_controller.dart';
import 'package:gharounda/Controllers/my_listings_controller.dart';
import 'package:gharounda/Controllers/socialAuthController/firebaseAuthController.dart';
import 'package:gharounda/Controllers/socialAuthController/socialAuthController.dart';
import 'package:gharounda/Controllers/user_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListingController>(() => ListingController(), fenix: true);
    Get.lazyPut<FeaturedListingController>(() => FeaturedListingController(),
        fenix: true);
    Get.lazyPut<FavoriteListingController>(() => FavoriteListingController(),
        fenix: true);
    Get.lazyPut(() => MyListingController());
    Get.lazyPut<CategoriesController>(() => CategoriesController(),
        fenix: true);
    Get.lazyPut<ChatController>(() => ChatController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<MyListingController>(() => MyListingController(), fenix: true);
    Get.lazyPut<FirebaseAuthController>(() => FirebaseAuthController(),
        fenix: true);
    Get.lazyPut<SocialSignInController>(() => SocialSignInController(),
        fenix: true);
  }
}
