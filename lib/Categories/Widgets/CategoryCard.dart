import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Categories/categories.dart';
import 'package:realestapp/Utils/color_scheme.dart';

class CategoryCard extends StatelessWidget {
  var image;
  var title;
  var id;
  CategoryCard({this.id, this.image, this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}