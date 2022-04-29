import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/listing_details.dart';

import 'color_scheme.dart';

itemWidget(image, street, date, location, price) {
    return GestureDetector(
      onTap: (){
        Get.to(ListingDetails(street: street, price: price, image: image));
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
                    image: AssetImage('assets/images/$image.png'),
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
                          street,
                          style: const TextStyle(
                            color: darkGrey,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Added on $date',
                          style: const TextStyle(
                            color: mediumGrey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        color: darkGrey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$$price',
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
        ),
      ),
    );
  }

