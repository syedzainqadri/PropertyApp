import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Utils/const.dart';

class CustomFullScreenDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: const Center(
          child: CircularProgressIndicator(
            color: kGreen,
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Colors.white,
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
