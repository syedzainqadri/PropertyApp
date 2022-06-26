import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/listings_controller.dart';
import 'package:realestapp/Controllers/my_listings_controller.dart';

import '../AddListings/list_widget.dart';
import '../AddListings/my_listing_card.dart';
import '../Utils/color_scheme.dart';

class MyListings extends StatefulWidget {
  const MyListings({Key? key}) : super(key: key);

  @override
  State<MyListings> createState() => _MyListingsState();
}

class _MyListingsState extends State<MyListings> {
  final myListingController = Get.put(MyListingController());
  final ListingController listingController = Get.put(ListingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'My Listings',
          style: TextStyle(color: lightGreen),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              color: lightGreen,
              size: 35,
            )),
      ),
      body: Obx(() {
        return listingController.isLoading == true
            ? const CircularProgressIndicator()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                padding: const EdgeInsets.only(left: 18.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: myListingController.myListings.value.data?.length,
                itemBuilder: (context, index) {
                  return MyListingCard(
                      image: myListingController
                          .myListings.value.data![index].images,
                      title: myListingController
                          .myListings.value.data![index].title
                          .toString(),
                      city: myListingController.myListings.value.data![index]
                          .contact!.locations![0].name
                          .toString(),
                      price: myListingController
                          .myListings.value.data![index].price
                          .toString(),
                      isFovorite: false,
                      description: '',
                      listingId: myListingController
                          .myListings.value.data![index].listingId);
                },
              );
      }),
    );
  }
}
