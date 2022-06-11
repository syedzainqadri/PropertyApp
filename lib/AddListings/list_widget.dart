import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/listing_detail_controller.dart';
import 'package:realestapp/Controllers/review_controller.dart';

import '../Controllers/listings_controller.dart';
import '../Utils/color_scheme.dart';
import 'listing_details.dart';

listWidget(context,image, title, city, price, isFovorite, description, listingId) {
  final ReviewController reviewController = Get.put(ReviewController());
  final ListingDetailsController listingDetailsController =
      Get.put(ListingDetailsController());

  final listingController = Get.put(ListingController());

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onLongPress: () {
        listingController.addToFavorites(listingId);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to Favorites')));
      },
      onTap: () async {
        try {
          await listingDetailsController.getListingById(listingId);
          await reviewController.fetchReviews(listingId);
        } finally {
          Get.to(const ListingDetails());
        }
      },
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image[0].url.toString()),
                    ),
                  ),
                ),
                isFovorite
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              size: 25,
                              color: lightGreen,
                            ),
                          ),
                        ],
                      )
                    : const Offstage(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 3.0, left: 3.0, top: 3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: darkGrey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    city,
                    style: const TextStyle(
                      color: mediumDarkGrey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
  // return SizedBox(
  //   width: 160,
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       SizedBox(
  //         width: 160,
  //         child: GestureDetector(
  //           onTap: () async {
  //             try {
  //               await listingDetailsController.getListingById(listingId);
  //               await reviewController.fetchReviews(listingId);
  //             } finally {
  //               Get.to(const ListingDetails());
  //             }
  //           },
  //           child: Stack(
  //             children: [
  //               Container(
  //                 width: double.infinity,
  //                 height: 100,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     fit: BoxFit.cover,
  //                     image: NetworkImage(image[0].url.toString()),
  //                   ),
  //                 ),
  //               ),
  //               isFovorite
  //                   ? Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: const [
  //                         Padding(
  //                           padding: EdgeInsets.all(8.0),
  //                           child: Icon(
  //                             Icons.favorite,
  //                             size: 25,
  //                             color: lightGreen,
  //                           ),
  //                         ),
  //                       ],
  //                     )
  //                   : const Offstage(),
  //             ],
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 2,
  //       ),
  //       Text(
  //         street,
  //         style: const TextStyle(
  //           color: darkGrey,
  //           fontSize: 18,
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 4,
  //       ),
  //       Text(
  //         city,
  //         style: const TextStyle(
  //           color: mediumDarkGrey,
  //           fontSize: 16,
  //         ),
  //       ),
  //       // const SizedBox(
  //       //   height: 6,
  //       // ),
  //       // RatingBar.builder(
  //       //   initialRating: 3,
  //       //   minRating: 1,
  //       //   itemSize: 25,
  //       //   direction: Axis.horizontal,
  //       //   allowHalfRating: true,
  //       //   itemCount: 5,
  //       //   itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
  //       //   itemBuilder: (context, _) => const Icon(
  //       //     Icons.star,
  //       //     color: lightGreen,
  //       //   ),
  //       //   onRatingUpdate: (rating) {},
  //       // ),
  //     ],
  //   ),
  // );
}
