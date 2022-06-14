// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/AddListings/select_city.dart';
import 'package:realestapp/Utils/color_scheme.dart';

import '../Controllers/LocationController.dart';

//select_country.dart
class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
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
          'Select State',
          style: TextStyle(
            color: lightGreen,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
        child: ListView.builder(
            itemCount: locationsController.locations.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  locationsController.getSubLocation(
                      locationsController.locations.value[index].termId);
                  Get.to(const SelectCity());
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      color: lightGreen,
                      border: Border.all(
                          color: darkGrey, style: BorderStyle.solid)),
                  child: Text(
                    locationsController.locations.value[index].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: white,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
