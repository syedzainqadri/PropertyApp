// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/AddListings/featuredListingCard.dart';
import 'package:lagosabuja/Controllers/featuredListings.dart';
import 'package:lagosabuja/Home/widgets/CategoryCard.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../AddListings/list_widget.dart';
import '../Controllers/categories_controller.dart';
import '../Controllers/listings_controller.dart';
import '../Utils/const.dart';

class HomePage extends GetView<ListingController> {
  HomePage({Key? key}) : super(key: key);
  final featuredListingController = Get.find<FeaturedListingController>();
  final categoriesController = Get.find<CategoriesController>();
  final refreshControoler = RefreshController();
  final height = Get.height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () => controller.allListings.value.data == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: kGreen,
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
                                      color: kGreen,
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
                      () => SizedBox(
                        height: height * 0.8,
                        child: SmartRefresher(
                          controller: refreshControoler,
                          enablePullDown: true,
                          enablePullUp: true,
                          header: const WaterDropHeader(),
                          footer: CustomFooter(builder: ((context, mode) {
                            Widget body;
                            if (mode == LoadStatus.idle) {
                              body = const Text("Pull Up to Load More");
                            } else if (mode == LoadStatus.failed) {
                              body = const Text("Failed to load more");
                            } else if (mode == LoadStatus.canLoading) {
                              body = const Text("Loading...");
                            } else {
                              body = const Text("No More Data");
                            }
                            return SizedBox(
                              height: 55.0,
                              child: Center(child: body),
                            );
                          })),
                          onRefresh: _onRefresh,
                          onLoading: _onLoading,
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount:
                                controller.allListings.value.data?.length,
                            itemBuilder: (context, index) {
                              return ListingCard(
                                image: controller
                                    .allListings.value.data?[index].images,
                                title: controller
                                    .allListings.value.data?[index].title
                                    .toString(),
                                city: controller.allListings.value.data?[index]
                                    .contact!.locations![0].name
                                    .toString(),
                                price: controller
                                    .allListings.value.data?[index].price
                                    .toString(),
                                isFovorite: true,
                                listingId: controller
                                    .allListings.value.data?[index].listingId,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    controller.getAllListing(isRefreshed: true);
    refreshControoler.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    controller.currentPage.value++;
    controller.getAllListing(isRefreshed: false);
    refreshControoler.refreshCompleted();
  }
}
