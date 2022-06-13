// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:realestapp/Controllers/categories_controller.dart';
import 'package:realestapp/Controllers/listing_config_controller.dart';
import 'package:realestapp/Controllers/listing_type_controller.dart';
import 'package:realestapp/Models/all_listing_model.dart';
import 'package:realestapp/Models/listing_configuration_model.dart';
import 'package:realestapp/Models/listing_types_model.dart';
import '../Models/Categories/category_model.dart' hide Icon;
import '../Models/selected_fields_model.dart';
import '../Utils/color_scheme.dart';

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
  var category;
  var listingType;
  var priceTypes;
  var pricingTypes;
  var amenities;
  List<SelectedFieldsModel>? selectedFields;
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
                     for(int j=0;j<listingConfigController
                                                .listingConfig
                                                .value
                                                .customFields.length;j++){
                      for(int i=0;i<listingConfigController
                                                .listingConfig
                                                .value
                                                .customFields[j].label == 'Amenities'
                                                .options
                                                .choices.length;i++){
                                                  amenities.add(listingConfigController
                                                .listingConfig
                                                .value
                                                .customFields[index]
                                                .options
                                                .choices[i].name.toString());
                                                  }
                     }
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              categorySelected
                  ? Column(
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
                          height: 10,
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
                          height: 500,
                          child: ListView.builder(
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
                                            height: 10,
                                          ),
                                          Text(
                                            listingConfigController
                                                .listingConfig
                                                .value
                                                .customFields[index]
                                                .label,
                                            style: const TextStyle(
                                                color: darkGrey, fontSize: 20),
                                          ),
                                          RadioGroup<Choice>.builder(
                                            activeColor: lightGreen,
                                            direction: Axis.horizontal,
                                            groupValue: selectedFields?[index]
                                                .choiceName,
                                            onChanged: (value) => setState(() {
                                              selectedFields?.add(
                                                  SelectedFieldsModel(
                                                      listingConfigController
                                                          .listingConfig
                                                          .value
                                                          .customFields[index]
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
                                        ],
                                      )
                                    : listingConfigController
                                                .listingConfig
                                                .value
                                                .customFields[index]
                                                .type ==
                                            'checkbox'
                                        ? CheckboxGroup(
                                          activeColor: lightGreen,
                                            labels:  <String>[
                                              amenities,
                                              ],
                                            onSelected:
                                                (List<String> checked) =>
                                                    print(checked.toString()))
                                        : const Offstage();
                              })),
                        )
                      ],
                    )
                  : const Offstage(),
            ],
          ),
        ),
      ),
    );
  }
}


// BubbleRadioButton<Choice>(
//                                     inactiveColor: white,
//                                     activeTextColor: white,
//                                     inactiveBorderColor: white,
//                                     activeBorderColor: lightGreen,
//                                     activeColor: lightGreen,
//                                     inactiveTextColor: darkGrey,
//                                     fontSize: 18,
//                                     value: listingConfigController.listingConfig.value.customFields[index].choices[0].name,
//                                     groupValue: A,
//                                     leading: 'A',
//                                     onChanged: (value) {
//                                       setState(() {

//                                       });
//                                     },
//                                   )