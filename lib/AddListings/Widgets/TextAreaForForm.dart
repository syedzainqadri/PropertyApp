// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lagosabuja/Utils/const.dart';

class TextAreaWidgetForForm extends StatelessWidget {
  const TextAreaWidgetForForm({
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
      height: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all()),
      child: TextField(
        maxLines: 8,
        obscureText: obsecure,
        controller: controller,
        cursorColor: kBlackColor,
        style: const TextStyle(
          color: kBlackColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
            fillColor: kBlackColor,
            border: InputBorder.none,
            icon: Icon(
              leadingIcon,
              color: kGreenColor,
            ),
            hintText: lable,
            hintStyle: const TextStyle(
              color: kGreenColor,
              fontSize: 24,
            ),
            suffixIcon: trailing),
      ),
    );
  }
}
