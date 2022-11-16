import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Auth/sign_up.dart';
import 'const.dart';

textField(hintText, obscureText, controller,
    {String? Function(String?)? onValidate,
    int? maxLine,
    TextInputType? textInputType}) {
  return Container(
    decoration: BoxDecoration(
        color: kLightGreyColor, borderRadius: BorderRadius.circular(8)),
    child: TextFormField(
      maxLines: maxLine,
      keyboardType: textInputType,
      validator: onValidate,
      controller: controller,
      obscureText: obscureText,
      cursorColor: kGreen,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15, bottom: 20, top: 10),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          fillColor: kWhite,
          labelText: hintText,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(color: kGreyColor, fontSize: 16)),
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
          color: kWhite,
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: kGreen,
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
          color: kWhite,
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
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
            color: kGreen,
            fontSize: 20,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kTransparent,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: const BorderSide(color: kDarkGrey),
        ),
      ),
    );
  }
}
