import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Categories/Widgets/CategoryCard.dart';
import 'package:realestapp/Controllers/categories_controller.dart';
import '../Utils/color_scheme.dart';
import 'categories.dart';

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
          ? CircularProgressIndicator(
              color: Colors.greenAccent,
            )
          : ListView.builder(
              itemCount: categoriesController.categories.length,
              itemBuilder: (context, i) {
                return CategoryCard(
                    image: categoriesController.categories[i].icon!.url,
                    title: categoriesController.categories[i].name,
                    id: categoriesController.categories[i].termId);
              }, //listings[position].images[0].urlString.substring(int startIndex, [ int endIndex ])
            ),
    );
  }

  @override
  void dispose() {
    // categoriesController.dispose();
    super.dispose();
  }
}
