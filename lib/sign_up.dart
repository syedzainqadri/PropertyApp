import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:realestapp/color_scheme.dart';
import 'package:get/get.dart';
import 'package:realestapp/contants.dart';
import 'home.dart';
import 'sign_up_phone.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                'Create New Account',
                style: TextStyle(
                  color: lightGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Badge(
                  badgeColor: lightGreen,
                  badgeContent: const Icon(
                    Icons.camera_alt,
                    color: white,
                  ),
                  position: const BadgePosition(bottom: 1, end: 1),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: mediumGrey),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/1.png'),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              textField('First Name', false),
              const SizedBox(
                height: 15,
              ),
              textField('Last Name', false),
              const SizedBox(
                height: 15,
              ),
              textField('E-mail address', false),
              const SizedBox(
                height: 15,
              ),
              textField('Password', true),
              const SizedBox(
                height: 15,
              ),
              textField('Confirm Password', true),
              const SizedBox(
                height: 15,
              ),
              defaultButton('Sign Up', const Home()),
              const SizedBox(
                height: 15,
              ),
              const Center(child: Text('OR')),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const SignUpPhone());
                },
                child: const Center(
                  child: Text(
                    'Sign up with phone number',
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
