// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Categories/Widgets/CategoryCard.dart';
import 'package:lagosabuja/Controllers/categories_controller.dart';
import '../Utils/const.dart';

class CategoriesPage extends GetView<CategoriesController> {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.categories == null
          ? const CircularProgressIndicator(
              color: kGreen,
            )
          : ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (context, i) {
                return CategoryCard(
                    image: controller.categories[i].icon!.url,
                    title: controller.categories[i].name,
                    id: controller.categories[i].termId);
              },
            ),
    );
  }
}
