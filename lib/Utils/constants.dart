import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Auth/sign_up.dart';
import 'color_scheme.dart';

textField(hintText, obscureText, controller) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    cursorColor: lightGreen,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
            color: mediumGrey, style: BorderStyle.solid, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
            color: lightGreen, style: BorderStyle.solid, width: 1),
      ),
      fillColor: white,
      hintText: hintText,
    ),
  );
}

defaultButton(title, onPressed) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: white,
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: lightGreen,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}

socialButton(title, icon, color) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: ElevatedButton.icon(
      icon: icon,
      onPressed: () {},
      label: Text(
        title,
        style: const TextStyle(
          color: white,
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: const BorderSide(color: darkGrey),
        ),
      ),
    );
  }
}
