// ignore_for_file: unused_local_variable, unused_element

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:lagosabuja/Bindings/bindings.dart';
import 'package:lagosabuja/Controllers/featuredListings.dart';
import 'package:lagosabuja/Controllers/location_controller.dart';
import 'package:lagosabuja/Controllers/categories_controller.dart';
import 'package:lagosabuja/Controllers/listings_controller.dart';
import 'package:lagosabuja/Controllers/my_payment_controller.dart';
import 'package:lagosabuja/Controllers/orders_controller.dart';
import 'package:lagosabuja/Controllers/plansController.dart';
import 'package:lagosabuja/Controllers/user_controller.dart';
import 'package:lagosabuja/Models/pushNotification_model.dart';
import 'Auth/sign_in.dart';
import 'Controllers/favorite_listing_controller.dart';
import 'Controllers/listing_type_controller.dart';
import 'Controllers/search_controller.dart';
import 'Home/home.dart';
import 'Utils/const.dart';
import 'Utils/global_widgets.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((token) {});
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.subscribeToTopic('courses');
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification!.title,
        body: message.notification!.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      AndroidNotification android = message.notification!.android!;
      showSimpleNotification(
        Text(notification.title!),
        leading: const Icon(Icons.notification_add),
        subtitle: Text(
          notification.body!,
        ),
        background: kGreen,
        duration: const Duration(seconds: 2),
      );
    });
  } else {}

  FirebaseMessaging.onMessageOpenedApp.listen(
    (RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification!.title,
        body: message.notification!.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      AndroidNotification android = message.notification!.android!;
      showSimpleNotification(
        Text(notification.title!),
        leading: Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
        subtitle: Text(
          notification.body!,
        ),
        background: kBlueColor,
        duration: const Duration(seconds: 2),
      );
    },
  );

  checkForInitialMessage() async {
    RemoteMessage? message = await messaging.getInitialMessage();
    if (message != null) {
      PushNotification notification = PushNotification(
        title: message.notification!.title,
        body: message.notification!.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
    }
  }

  await GetStorage.init();
  GetStorage().writeIfNull('isLoggedIn', false);
  if (GetStorage().read('isLoggedIn')) {
    Get.put(ListingController());
    Get.put(FavoriteListingController());
    Get.put(FeaturedListingController());
    Get.put(CategoriesController());
    Get.put(LocationsController());
    Get.put(ListingTypeController());
    Get.put(SearchController());
    Get.put(OrdersController());
    Get.put(MyPaymentsController());
    Get.put(PlansController());
    Get.put(UserController());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GetMaterialApp(
        initialBinding: MyBindings(),
        debugShowCheckedModeBanner: false,
        home:
            GetStorage().read('isLoggedIn') ? const Home() : const MyHomePage(),
      ),
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
            const Text(
              'Welcome',
              style: TextStyle(
                color: kGreen,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(logo),
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
