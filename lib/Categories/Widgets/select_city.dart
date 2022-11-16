// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gharounda/AddListings/add_listings.dart';
import 'package:gharounda/Controllers/location_controller.dart';
import 'package:gharounda/Utils/const.dart';

class SelectCityFilters extends StatefulWidget {
  const SelectCityFilters({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectCityFilters> createState() => _SelectCityFiltersState();
}

class _SelectCityFiltersState extends State<SelectCityFilters> {
  final locationsController = Get.put(LocationsController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.navigate_before,
            color: kGreen,
            size: 34,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Select City',
          style: TextStyle(
            color: kGreen,
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(
              top: 18.0, bottom: 18.0, right: 20, left: 20),
          child: ListView.builder(
              itemCount: locationsController.subLocations.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    locationsController.updateLocationName(
                        await locationsController
                            .subLocations.value[index].termId,
                        await locationsController
                            .subLocations.value[index].name);
                    box.write('city',
                        locationsController.subLocations.value[index].termId);
                    Get.offAll(const AddListing());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kGreen,
                        border: Border.all(
                            color: kWhite, style: BorderStyle.solid)),
                    child: Center(
                      child: Text(
                        locationsController.subLocations.value[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: kWhite,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
