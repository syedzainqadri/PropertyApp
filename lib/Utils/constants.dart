import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Auth/sign_up.dart';
import 'color_scheme.dart';

textField(hintText, obscureText, controller, {String? Function (String?)? onValidate, int? maxLine, TextInputType? textInputType }) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8)
    ),
    child: TextFormField(
      maxLines: maxLine,
      keyboardType: textInputType,
      validator: onValidate,
      controller: controller,
      obscureText: obscureText,
      cursorColor: lightGreen,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15, bottom: 20, top: 10),
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
        labelText: hintText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16
        )
      ),
    ),
  );
}

defaultButton(title, onPressed) {
  return SizedBox(
    width: double.infinity,
    height: 49,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

socialButton(title, icon, color, onTap) {
  return SizedBox(
    width: double.infinity,
    height: 49,
    child: ElevatedButton.icon(
      icon: icon,
      onPressed: onTap,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
