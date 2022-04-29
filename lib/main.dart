import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Auth/sign_in.dart';
import 'Auth/sign_up.dart';
import 'Utils/color_scheme.dart';
import 'Utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home:  MyHomePage(),
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
      body: Column(
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
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          defaultButton('Log In', const SignIn()),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 28.0),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const SignUp());
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: lightGreen,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: transparent,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  side: const BorderSide(color: darkGrey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
