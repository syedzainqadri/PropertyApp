import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/listings_controller.dart';
import 'package:realestapp/Controllers/review_controller.dart';

import '../AddListings/listing_details.dart';
import '../Controllers/listing_detail_controller.dart';
import '../Models/all_listing_model.dart';
import '../Utils/color_scheme.dart';

itemWidget(Datum listing) {
  final reviewController = Get.put(ReviewController());
  final listingDetailsController = Get.put(ListingDetailsController());
  final listingController = Get.put(ListingController());
  return GestureDetector(
    onLongPress: (){
      listingController.addToFavorites(listing.listingId);
    },
    onTap: () async {
      try {
        listingDetailsController.getListingById(listing.listingId);
        await reviewController.fetchReviews(listing.listingId);
      } finally {
        Get.to(const ListingDetails());
      }
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(listing.images!.isEmpty
                      ? 'https://i.pinimg.com/originals/77/4a/0c/774a0cb09e5f59c351c7221667a77acf.jpg'
                      : listing.images![0].url.toString()),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        listing.title.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          color: darkGrey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Added on ${listing.createdAt.toString().substring(0, 10)}',
                        style: const TextStyle(
                          color: mediumGrey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listing.contact!.locations!.length < 2
                            ? listing.contact!.locations![0].name.toString()
                            : listing.contact!.locations![1].name.toString() +
                                ', ' +
                                listing.contact!.locations![0].name.toString(),
                        style: const TextStyle(
                          color: darkGrey,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$${listing.price}',
                              style: const TextStyle(
                                color: darkGrey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
    ),
  );
}















// itemWidget(AllListings listing) {
//     return GestureDetector(
//       onTap: (){
//       //  Get.to(ListingDetails(street: listing., price: price, image: image));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           height: 100,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(listing.images[0].url),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           listing.title,
//                           style: const TextStyle(
//                             color: darkGrey,
//                             fontSize: 15,
//                           ),
//                         ),
//                         Text(
//                           listing.created_at,
//                           style: const TextStyle(
//                             color: mediumGrey,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       listing.contact.locations[0].name,
//                       style: const TextStyle(
//                         color: darkGrey,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 25,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       listing.price,
//                       style: const TextStyle(
//                         color: darkGrey,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

