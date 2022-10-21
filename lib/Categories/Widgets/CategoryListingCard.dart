import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lagosabuja/AddListings/listing_details.dart';
import 'package:lagosabuja/Controllers/favorite_listing_controller.dart';
import 'package:lagosabuja/Controllers/listing_detail_controller.dart';
import 'package:lagosabuja/Controllers/review_controller.dart';
import 'package:lagosabuja/Utils/color_scheme.dart';
import 'package:lagosabuja/Utils/full_screen_dialog.dart';

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
                    width: width * 0.35,
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
                        image: image != null
                            ? NetworkImage(image[0].url.toString())
                            : const AssetImage('assets/images/logo4.png')
                                as ImageProvider,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: Container(
                      height: 20,
                      decoration: const BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            price != null
                                ? 'NGN:  ' + price.toString()
                                : 'NGN: Not Available',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                letterSpacing: .5,
                                fontWeight: FontWeight.w500,
                                color: white,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Text(
                      title ?? '',
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: .5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.place,
                        size: 17,
                        color: lightGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(city ?? ''),
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
                        color: lightGreen,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(price ?? ''),
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
