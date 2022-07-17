import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realestapp/Auth/sign_up.dart';
import 'package:realestapp/Controllers/sign_in_controller.dart';
import '../Controllers/location_controller.dart';
import '../Controllers/categories_controller.dart';
import '../Controllers/chat_controller.dart';
import '../Controllers/favorite_listing_controller.dart';
import '../Controllers/listing_type_controller.dart';
import '../Controllers/listings_controller.dart';
import '../Controllers/my_listings_controller.dart';
import '../Home/home.dart';
import '../Utils/color_scheme.dart';
import 'package:get/get.dart';
import '../Utils/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final SignInController _signInController = SignInController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      color: lightGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  textField('E-mail address', false, emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  textField('Password', false, passwordController),
                  const SizedBox(
                    height: 35,
                  ),
                  defaultButton(
                    'Log In',
                    () async {
                      await _signInController.signIn(
                          emailController.text, passwordController.text);

                      GetStorage().write('isLoggedIn', true);
                      GetStorage().write(
                          'token', _signInController.signInModel.value.token);

                      Get.put(ListingController());
                      Get.put(FavoriteListingController());
                      Get.put(MyListingController());
                      Get.put(ChatController());
                      Get.put(CategoriesController());
                      Get.put(LocationsController());
                      Get.put(ListingTypeController());
                      Get.put(ListingTypeController());
                      Get.offAll(const Home());
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(child: Text('OR')),
                  const SizedBox(
                    height: 15,
                  ),
                  socialButton('Facebook Login',
                      const FaIcon(FontAwesomeIcons.facebook), darkBlue, () {}),
                  const SizedBox(
                    height: 15,
                  ),
                  socialButton('Google Login',
                      const FaIcon(FontAwesomeIcons.google), brightRed, () {}),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account? "),
                      InkWell(
                        onTap: () {
                          Get.to(const SignUp());
                        },
                        child: const Center(
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: brightRed,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
