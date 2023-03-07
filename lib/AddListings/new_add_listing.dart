import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Controllers/listing_type_controller.dart';
import 'package:lagosabuja/Models/listing_types_model.dart';

class NewAddListing extends StatelessWidget {
  NewAddListing({Key? key}) : super(key: key);

  var height = Get.height;
  var width = Get.width;
  ListingTypeController listingTypeController =
      Get.put(ListingTypeController());
  var listingType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * .09,
              child: ChipsChoice<ListingTypes>.single(
                value: listingType,
                onChanged: (value) {
                  listingType = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
