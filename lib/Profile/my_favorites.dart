import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AddListings/list_widget.dart';
import '../Controllers/favorite_listing_controller.dart';
import '../Utils/const.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({Key? key}) : super(key: key);

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  final favoriteListingController = Get.put(FavoriteListingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'My Favorites',
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
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          padding: const EdgeInsets.only(left: 18.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount:
              favoriteListingController.favoriteListings.value.data?.length,
          itemBuilder: (context, index) {
            return ListingCard(
                image: favoriteListingController
                    .favoriteListings.value.data[index].images,
                title: favoriteListingController
                    .favoriteListings.value.data[index].title
                    .toString(),
                city:
                    '${favoriteListingController.favoriteListings.value.data[index].contact.locations[1].name}, ${favoriteListingController.favoriteListings.value.data[0].contact.locations[0].name}'
                        .toString(),
                price: favoriteListingController
                    .favoriteListings.value.data[index].price
                    .toString(),
                isFovorite: true,
                listingId: favoriteListingController
                    .favoriteListings.value.data[index].listingId);
          },
        );
      }),
    );
  }
}
