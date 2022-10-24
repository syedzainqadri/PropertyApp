// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Categories/Widgets/CategoryCard.dart';
import 'package:lagosabuja/Controllers/categories_controller.dart';
import '../Utils/const.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesController = Get.find<CategoriesController>();
    return Obx(
      () => categoriesController.categories == null
          ? const CircularProgressIndicator(
              color: kGreen,
            )
          : ListView.builder(
              itemCount: categoriesController.categories.length,
              itemBuilder: (context, i) {
                return CategoryCard(
                    image: categoriesController.categories[i].icon!.url,
                    title: categoriesController.categories[i].name,
                    id: categoriesController.categories[i].termId);
              },
            ),
    );
  }
}
