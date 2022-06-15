// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/AddListings/add_listings.dart';
import 'package:realestapp/Utils/color_scheme.dart';
import '../Controllers/LocationController.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key? key,}) : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final locationsController = Get.put(LocationsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.navigate_before,
            color: lightGreen,
            size: 34,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Select City',
          style: TextStyle(
            color: lightGreen,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
        child: ListView.builder(
            itemCount: locationsController.subLocations.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  locationsController.userLocationId.value =
                      await locationsController.subLocations.value[index].termId;
                  Get.offAll(const AddListing());
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      color: lightGreen,
                      border: Border.all(
                          color: white, style: BorderStyle.solid)),
                  child: Center(
                    child: Text(
                      locationsController.subLocations.value[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
