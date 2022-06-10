import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                return categoriesWidget(
                    categoriesController.categories[i].icon!.url,
                    categoriesController.categories[i].name,
                    categoriesController.categories[i].termId);
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

categoriesWidget(image, title, id) {
  return GestureDetector(
    onTap: () {
      Get.to(CategoryPage(
        title: title,
        id: id,
      ));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(color: white, fontSize: 25),
            )),
          ),
        ],
      ),
    ),
  );
}
