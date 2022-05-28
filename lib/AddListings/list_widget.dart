import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../Utils/color_scheme.dart';
import 'listing_details.dart';

listWidget(image, street, city, isFovorite) {
  return SizedBox(
    width: 160,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          child: GestureDetector(
            onTap: (){
              Get.to(ListingDetails(image: image, street: street, price: '12,322,65',));
            },
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
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
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          street,
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
        // const SizedBox(
        //   height: 6,
        // ),
        // RatingBar.builder(
        //   initialRating: 3,
        //   minRating: 1,
        //   itemSize: 25,
        //   direction: Axis.horizontal,
        //   allowHalfRating: true,
        //   itemCount: 5,
        //   itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
        //   itemBuilder: (context, _) => const Icon(
        //     Icons.star,
        //     color: lightGreen,
        //   ),
        //   onRatingUpdate: (rating) {},
        // ),
      ],
    ),
  );
}
