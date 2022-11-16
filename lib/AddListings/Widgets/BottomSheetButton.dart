// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gharounda/Utils/const.dart';

class BottomSheetButton extends StatelessWidget {
  BottomSheetButton({
    Key? key,
    required this.iconColor,
    required this.width,
    required this.height,
    required this.buttonColor,
    required this.buttonText,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  Color? iconColor;
  Color? buttonColor;
  var buttonText;
  IconData icon;
  var onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              Text(
                buttonText,
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
