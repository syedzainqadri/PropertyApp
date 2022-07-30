import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realestapp/Auth/sign_up.dart';
import 'package:realestapp/Controllers/sign_in_controller.dart';
import 'package:realestapp/Controllers/socialAuthController/firebaseAuthController.dart';
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
  final FirebaseAuthController _firebaseAuthController =
      FirebaseAuthController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  // final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Form(
                key: formKey,
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
                    textField(
                        'E-mail address',
                        false,
                        emailController,
                      onValidate: (v)=> v!.isEmpty? "Required" : null
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    textField(
                        'Password',
                        true,
                        passwordController,
                        onValidate: (v)=> v!.isEmpty? "Required" : null
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    defaultButton(
                      'Log In',
                      () async {
                        if(formKey.currentState!.validate()){
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return Dialog(
                          //         child: Container(
                          //           color: Colors.white,
                          //           height: 200,
                          //           width: 200,
                          //           child: Center(
                          //             child: CircularProgressIndicator(),
                          //           ),
                          //         ),
                          //       );
                          //     });
                          await _signInController.signIn(
                              emailController.text, passwordController.text);
                        }
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
                        const FaIcon(FontAwesomeIcons.google), brightRed, () {
                      _firebaseAuthController.googleLogin();
                    }),
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
      ),
    );
  }
}
