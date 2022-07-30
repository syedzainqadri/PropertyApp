import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Home/widgets/CategoryCard.dart';
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
    Get.put(ListingController());
    Get.put(CategoriesController());
    final listingController = Get.find<ListingController>();
    final categoriesController = Get.find<CategoriesController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'All Categories',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Obx(
                    () => categoriesController.categories.value == null
                        ? const CircularProgressIndicator(
                            color: Colors.greenAccent,
                          )
                        : SizedBox(
                            height: 140,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  categoriesController.categories.value.length,
                              itemBuilder: (context, position) {
                                return CategoryCard(
                                    image: categoriesController
                                        .categories.value[position].icon!.url,
                                    name: categoriesController
                                        .categories.value[position].name,
                                    id: categoriesController
                                        .categories.value[position].termId);
                              }, //listings[position].images[0].urlString.substring(int startIndex, [ int endIndex ])
                            ),
                          ),
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                const Text(
                  'All Listings',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
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
                      itemCount:
                          listingController.allListings.value.data?.length,
                      itemBuilder: (context, index) {
                        return ListingCard(
                          image: listingController
                              .allListings.value.data?[index].images,
                          title: listingController
                              .allListings.value.data?[index].title
                              .toString(),
                          city: listingController.allListings.value.data?[index]
                              .contact!.locations![0].name
                              .toString(),
                          price: listingController
                              .allListings.value.data?[index].price
                              .toString(),
                          isFovorite: true,
                          description: 'This is description',
                          listingId: listingController
                              .allListings.value.data?[index].listingId,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
