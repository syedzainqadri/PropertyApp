import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AddListings/list_widget.dart';
import '../Categories/categories.dart';
import '../Controllers/categories_controller.dart';
import '../Controllers/listings_controller.dart';
import '../Models/Categories/category_model.dart';
import '../Utils/color_scheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final CategoriesController _categoriesController = CategoriesController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listingController = Get.find<ListingController>();
    final categoriesController = Get.find<CategoriesController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => categoriesController.categories.value == null
                      ? const CircularProgressIndicator(
                          color: Colors.greenAccent,
                        )
                      : SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                categoriesController.categories.value.length,
                            itemBuilder: (context, position) {
                              return categoryCard(
                                  categoriesController
                                      .categories.value[position].icon!.url,
                                  categoriesController
                                      .categories.value[position].name,
                                  categoriesController
                                      .categories.value[position].termId);
                            }, //listings[position].images[0].urlString.substring(int startIndex, [ int endIndex ])
                          ),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Top Listings',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Obx(
            () => listingController.allListings.value.data == null
                ? const CircularProgressIndicator(
                    color: Colors.greenAccent,
                  )
                : GridView.builder(
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listingController.allListings.value.data?.length,
                    itemBuilder: (context, index) {
                      return listWidget(
                        listingController.allListings.value.data?[index].images,
                        listingController.allListings.value.data?[index].title
                            .toString(),
                        listingController.allListings.value.data?[index]
                            .contact!.locations![0].name
                            .toString(),
                        listingController.allListings.value.data?[index].price
                            .toString(),
                        true,
                        'This is description',
                        listingController
                            .allListings.value.data?[index].listingId,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  categoryCard(image, name, id) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Get.to(Category(
            title: name,
            id: id,
          ));
        },
        child: Container(
          height: 120,
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
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  ),
                ),
              ),
              Center(child: Text(name)),
            ]),
          ),
        ),
      ),
    );
  }
}
