import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:realestapp/AddListings/listing_details.dart';
import 'package:realestapp/Controllers/favorite_listing_controller.dart';
import 'package:realestapp/Controllers/listing_detail_controller.dart';
import 'package:realestapp/Controllers/review_controller.dart';
import 'package:realestapp/Utils/color_scheme.dart';
import 'package:realestapp/Utils/full_screen_dialog.dart';

class CategoryListingCard extends StatelessWidget {
  var image;
  var title;
  var city;
  var price;
  var isFovorite;
  var description;
  var listingId;

  CategoryListingCard(
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          CustomFullScreenDialog.showDialog();
          try {
            await listingDetailsController.getListingById(listingId);
            // await reviewController.fetchReviews(listingId);
          } finally {
            CustomFullScreenDialog.cancelDialog();
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                        color: lightGreen,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          'NGN:  ' + price.toString(),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
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
                  //               color: lightGreen,
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
                  //               color: lightGreen,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.place,
                        size: 17,
                        color: Colors.greenAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(city),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        size: 17,
                        color: Colors.greenAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(price),
                    ],
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
