import 'package:flutter/material.dart';
import 'const.dart';

textField(hintText, obscureText, controller,
    {String? Function(String?)? onValidate,
    int? maxLine,
    TextInputType? textInputType}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
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
          fillColor: white,
          labelText: hintText,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16)),
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
          color: white,
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
  SignupButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  String text;
  dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          'Text',
          style: TextStyle(
            color: kGreen,
            fontSize: 20,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: transparent,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: const BorderSide(color: darkGrey),
        ),
      ),
    );
  }
}
