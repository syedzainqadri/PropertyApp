
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Home/home.dart';
import '../Utils/color_scheme.dart';
import 'package:get/get.dart';
import '../Utils/constants.dart';
import 'sign_in_phone.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              size: 35,
              color: lightGreen,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              textField('E-mail address', false),
              const SizedBox(
                height: 15,
              ),
              textField('Password', false),
              const SizedBox(
                height: 35,
              ),
              defaultButton('Log In', const Home()),
              const SizedBox(
                height: 15,
              ),
            const  Center(child:  Text('OR')),
              const SizedBox(
                height: 15,
              ),
              socialButton('Facebook Login',  const FaIcon(FontAwesomeIcons.facebook), darkBlue),
              const SizedBox(
                height: 15,
              ),
              socialButton('Google Login', const FaIcon(FontAwesomeIcons.google), brightRed),
              const SizedBox(
                height: 15,
              ),
              socialButton('LinkedIn Login',  const FaIcon(FontAwesomeIcons.linkedin),mediumBlue),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const SignInPhone());
                },
                child: const Center(
                  child:  Text(
                    'Login with phone number',
                    style: TextStyle(
                      color: lightBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
