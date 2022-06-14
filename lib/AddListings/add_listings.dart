// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestapp/Controllers/LocationController.dart';
import 'package:realestapp/Controllers/categories_controller.dart';
import 'package:realestapp/Controllers/listing_config_controller.dart';
import 'package:realestapp/Controllers/listing_type_controller.dart';
import 'package:realestapp/Models/all_listing_model.dart';
import 'package:realestapp/Models/listing_configuration_model.dart';
import 'package:realestapp/Models/listing_types_model.dart';
import '../Controllers/listings_controller.dart';
import '../Models/Categories/category_model.dart' hide Icon;
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
  final categoriesController = Get.put(CategoriesController());
  final listingConfigController = Get.put(ListingConfigController());
  bool categorySelected = false;
  final listingsController = Get.put(ListingController());
  var category;
  var listingType;
  var priceTypes;
  var pricingTypes;
  final priceController = TextEditingController();
  final priceStartController = TextEditingController();
  final priceEndController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleController = TextEditingController();

  final locationsController = Get.put(LocationsController());
  List<dynamic> amenities = [false];
  List<SelectedFieldsModel>? selectedFields;
  List<XFile>? imageFiles = [];
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
            color: lightGreen,
            size: 34,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Add Listing',
          style: TextStyle(
            color: lightGreen,
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
              const SizedBox(
                height: 10,
              ),
              defaultButton('Add Location', () {
                Get.to(const SelectCountry());
              }),
              const Text(
                'Listing Type',
                style: TextStyle(color: darkGrey, fontSize: 20),
              ),
              ChipsChoice<ListingTypes>.single(
                choiceStyle: const C2ChoiceStyle(color: lightGreen),
                wrapped: true,
                value: listingType,
                choiceItems: C2Choice.listFrom<ListingTypes, ListingTypes>(
                  source: listingTypeController.listingTypes.value,
                  value: (i, v) => v,
                  label: (i, v) => v.name,
                ),
                onChanged: (val) {
                  setState(() => listingType = val);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Category',
                style: TextStyle(color: darkGrey, fontSize: 20),
              ),
              ChipsChoice<CategoriesModel>.single(
                choiceStyle: const C2ChoiceStyle(color: lightGreen),
                wrapped: true,
                value: category,
                choiceItems:
                    C2Choice.listFrom<CategoriesModel, CategoriesModel>(
                  source: categoriesController.categories.value,
                  value: (i, v) => v,
                  label: (i, v) => v.name,
                ),
                onChanged: (val) async {
                  await listingConfigController.getConfiguration(val.termId);
                  setState(() {
                    category = val;
                    categorySelected = true;
                    pricingTypes = PricType();
                    pricingTypes.id = '';
                    pricingTypes.name = '';
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              categorySelected
                  ? Obx(() {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pricing Type',
                            style: TextStyle(color: darkGrey, fontSize: 20),
                          ),
                          ChipsChoice<PricType>.single(
                            choiceStyle: const C2ChoiceStyle(color: lightGreen),
                            wrapped: true,
                            value: pricingTypes,
                            choiceItems: C2Choice.listFrom<PricType, PricType>(
                              source: listingConfigController
                                  .listingConfig.value.config.pricingTypes,
                              value: (i, v) => v,
                              label: (i, v) => v.name,
                            ),
                            onChanged: (val) {
                              setState(() => pricingTypes = val);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          pricingTypes.id == ''
                              ? const Offstage()
                              : pricingTypes.id == 'price'
                                  ? textField('Price', false, priceController)
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
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Price Type',
                            style: TextStyle(color: darkGrey, fontSize: 20),
                          ),
                          RadioGroup<PricType>.builder(
                            activeColor: lightGreen,
                            direction: Axis.horizontal,
                            groupValue: priceTypes,
                            onChanged: (value) => setState(() {
                              print(listingConfigController.listingConfig.value
                                  .customFields[0].options.choices[0].name);
                              priceTypes = value;
                            }),
                            items: listingConfigController
                                .listingConfig.value.config.priceTypes,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item.name,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 1000,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: listingConfigController
                                    .listingConfig.value.customFields.length,
                                itemBuilder: ((context, index) {
                                  return listingConfigController.listingConfig
                                              .value.customFields[index].type ==
                                          'radio'
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: RadioGroup<Choice>.builder(
                                                activeColor: lightGreen,
                                                direction: Axis.horizontal,
                                                groupValue:
                                                    selectedFields?[index]
                                                        .choiceName,
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedFields?.add(
                                                      SelectedFieldsModel(
                                                          listingConfigController
                                                              .listingConfig
                                                              .value
                                                              .customFields[
                                                                  index]
                                                              .id,
                                                          value?.id,
                                                          value?.name));
                                                }),
                                                items: listingConfigController
                                                    .listingConfig
                                                    .value
                                                    .customFields[index]
                                                    .options
                                                    .choices,
                                                itemBuilder: (item) =>
                                                    RadioButtonBuilder(
                                                  item.name,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : listingConfigController
                                                  .listingConfig
                                                  .value
                                                  .customFields[index]
                                                  .type ==
                                              'checkbox'
                                          ? SizedBox(
                                              height: 900,
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                          const SizedBox(
                                                              width: 10),
                                                          Checkbox(
                                                            value: amenities[
                                                                position],
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                amenities[
                                                                        position] =
                                                                    !amenities[
                                                                        position];
                                                              });
                                                            },
                                                            checkColor: white,
                                                            activeColor:
                                                                lightGreen,
                                                          ),
                                                          Text(
                                                            "${listingConfigController.listingConfig.value.customFields[index].options.choices[position].name}",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        17.0),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ))
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
                                                      CrossAxisAlignment.start,
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
                                                    RadioGroup<Choice>.builder(
                                                      activeColor: lightGreen,
                                                      direction:
                                                          Axis.horizontal,
                                                      groupValue:
                                                          selectedFields?[index]
                                                              .choiceName,
                                                      onChanged: (value) =>
                                                          setState(() {
                                                        selectedFields?.add(
                                                            SelectedFieldsModel(
                                                                listingConfigController
                                                                    .listingConfig
                                                                    .value
                                                                    .customFields[
                                                                        index]
                                                                    .id,
                                                                value?.id,
                                                                value?.name));
                                                      }),
                                                      items:
                                                          listingConfigController
                                                              .listingConfig
                                                              .value
                                                              .customFields[
                                                                  index]
                                                              .options
                                                              .choices,
                                                      itemBuilder: (item) =>
                                                          RadioButtonBuilder(
                                                        item.name,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : const Offstage();
                                })),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Title',
                            style: TextStyle(color: darkGrey, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          textField('Title', false, titleController),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(color: darkGrey, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: descriptionController,
                            obscureText: false,
                            cursorColor: lightGreen,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: mediumGrey,
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: lightGreen,
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                              fillColor: white,
                              hintText: 'Description',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Add Photos',
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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
                                      color: lightGreen,
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
                                            File(imageFiles![index].path));
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    })
                  : const Offstage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  listingsController.addListing(
                      locationsController.userLocationId,
                      category.termId,
                      listingType.id,
                      titleController.text,
                      'approved',
                      pricingTypes == 'price'
                          ? priceController.text
                          : priceStartController.text +
                              '-' +
                              priceEndController.text,
                      '',
                      '',
                      descriptionController.text,
                      imageFiles,
                      []);
                },
                style: ElevatedButton.styleFrom(
                  primary: lightGreen,
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

  imageContainer(file) {
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
      ),
    );
  }
}
