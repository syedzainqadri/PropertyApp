import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/listing_detail_controller.dart';
import 'package:realestapp/Controllers/review_controller.dart';

import '../Utils/color_scheme.dart';
import 'listing_details.dart';

listWidget(image, title, city, price, isFovorite, description, listingId) {
  final ReviewController reviewController = Get.put(ReviewController());
  final ListingDetailsController listingDetailsController =
      Get.put(ListingDetailsController());

  return Padding(
    padding: const EdgeInsets.all(8.0),
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
  );
}
