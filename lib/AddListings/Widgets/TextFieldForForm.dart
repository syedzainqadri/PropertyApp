// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFieldWidgetForForm extends StatelessWidget {
  const TextFieldWidgetForForm({
    Key? key,
    required this.lable,
    required this.controller,
    required this.leadingIcon,
    required this.obsecure,
    this.trailing,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData leadingIcon;
  final Widget? trailing;
  final String lable;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
      ),
      child: TextField(
        // textAlign: TextAlign.center,
        obscureText: obsecure,
        controller: controller,
        cursorColor: Colors.black,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),

        decoration: InputDecoration(
            fillColor: Colors.black,
            border: InputBorder.none,
            // hintTextDirection: TextDirection.rtl,
            icon: Icon(
              leadingIcon,
              color: Colors.green,
            ),
            hintText: lable,
            hintStyle: const TextStyle(
              color: Colors.green,
              fontSize: 24,
            ),
            suffixIcon: trailing),
      ),
    );
  }
}
