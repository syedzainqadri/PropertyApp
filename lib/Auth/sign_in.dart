import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lagosabuja/Auth/sign_up.dart';
import 'package:lagosabuja/Controllers/sign_in_controller.dart';
import 'package:lagosabuja/Controllers/socialAuthController/firebaseAuthController.dart';
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
                    textField('E-mail address', false, emailController,
                        onValidate: (v) => v!.isEmpty ? "Required" : null),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        validator: (v) => v!.isEmpty ? "Required" : null,
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: lightGreen,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 15, bottom: 20, top: 10),
                            // enabledBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            //   borderSide: const BorderSide(
                            //       color: mediumGrey, style: BorderStyle.solid, width: 1),
                            // ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(30),
                            //   borderSide: const BorderSide(
                            //       color: lightGreen, style: BorderStyle.solid, width: 1),
                            // ),
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: white,
                            labelText: "Enter Password",
                            alignLabelWithHint: true,
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    defaultButton(
                      'Log In',
                      () async {
                        if (formKey.currentState!.validate()) {
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
                    socialButton(
                        'Facebook Login',
                        const FaIcon(FontAwesomeIcons.facebook),
                        darkBlue,
                        () {}),
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
      ),
    );
  }
}
