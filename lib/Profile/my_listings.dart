// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Controllers/deleteListingController.dart';
import 'package:lagosabuja/Controllers/listings_controller.dart';
import 'package:lagosabuja/Controllers/my_listings_controller.dart';
import 'package:lagosabuja/Profile/Widgets/myLisitngCard.dart';
import '../Utils/const.dart';

class MyListings extends StatefulWidget {
  const MyListings({Key? key}) : super(key: key);

  @override
  State<MyListings> createState() => _MyListingsState();
}

class _MyListingsState extends State<MyListings> {
  final ListingController listingController = Get.put(ListingController());
  final DeleteListingController deleteListingController =
      Get.put(DeleteListingController());
  final MyListingController myListingController =
      Get.put(MyListingController());
  @override
  Widget build(BuildContext context) {
    return myListingController.myListings.value.data == null
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
        : Scaffold(
            appBar: AppBar(
              backgroundColor: kTransparent,
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
              return myListingController.isLoading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: kGreen,
                    ))
                  : ListView.builder(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:
                          myListingController.myListings.value.data?.length,
                      itemBuilder: (context, index) {
                        var items = myListingController.myListings.value.data;
                        return Dismissible(
                          key: Key(myListingController
                              .myListings.value.data![index].listingId
                              .toString()),
                          onDismissed: (direction) {
                            myListingController.refresh();
                            deleteListingController.deleteListing(
                                items![index].listingId.toString());
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                          background: Container(
                            color: kRedColor,
                          ),
                          child: MyListingCard(
                              image: myListingController
                                  .myListings.value.data![index].images,
                              title: myListingController
                                  .myListings.value.data![index].title
                                  .toString(),
                              city: myListingController.myListings.value
                                  .data![index].contact!.locations![0].name
                                  .toString(),
                              price: myListingController
                                  .myListings.value.data![index].price
                                  .toString(),
                              isFovorite: false,
                              description: '',
                              listingId: myListingController
                                  .myListings.value.data![index].listingId),
                        );
                      },
                    );
            }),
          );
  }

  void doNothing(BuildContext context) {}
}
