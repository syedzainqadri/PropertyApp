import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Auth/sign_in.dart';
import 'package:realestapp/Controllers/sign_up_controller.dart';
import '../Home/home.dart';
import '../Models/sign_in_model.dart';
import '../Utils/constants.dart';
import '../Utils/color_scheme.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignInModel user;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  final SignUpController _signUpController = SignUpController();
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
                    'Create New Account',
                    style: TextStyle(
                      color: lightGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Center(
                  //   child: Badge(
                  //     badgeColor: lightGreen,
                  //     badgeContent: const Icon(
                  //       Icons.camera_alt,
                  //       color: white,
                  //     ),
                  //     position: const BadgePosition(bottom: 1, end: 1),
                  //     child: Container(
                  //       width: 100,
                  //       height: 100,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         border: Border.all(color: mediumGrey),
                  //         image: const DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: AssetImage('assets/images/1.png'),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  textField('First Name', false, firstNameController),
                  const SizedBox(
                    height: 15,
                  ),
                  textField('Last Name', false, lastNameController),
                  const SizedBox(
                    height: 15,
                  ),
                  textField('Phone No', false, phoneController),
                  const SizedBox(
                    height: 15,
                  ),
                  textField('E-mail address', false, emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  textField('User Name', false, userNameController),
                  const SizedBox(
                    height: 15,
                  ),
                  textField('Password', true, passwordController),
                  const SizedBox(
                    height: 15,
                  ),
                  textField(
                      'Confirm Password', true, confirmPasswordController),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultButton('Sign Up', () async {
                    user = await _signUpController.signUp(
                        userNameController.text,
                        emailController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text,
                        phoneController.text);
                    Get.to(const Home());
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  // const Center(child: Text('OR')),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an Account? "),
                      InkWell(
                        onTap: () {
                          Get.to(const SignIn());
                        },
                        child: const Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: lightGreen,
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
