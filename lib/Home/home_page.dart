import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/AddListings/featuredListingCard.dart';
import 'package:lagosabuja/Controllers/featuredListings.dart';
import 'package:lagosabuja/Home/widgets/CategoryCard.dart';
import '../AddListings/list_widget.dart';
import '../Controllers/categories_controller.dart';
import '../Controllers/listings_controller.dart';
import '../Utils/color_scheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ListingController());
    Get.put(CategoriesController());
    final listingController = Get.find<ListingController>();
    final featuredListingController = Get.find<FeaturedListingController>();
    final categoriesController = Get.find<CategoriesController>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () => listingController.allListings.value.data == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: lightGreen,
                    ),
                  ],
                )
              : Column(
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
                            () => SizedBox(
                              height: 140,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categoriesController
                                    .categories.value.length,
                                itemBuilder: (context, position) {
                                  return CategoryCard(
                                      image: categoriesController
                                          .categories.value[position].icon!.url,
                                      name: categoriesController
                                          .categories.value[position].name,
                                      id: categoriesController
                                          .categories.value[position].termId);
                                },
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Featured Listings',
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
                            () => featuredListingController
                                        .featuredListing.value.data ==
                                    null
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: lightGreen,
                                    ),
                                  )
                                : SizedBox(
                                    height: 140,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: featuredListingController
                                          .featuredListing.value.data!.length,
                                      itemBuilder: (context, index) {
                                        return FeaturedListingCard(
                                          image: featuredListingController
                                              .featuredListing
                                              .value
                                              .data?[index]
                                              .images,
                                          title: featuredListingController
                                              .featuredListing
                                              .value
                                              .data?[index]
                                              .title
                                              .toString(),
                                          city: featuredListingController
                                              .featuredListing
                                              .value
                                              .data?[index]
                                              .contact!
                                              .locations![0]
                                              .name
                                              .toString(),
                                          price: featuredListingController
                                              .featuredListing
                                              .value
                                              .data?[index]
                                              .price
                                              .toString(),
                                          isFovorite: true,
                                          listingId: featuredListingController
                                              .featuredListing
                                              .value
                                              .data?[index]
                                              .listingId,
                                        );
                                      },
                                    ),
                                  ),
                          ),
                        ),
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
                      () => GridView.builder(
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
                            city: listingController.allListings.value
                                .data?[index].contact!.locations![0].name
                                .toString(),
                            price: listingController
                                .allListings.value.data?[index].price
                                .toString(),
                            isFovorite: true,
                            listingId: listingController
                                .allListings.value.data?[index].listingId,
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
