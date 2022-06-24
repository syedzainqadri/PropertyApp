import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Home/widgets/CategoryCard.dart';
import '../AddListings/list_widget.dart';
import '../Controllers/categories_controller.dart';
import '../Controllers/favorite_listing_controller.dart';
import '../Controllers/listings_controller.dart';
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
    final listingController = Get.put(ListingController());
    final categoriesController = Get.put(CategoriesController());
    final favoriteListingController = Get.put(FavoriteListingController());
    return Obx(() {
      return listingController.isLoading.isTrue &&
              categoriesController.categories.value != null &&
              categoriesController.subCategories.value != null &&
              favoriteListingController.favoriteListings.value != null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Obx(
                            () => categoriesController.categories.value == null
                                ? const CircularProgressIndicator(
                                    color: Colors.greenAccent,
                                  )
                                : SizedBox(
                                    height: 120,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: categoriesController
                                          .categories.value.length,
                                      itemBuilder: (context, position) {
                                        return CategoryCard(
                                            image: categoriesController
                                                .categories
                                                .value[position]
                                                .icon!
                                                .url,
                                            name: categoriesController
                                                .categories
                                                .value[position]
                                                .name,
                                            id: categoriesController.categories
                                                .value[position].termId);
                                      }, //listings[position].images[0].urlString.substring(int startIndex, [ int endIndex ])
                                    ),
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
                            itemCount: listingController
                                .allListings.value.data?.length,
                            itemBuilder: (context, index) {
                              bool isFav = false;
                              for (int i = 0;
                                  i <
                                      listingController
                                          .allListings.value.data!.length;
                                  i++) {
                                if (listingController.allListings.value
                                        .data?[index].listingId ==
                                    favoriteListingController.favoriteListings
                                        .value.data?[index].listingId) {
                                  print("matched");
                                  setState(() {
                                    isFav = true;
                                  });
                                }
                                print("not matched");
                              }
                              return ListingCard(
                                image: listingController
                                    .allListings.value.data?[index].images,
                                title: listingController
                                    .allListings.value.data?[index].title
                                    .toString(),
                                city: listingController.allListings.value
                                    .data?[index].contact!.locations![0].name
                                    .toString(),
                                price: listingController
                                    .allListings.value.data?[index].price
                                    .toString(),
                                isFovorite: isFav,
                                description: 'This is description',
                                listingId: listingController
                                    .allListings.value.data?[index].listingId,
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
    });
  }
}
