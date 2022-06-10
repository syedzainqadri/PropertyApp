import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AddListings/list_widget.dart';
import '../Controllers/listings_controller.dart';
import '../Utils/color_scheme.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({Key? key}) : super(key: key);

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'My Favorites',
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
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: const EdgeInsets.only(left: 18.0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount:
            Get.find<ListingController>().favoriteListings.value.data?.length,
        itemBuilder: (context, index) {
          return listWidget(
              Get.find<ListingController>()
                  .favoriteListings
                  .value
                  .data![index]
                  .images,
              Get.find<ListingController>()
                  .favoriteListings
                  .value
                  .data![index]
                  .title
                  .toString(),
              Get.find<ListingController>()
                  .favoriteListings
                  .value
                  .data![index]
                  .contact!
                  .locations![0]
                  .name
                  .toString(),
              Get.find<ListingController>()
                  .favoriteListings
                  .value
                  .data![index]
                  .price
                  .toString(),
              true,
              '',
              Get.find<ListingController>()
                  .favoriteListings
                  .value
                  .data![index]
                  .listingId);
        },
      ),
    );
  }
}
