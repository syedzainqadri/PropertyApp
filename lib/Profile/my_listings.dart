// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Controllers/deleteListingController.dart';
import 'package:lagosabuja/Controllers/listings_controller.dart';
import 'package:lagosabuja/Profile/Widgets/myLisitngCard.dart';
import '../Controllers/my_listings_controller.dart';
import '../Utils/const.dart';

class MyListings extends GetView<MyListingController> {
  MyListings({Key? key}) : super(key: key);

  final ListingController listingController = Get.put(ListingController());
  final DeleteListingController deleteListingController =
      Get.put(DeleteListingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.myListings.value.data == null
          ? const Scaffold(
              body: Center(
                child: Text(
                  'You Have Not Posted Any Thing Yet',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kGreen,
                  ),
                ),
              ),
            )
          : controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: transparent,
                    elevation: 0.0,
                    centerTitle: true,
                    title: const Text(
                      'My Listings',
                      style: TextStyle(color: kGreen),
                    ),
                    leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.navigate_before,
                          color: kGreen,
                          size: 35,
                        )),
                  ),
                  body: Obx(() {
                    return controller.isLoading.value == true
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: kGreen,
                          ))
                        : ListView.builder(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.myListings.value.data?.length,
                            itemBuilder: (context, index) {
                              var items = controller.myListings.value.data;
                              return Dismissible(
                                key: Key(controller
                                    .myListings.value.data![index].listingId
                                    .toString()),
                                onDismissed: (direction) {
                                  controller.refresh();
                                  deleteListingController.deleteListing(
                                      items![index].listingId.toString());
                                  items.removeAt(index);
                                },
                                background: Container(
                                  color: Colors.red,
                                ),
                                child: MyListingCard(
                                  image: controller
                                      .myListings.value.data![index].images,
                                  title: controller
                                      .myListings.value.data![index].title
                                      .toString(),
                                  city: controller.myListings.value.data![index]
                                      .contact!.locations![0].name
                                      .toString(),
                                  price: controller
                                      .myListings.value.data![index].price
                                      .toString(),
                                  isFovorite: false,
                                  description: '',
                                  listingId: controller
                                      .myListings.value.data![index].listingId,
                                  lable: controller
                                      .myListings.value.data![index].status,
                                ),
                              );
                            },
                          );
                  }),
                ),
    );
  }

  void doNothing(BuildContext context) {}
}
