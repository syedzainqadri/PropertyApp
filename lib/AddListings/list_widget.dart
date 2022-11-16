// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variableså, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharounda/Controllers/favorite_listing_controller.dart';
import 'package:gharounda/Controllers/listing_detail_controller.dart';
import 'package:gharounda/Controllers/review_controller.dart';
import '../Utils/const.dart';
import 'listing_details.dart';

class ListingCard extends StatelessWidget {
  var image;
  var title;
  var city;
  var price;
  var isFovorite;
  var listingId;

  ListingCard(
      {this.image,
      this.title,
      this.city,
      this.price,
      this.isFovorite,
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
          } finally {
            Get.to(
              () => ListingDetails(
                id: listingId,
                title: title,
                images: image,
                price: price,
              ),
            );
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
                        image: image != null
                            ? NetworkImage(image[0].url.toString())
                            : const AssetImage('assets/images/logo.png')
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
                        color: kGreen,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            price != null
                                ? '$currency:  ' + price.toString()
                                : '$currency: Not Available',
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 4.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title ?? '',
                    style: const TextStyle(
                      color: kDarkGrey,
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
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const Icon(
                      Icons.pin_drop,
                      color: kGreen,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      city ?? '',
                      style: const TextStyle(
                        color: kMediumDarkGrey,
                        fontSize: 12,
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
