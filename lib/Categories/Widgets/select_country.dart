// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:lagosabuja/AddListings/select_city.dart';
import 'package:lagosabuja/Controllers/location_controller.dart';
import 'package:lagosabuja/Utils/color_scheme.dart';

//select_country.dart
class SelectCountryFilters extends StatefulWidget {
  const SelectCountryFilters({Key? key}) : super(key: key);

  @override
  State<SelectCountryFilters> createState() => _SelectCountryFiltersState();
}

class _SelectCountryFiltersState extends State<SelectCountryFilters> {
  final locationsController = Get.put(LocationsController());
  final box = GetStorage();
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
          'Select State',
          style: TextStyle(
            color: lightGreen,
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(
              top: 18.0, bottom: 18.0, right: 20, left: 20),
          child: ListView.builder(
              itemCount: locationsController.locations.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    locationsController.getSubLocation(
                        locationsController.locations.value[index].termId);
                    box.write('country',
                        locationsController.locations.value[index].termId);
                    print(box.read("country"));
                    Get.to(const SelectCity());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: lightGreen,
                        border:
                            Border.all(color: white, style: BorderStyle.solid)),
                    child: Center(
                      child: Text(
                        locationsController.locations.value[index].name,
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
      ),
    );
  }
}
