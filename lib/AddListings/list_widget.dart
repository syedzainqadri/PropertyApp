// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/favorite_listing_controller.dart';
import 'package:realestapp/Controllers/listing_detail_controller.dart';
import 'package:realestapp/Controllers/review_controller.dart';
import '../Utils/color_scheme.dart';
import 'listing_details.dart';

class ListingCard extends StatelessWidget {
  var image;
  var title;
  var city;
  var price;
  var isFovorite;
  var description;
  var listingId;

  ListingCard(
      {this.image,
      this.title,
      this.city,
      this.price,
      this.isFovorite,
      this.description,
      this.listingId,
      Key? key})
      : super(key: key);

  final ReviewController reviewController = Get.put(ReviewController());
  final ListingDetailsController listingDetailsController =
      Get.put(ListingDetailsController());

  final favoriteListingController = Get.put(FavoriteListingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () async {
          try {
            await listingDetailsController.getListingById(listingId);
            // await reviewController.fetchReviews(listingId);
          } finally {
            Get.to(() => ListingDetails(
                  id: listingId,
                  title: title,
                  images: image,
                  price: price,
                  description: description,
                ));
          }
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image[0].url.toString()),
                      ),
                    ),
                  ),
                  // isFovorite
                  //     ? Row(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           IconButton(
                  //             onPressed: () {
                  //               favoriteListingController
                  //                   .addToFavorites(listingId);
                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                   const SnackBar(
                  //                       content: Text('Added to Favorites')));
                  //             },
                  //             icon: const Icon(
                  //               Icons.favorite,
                  //               size: 25,
                  //               color: lightGreen,
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     : const Offstage(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: darkGrey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    city,
                    style: const TextStyle(
                      color: mediumDarkGrey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
