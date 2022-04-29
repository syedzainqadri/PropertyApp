import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/categories.dart';

import 'color_scheme.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          categoriesWidget('house1', 'Houses'),
          categoriesWidget('condo1', 'Condos'),
          categoriesWidget('apartment', 'Apartments'),
          categoriesWidget('building', 'Buildings'),
          categoriesWidget('townhouse', 'Town Houses'),
          categoriesWidget('land', 'Land'),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

categoriesWidget(image, title) {
  return GestureDetector(
    onTap: () {
      Get.to(Category(title: title));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/$image.png'),
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
