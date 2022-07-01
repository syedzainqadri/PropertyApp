import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/AddListings/listing_details.dart';
import 'package:realestapp/Controllers/deleteListingController.dart';
import 'package:realestapp/Controllers/favorite_listing_controller.dart';
import 'package:realestapp/Controllers/listing_detail_controller.dart';
import 'package:realestapp/Controllers/review_controller.dart';
import 'package:realestapp/Utils/color_scheme.dart';

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
  final DeleteListingController deleteListingController =
      Get.put(DeleteListingController());

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
                  description: description,
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
                  isFovorite
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                favoriteListingController
                                    .addToFavorites(listingId);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Added to Favorites')));
                              },
                              icon: const Icon(
                                Icons.favorite,
                                size: 25,
                                color: lightGreen,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                favoriteListingController
                                    .addToFavorites(listingId);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Added to Favorites')));
                              },
                              icon: const Icon(
                                Icons.favorite_border,
                                size: 25,
                                color: lightGreen,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, top: 15),
                child: Column(
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
                        Text(price),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'Delete') {
                        deleteListingController
                            .deleteListing(listingId.toString());
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Removed from Favorites')));
                      }
                    },
                    icon: Icon(Icons.more_horiz),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.edit,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.blueAccent,
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
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Promote',
                                style: TextStyle(
                                  color: Colors.green,
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
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          value: 'Delete',
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: const [
                              Icon(Icons.replay, color: Colors.greenAccent),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Mark As Sold',
                                style: TextStyle(
                                  color: Colors.greenAccent,
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
        ),
      ),
    );
  }
}
