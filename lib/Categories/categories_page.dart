import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/categories_controller.dart';
import 'package:realestapp/Models/Categories/category_model.dart';
import '../Controllers/listings_controller.dart';
import '../Utils/color_scheme.dart';
import 'categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final ListingController listingController = Get.put(ListingController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listingController.categories.length,
      itemBuilder: (context, position) {
        return categoriesWidget(
            listingController.categories.value[position].icon!.url,
            listingController.categories.value[position].name,
            listingController.categories.value[position].termId);
      }, //listings[position].images[0].urlString.substring(int startIndex, [ int endIndex ])
    );
  }

  @override
  void dispose() {
    listingController.dispose();
    super.dispose();
  }
}

categoriesWidget(image, title, id) {
  return GestureDetector(
    onTap: () {
      Get.to(Category(
        title: title,
        id: id,
      ));
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
