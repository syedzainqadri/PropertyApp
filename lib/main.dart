import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Bindings/bindings.dart';
import 'package:realestapp/Controllers/location_controller.dart';
import 'package:realestapp/Controllers/categories_controller.dart';
import 'package:realestapp/Controllers/chat_controller.dart';
import 'package:realestapp/Controllers/listings_controller.dart';
import 'package:realestapp/Controllers/my_payment_controller.dart';
import 'package:realestapp/Controllers/orders_controller.dart';
import 'package:realestapp/Controllers/plansController.dart';
import 'Auth/sign_in.dart';
import 'Controllers/favorite_listing_controller.dart';
import 'Controllers/listing_type_controller.dart';
import 'Controllers/my_listings_controller.dart';
import 'Controllers/search_controller.dart';
import 'Home/home.dart';
import 'Utils/color_scheme.dart';
import 'Utils/constants.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  GetStorage().writeIfNull('isLoggedIn', false);
  if (GetStorage().read('isLoggedIn')) {
    Get.put(ListingController());
    Get.put(FavoriteListingController());
    // Get.put(MyListingController());
    Get.put(ChatController());
    Get.put(CategoriesController());
    Get.put(LocationsController());
    Get.put(ListingTypeController());
    Get.put(SearchController());
    Get.put(OrdersController());
    Get.put(MyPaymentsController());
    Get.put(PlansController());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      home: GetStorage().read('isLoggedIn') ? const Home() : const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_pin,
              color: lightGreen,
              size: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome to Real Estate',
              style: TextStyle(
                color: lightGreen,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            defaultButton('Log In', () {
              Get.to(const SignIn());
            }),
            const SizedBox(
              height: 20,
            ),
            const SignupButton(),
          ],
        ),
      ),
    );
  }
}
