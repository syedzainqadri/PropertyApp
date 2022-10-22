// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_typing_uninitialized_variables, invalid_use_of_protected_member, avoid_print, must_be_immutable

import 'dart:convert';
import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:lagosabuja/Controllers/location_controller.dart';
import 'package:lagosabuja/Controllers/categories_controller.dart';
import 'package:lagosabuja/Controllers/listing_config_controller.dart';
import 'package:lagosabuja/Controllers/listing_type_controller.dart';
import 'package:lagosabuja/Controllers/my_listings_controller.dart';
import 'package:lagosabuja/Models/listing_configuration_model.dart';
import 'package:lagosabuja/Models/listing_types_model.dart';
import 'package:lagosabuja/Models/locations_model.dart';
import 'package:lagosabuja/Profile/my_listings.dart';
import '../Controllers/listings_controller.dart';
import '../Models/Categories/category_model.dart' hide CatIcon;
import '../Models/selected_fields_model.dart';
import '../Utils/color_scheme.dart';
import '../Utils/constants.dart';
import 'select_country.dart';

class AddListing extends StatefulWidget {
  const AddListing({Key? key}) : super(key: key);

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  final listingTypeController = Get.put(ListingTypeController());
  final MyListingController myListingController =
      Get.put(MyListingController());
  final categoriesController = Get.put(CategoriesController());
  final listingConfigController = Get.put(ListingConfigController());
  bool categorySelected = false;
  bool subCategorySelected = false;
  final listingsController = Get.put(ListingController());
  var category;
  var subCategory;
  var listingType;
  var priceTypes;
  var pricingTypes;
  var priceUnits;
  var customField;
  var myAmenities = List<String>.empty(growable: true);
  final priceController = TextEditingController();
  final priceStartController = TextEditingController();
  final priceEndController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleController = TextEditingController();
  final zipCodeController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final websiteController = TextEditingController();
  final videoController = TextEditingController();
  final whatsAppController = TextEditingController();
  final locationsController = Get.put(LocationsController());
  List<dynamic> amenities = [false];
  List<SelectedFieldsModel> selectedFields = List<SelectedFieldsModel>.filled(
      20, SelectedFieldsModel(0, Choice(id: '0', name: '0')),
      growable: true);
  List<XFile>? imageFiles = [];
  final box = GetStorage();
  var location = Location();
  @override
  void initState() {
    super.initState();
  }

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
          'Add Listing',
          style: TextStyle(
            color: kGreen,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20),
                      child: SizedBox(
                        width: 200,
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            await locationService();
                            Get.to(const SelectCountry());
                          },
                          icon: const Icon(Icons.add),
                          label: const Text(
                            'Add Location',
                            style: TextStyle(
                              color: white,
                              fontSize: 18,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kGreen,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    locationsController.userLocationId.value != 0
                        ? Chip(
                            deleteIcon: const Icon(
                              Icons.close,
                            ),
                            onDeleted: () {
                              locationsController.updateLocationName(0, '');
                            },
                            label: Text(locationsController
                                .userLocationName.value
                                .toString()),
                          )
                        : const Offstage(),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              // TitleWidget(
              //   text: 'Title',
              //   padding: 5.0,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("Title", false, titleController),
              ),

              TitleWidget(
                padding: 5.0,
                text: 'Description',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("Description", false, descriptionController,
                    maxLine: 4),
              ),

              // TitleWidget(
              //   padding: 5.0,
              //   text: 'Phone Number',
              // ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("Phone*", false, phoneNumberController),
              ),

              // TitleWidget(
              //   padding: 5.0,
              //   text: 'Zip Code',
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("Zip Code*", false, zipCodeController),
              ),
              // TitleWidget(
              //   padding: 5.0,
              //   text: 'Address',
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("Address*", false, addressController),
              ),
              // TitleWidget(
              //   padding: 5.0,
              //   text: 'Email',
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("Email*", false, emailController),
              ),

              // TitleWidget(
              //   padding: 5.0,
              //   text: 'WhatsApp Number',
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("WhatsApp Number*", false, whatsAppController),
              ),

              // TitleWidget(
              //   padding: 5.0,
              //   text: 'Website',
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("Website", false, websiteController),
              ),

              // TitleWidget(
              //   text: 'Video Url',
              //   padding: 5.0,
              // ),

              TitleWidget(
                text: 'Select Images',
                padding: 5.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await _getFromGallery();
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: kGreen,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: imageFiles?.length,
                            itemBuilder: (context, index) {
                              return imageContainer(
                                  File(imageFiles![index].path), index);
                            }),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: textField("Video url", false, videoController),
              ),
              TitleWidget(
                text: 'Select Listing Type',
                padding: 5.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
                child: ChipsChoice<ListingTypes>.single(
                  choiceStyle: const C2ChoiceStyle(color: kGreen),
                  wrapped: true,
                  value: listingType,
                  choiceItems: C2Choice.listFrom<ListingTypes, ListingTypes>(
                    source: listingTypeController.listingTypes.value,
                    value: (i, v) => v,
                    label: (i, v) => v.name,
                  ),
                  onChanged: (val) {
                    setState(() => listingType = val);
                    print(listingType.id.toString());
                  },
                ),
              ),
              TitleWidget(
                padding: 5.0,
                text: 'Select A Category',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: ChipsChoice<CategoriesModel>.single(
                  choiceStyle: const C2ChoiceStyle(color: kGreen),
                  wrapped: true,
                  value: category,
                  choiceItems:
                      C2Choice.listFrom<CategoriesModel, CategoriesModel>(
                    source: categoriesController.categories.value,
                    value: (i, v) => v,
                    label: (i, v) => v.name,
                  ),
                  onChanged: (val) async {
                    Get.defaultDialog(
                        title: "",
                        content: Container(
                          color: Colors.white,
                          child: Column(
                            children: const [
                              Center(
                                child: CircularProgressIndicator(
                                  color: kGreen,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Loading",
                                style: TextStyle(color: Colors.black38),
                              )
                            ],
                          ),
                        ));
                    await categoriesController.getSubCategories(val.termId);
                    Get.back();
                    setState(() {
                      categorySelected = true;
                      category = val;
                      pricingTypes = PricType();
                      pricingTypes.id = '';
                      pricingTypes.name = '';
                      print(category.termId);
                    });
                  },
                ),
              ),
              TitleWidget(
                padding: 5.0,
                text: 'Select Subcategory',
              ),
              categorySelected
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20),
                      child: ChipsChoice<LocationsModel>.single(
                        choiceStyle: const C2ChoiceStyle(color: kGreen),
                        wrapped: true,
                        value: subCategory,
                        choiceItems:
                            //this should be coming from category model not location Model
                            C2Choice.listFrom<LocationsModel, LocationsModel>(
                          source: categoriesController.subCategories.value,
                          value: (i, v) => v,
                          label: (i, v) => v.name,
                        ),
                        onChanged: (val) async {
                          await listingConfigController
                              .getConfiguration(val.termId);
                          setState(() {
                            subCategorySelected = true;
                            subCategory = val;
                            print(subCategory.termId);
                          });
                        },
                      ),
                    )
                  : const Offstage(),
              subCategorySelected
                  ? Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleWidget(
                              padding: 5.0,
                              text: 'Select Pricing Type',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: ChipsChoice<PricType>.single(
                                choiceStyle: const C2ChoiceStyle(color: kGreen),
                                wrapped: true,
                                value: pricingTypes,
                                choiceItems:
                                    C2Choice.listFrom<PricType, PricType>(
                                  source: listingConfigController
                                      .listingConfig.value.config.pricingTypes,
                                  value: (i, v) => v,
                                  label: (i, v) => v.name,
                                ),
                                onChanged: (val) {
                                  setState(() => pricingTypes = val);
                                  print(pricingTypes.id);
                                },
                              ),
                            ),
                            pricingTypes.id == ''
                                ? const Offstage()
                                : pricingTypes.id == 'price'
                                    ? textField('Price', false, priceController,
                                        textInputType: TextInputType.number)
                                    : pricingTypes.id == 'range'
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: textField('Start', false,
                                                    priceStartController),
                                              ),
                                              const Text('To'),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: textField('End', false,
                                                    priceEndController),
                                              ),
                                            ],
                                          )
                                        : const Offstage(),
                            TitleWidget(
                              padding: 5.0,
                              text: 'Select Pricing Terms',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: ChipsChoice<PriceUnit>.single(
                                choiceStyle: const C2ChoiceStyle(color: kGreen),
                                wrapped: true,
                                value: priceUnits,
                                choiceItems:
                                    C2Choice.listFrom<PriceUnit, PriceUnit>(
                                  source: listingConfigController
                                      .listingConfig.value.config.priceUnits,
                                  value: (i, v) => v,
                                  label: (i, v) => v.name,
                                ),
                                onChanged: (val) {
                                  setState(() => priceUnits = val);
                                  print(priceUnits.id);
                                },
                              ),
                            ),
                            // add here pricing unit
                            // TitleWidget(
                            //   padding: 5.0,
                            //   text: 'Select Negotiation Term',
                            // ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(vertical: 5.0),
                            //   child: RadioGroup<PricType>.builder(
                            //     activeColor: kGreen,
                            //     direction: Axis.horizontal,
                            //     groupValue: priceTypes,
                            //     onChanged: (value) => setState(() {
                            //       priceTypes = value;
                            //     }),
                            //     items: listingConfigController
                            //         .listingConfig.value.config.priceTypes,
                            //     itemBuilder: (item) => RadioButtonBuilder(
                            //       item.name,
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 20),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: listingConfigController
                                      .listingConfig.value.customFields.length,
                                  itemBuilder: ((context, index) {
                                    return listingConfigController
                                                .listingConfig
                                                .value
                                                .customFields[index]
                                                .type ==
                                            'checkbox'
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TitleWidget(
                                                padding: 5.0,
                                                text: listingConfigController
                                                    .listingConfig
                                                    .value
                                                    .customFields[index]
                                                    .label,
                                              ),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    listingConfigController
                                                        .listingConfig
                                                        .value
                                                        .customFields[index]
                                                        .options
                                                        .choices
                                                        .length,
                                                itemBuilder:
                                                    (context, position) {
                                                  amenities.add(false);
                                                  return Row(
                                                    children: [
                                                      const SizedBox(width: 10),
                                                      Checkbox(
                                                        value:
                                                            amenities[position],
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            amenities[
                                                                    position] =
                                                                !amenities[
                                                                    position];
                                                            if (value!) {
                                                              myAmenities.add(
                                                                  "${listingConfigController.listingConfig.value.customFields[index].options.choices[position].id}");
                                                            }
                                                          });
                                                        },
                                                        checkColor: white,
                                                        activeColor: kGreen,
                                                      ),
                                                      Text(
                                                        "${listingConfigController.listingConfig.value.customFields[index].options.choices[position].name}",
                                                        style: const TextStyle(
                                                            fontSize: 17.0),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ],
                                          )
                                        : listingConfigController
                                                    .listingConfig
                                                    .value
                                                    .customFields[index]
                                                    .type ==
                                                'radio'
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  /// purpuse
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    listingConfigController
                                                        .listingConfig
                                                        .value
                                                        .customFields[index]
                                                        .label,
                                                    style: const TextStyle(
                                                        color: darkGrey,
                                                        fontSize: 20),
                                                  ),
                                                  ChipsChoice<Choice>.single(
                                                    choiceStyle:
                                                        const C2ChoiceStyle(
                                                            color: kGreen),
                                                    wrapped: true,
                                                    value: selectedFields[index]
                                                        .choice,
                                                    choiceItems:
                                                        C2Choice.listFrom<
                                                            Choice, Choice>(
                                                      source:
                                                          listingConfigController
                                                              .listingConfig
                                                              .value
                                                              .customFields[
                                                                  index]
                                                              .options
                                                              .choices,
                                                      value: (i, v) => v,
                                                      label: (i, v) => v.name,
                                                    ),
                                                    onChanged: (val) {
                                                      setState(() {
                                                        customField = val;
                                                        selectedFields.insert(
                                                            index,
                                                            SelectedFieldsModel(
                                                                listingConfigController
                                                                    .listingConfig
                                                                    .value
                                                                    .customFields[
                                                                        index]
                                                                    .id,
                                                                val));
                                                      });
                                                    },
                                                  ),
                                                ],
                                              )
                                            : listingConfigController
                                                        .listingConfig
                                                        .value
                                                        .customFields[index]
                                                        .type ==
                                                    'select'
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        listingConfigController
                                                            .listingConfig
                                                            .value
                                                            .customFields[index]
                                                            .label,
                                                        style: const TextStyle(
                                                            color: darkGrey,
                                                            fontSize: 20),
                                                      ),
                                                      ChipsChoice<
                                                          Choice>.single(
                                                        choiceStyle:
                                                            const C2ChoiceStyle(
                                                                color: kGreen),
                                                        wrapped: true,
                                                        value: selectedFields[
                                                                index]
                                                            .choice,
                                                        choiceItems:
                                                            C2Choice.listFrom<
                                                                Choice, Choice>(
                                                          source:
                                                              listingConfigController
                                                                  .listingConfig
                                                                  .value
                                                                  .customFields[
                                                                      index]
                                                                  .options
                                                                  .choices,
                                                          value: (i, v) => v,
                                                          label: (i, v) =>
                                                              v.name,
                                                        ),
                                                        onChanged: (val) {
                                                          setState(() {
                                                            customField = val;
                                                            selectedFields.insert(
                                                                index,
                                                                SelectedFieldsModel(
                                                                    listingConfigController
                                                                        .listingConfig
                                                                        .value
                                                                        .customFields[
                                                                            index]
                                                                        .id,
                                                                    val));
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : const Offstage();
                                  })),
                            ),
                          ],
                        ),
                      );
                    })
                  : const Offstage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  print('my price input is ${priceController.text}');
                  var _latitude = await box.read('latitude');
                  var _longitude = await box.read('longitude');
                  // var location = await box.read("city");
                  await listingsController.addListing(
                    zipCodeController.text,
                    addressController.text,
                    phoneNumberController.text,
                    whatsAppController.text,
                    emailController.text,
                    websiteController.text,
                    locationsController.userLocationId.value,
                    subCategory.termId,
                    listingType.id,
                    titleController.text,
                    '',
                    pricingTypes.id == 'price'
                        ? priceController.text
                        : priceStartController.text +
                            '-' +
                            priceEndController.text,
                    pricingTypes.id,
                    priceUnits.id,
                    '',
                    descriptionController.text,
                    imageFiles,
                    _latitude,
                    _longitude,
                    videoController.text,
                    selectedFields,
                    jsonEncode(myAmenities),
                  );
                  await myListingController.getMyListing();
                  Get.to(() => const MyListings());
                  Get.snackbar('Listing Posted',
                      'Your listing is pending for Approval from Admin',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: kGreen,
                      colorText: white);
                },
                style: ElevatedButton.styleFrom(
                  primary: kGreen,
                  onSurface: white,
                ),
                child: const Text(
                  'Post Listing',
                  style: TextStyle(fontSize: 18),
                ))),
      ),
    );
  }

  _getFromGallery() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    for (int i = 0; i < images!.length; i++) {
      setState(() {
        imageFiles!.addAll(images);
      });
    }
  }

  imageContainer(file, index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(
                file,
              ),
              fit: BoxFit.cover),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  imageFiles!.removeAt(index);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  locationService() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    var currentLocation = await location.getLocation();
    var latitude = currentLocation.latitude.toString();
    var longitude = currentLocation.longitude.toString();
    box.write('longitude', longitude);
    box.write('latitude', latitude);
    print(latitude);
    print(longitude);
    Get.snackbar('Success', "Your Current Location is selected",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kGreen,
        colorText: white);

    print(currentLocation.toString());
  }
}

class TitleWidget extends StatelessWidget {
  var text;
  var padding;
  TitleWidget({
    required this.padding,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding, horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(color: darkGrey, fontSize: 16),
      ),
    );
  }
}
