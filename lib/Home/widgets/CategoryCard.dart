import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Categories/categories.dart';

class CategoryCard extends StatelessWidget {
  var id;
  var image;
  var name;
  CategoryCard(
      {@required this.id, @required this.image, @required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Get.to(CategoryPage(
            title: name,
            id: id,
          ));
        },
        child: Container(
          height: 140,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
            elevation: 1.0,
            child: Column(children: [
              Container(
                width: 120,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(image),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                name,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5),
              )),
            ]),
          ),
        ),
      ),
    );
  }
}
