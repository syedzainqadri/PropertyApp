// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, file_names, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharounda/AddListings/edit_listing.dart';
import 'package:gharounda/AddListings/listing_details.dart';
import 'package:gharounda/BuyPromotions/buy_promotions.dart';
import 'package:gharounda/Controllers/favorite_listing_controller.dart';
import 'package:gharounda/Controllers/listing_detail_controller.dart';
import 'package:gharounda/Controllers/markAsSoldController.dart';
import 'package:gharounda/Controllers/review_controller.dart';
import 'package:gharounda/Utils/const.dart';

class MyListingCard extends StatelessWidget {
  var image;
  var title;
  var city;
  var price;
  var isFovorite;
  var description;
  var listingId;

  MyListingCard(
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
  double height = Get.height;
  double width = Get.width;

  final favoriteListingController = Get.put(FavoriteListingController());
  final MarkAsSoldController markAsSoldController =
      Get.put(MarkAsSoldController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                ));
          }
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: width * 0.3,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image[0].url.toString()),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: kGreen,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          '$currency:  ' + price.toString(),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w500,
                              color: kWhite,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  // isFovorite
                  //     ? Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
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
                  //               color: kGreen,
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     : Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
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
                  //               Icons.favorite_border,
                  //               size: 25,
                  //               color: kGreen,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 100,
                        child: Text(
                          title,
                          maxLines: 2,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.place,
                          size: 17,
                          color: kGreenAccentColor,
                        ),
                        Text(city),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          size: 17,
                          color: kGreenAccentColor,
                        ),
                        Text(price),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: width * 0.14,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: PopupMenuButton(
                        onSelected: (value) {
                          if (value == 'Mark As Sold') {
                            markAsSoldController
                                .markAsSold(listingId.toString());
                            favoriteListingController.refresh();
                            Get.snackbar('Success', 'Marked As Sold',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: kGreen,
                                colorText: kWhite);
                          } else if (value == 'promote') {
                            Get.to(() => const PromotionPlans());
                          } else if (value == 'Edit') {
                            Get.to(
                                () => EditListingScreen(listingId: listingId));
                          }
                        },
                        icon: const Icon(Icons.more_horiz),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.edit,
                                    color: kBlueAccesentColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: kBlueAccesentColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              value: 'Edit',
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.announcement,
                                    color: kGreen,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Promote',
                                    style: TextStyle(
                                      color: kGreen,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              value: 'promote',
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: const [
                                  Icon(Icons.replay, color: kGreenAccentColor),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Mark As Sold',
                                    style: TextStyle(
                                      color: kGreenAccentColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              value: 'Mark As Sold',
                            ),
                          ];
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
