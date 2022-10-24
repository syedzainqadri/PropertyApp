// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lagosabuja/AddListings/select_city.dart';
import 'package:lagosabuja/Utils/const.dart';
import 'package:lagosabuja/Utils/full_screen_dialog.dart';
import '../Controllers/location_controller.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
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
            color: kGreen,
            size: 34,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Select State',
          style: TextStyle(
            color: kGreen,
          ),
        ),
      ),
      body: Obx(
        () => locationsController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: kGreen,
              ))
            : Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, bottom: 18.0, right: 20, left: 20),
                child: ListView.builder(
                    itemCount: locationsController.locations.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          CustomFullScreenDialog.showDialog();
                          await locationsController.getSubLocation(
                              locationsController
                                  .locations.value[index].termId);
                          box.write(
                              'country',
                              locationsController
                                  .locations.value[index].termId);
                          CustomFullScreenDialog.cancelDialog();
                          Get.to(const SelectCity());
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: kGreen,
                              border: Border.all(
                                  color: white, style: BorderStyle.solid)),
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
