import 'package:get/get.dart';
import 'package:realestapp/Controllers/categories_controller.dart';
import 'package:realestapp/Controllers/chat_controller.dart';
import 'package:realestapp/Controllers/listings_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListingController());
    Get.lazyPut(() => CategoriesController());
    Get.lazyPut(() => ChatController());;
    
  }
}
