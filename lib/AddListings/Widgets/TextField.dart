// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gharounda/Utils/const.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
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
        color: kGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: obsecure,
        controller: controller,
        cursorColor: kBlackColor,
        style: const TextStyle(
          color: kGreen,
          fontSize: 24,
        ),
        decoration: InputDecoration(
            fillColor: kBlackColor,
            border: InputBorder.none,
            icon: Icon(
              leadingIcon,
              color: kGreen,
            ),
            hintText: lable,
            hintStyle: const TextStyle(
              color: kGreen,
              fontSize: 24,
            ),
            suffixIcon: trailing),
      ),
    );
  }
}
