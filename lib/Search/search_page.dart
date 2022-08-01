import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:realestapp/AddListings/select_country.dart';
import 'package:realestapp/Categories/filters.dart';
import 'package:realestapp/Controllers/listing_type_controller.dart';
import 'package:realestapp/Controllers/location_controller.dart';
import 'package:realestapp/Controllers/search_controller.dart';
import 'package:realestapp/Models/Categories/category_model.dart';
import 'package:realestapp/Models/locations_model.dart';
import 'package:realestapp/Models/selected_fields_model.dart';
import 'package:realestapp/Search/Widgets/SearchRessultCard.dart';
import '../Controllers/categories_controller.dart';
import '../Controllers/listing_config_controller.dart';
import '../Models/listing_configuration_model.dart';
import '../Models/listing_types_model.dart';
import '../Utils/color_scheme.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController searchController = Get.put(SearchController());
  var sortBy = 'date-desc'.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // TODO: include sortby along search field.
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for Listings',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.close),
                        suffixIconColor: lightGreen,
                        prefixIconColor: lightGreen,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: darkGrey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: lightGreen,
                          ),
                        ),
                      ),
                      onSubmitted: (value) {
                        searchController.getSearchedListings(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() {
              return searchController.searchListings.value.data == null
                  ? const CircularProgressIndicator(
                      color: Colors.greenAccent,
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            searchController.searchListings.value.data!.length,
                        itemBuilder: (context, position) {
                          return SearchResultCard(
                            image: searchController
                                .searchListings.value.data![position].images,
                            title: searchController
                                .searchListings.value.data![position].title,
                            city:
                                '${searchController.searchListings.value.data![position].contact!.locations![1].name}, ${searchController.searchListings.value.data![position].contact!.locations![0].name}',
                            price: searchController
                                .searchListings.value.data![position].price,
                            isFovorite: false,
                            description: '',
                            listingId: searchController
                                .searchListings.value.data![position].listingId,
                          );
                        },
                      ),
                    );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.filter_list),
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Get.to(const MyFilters());
        },
      ),
    );
  }
}

class FillterBottomSheet extends StatefulWidget {
  const FillterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FillterBottomSheet> createState() => _FillterBottomSheetState();
}

class _FillterBottomSheetState extends State<FillterBottomSheet> {
  final listingTypeController = Get.put(ListingTypeController());
  final categoriesController = Get.put(CategoriesController());
  final listingConfigController = Get.put(ListingConfigController());
  List<SelectedFieldsModel> selectedFields = List<SelectedFieldsModel>.filled(
      20, SelectedFieldsModel(0, Choice(id: '0', name: '0')),
      growable: true);
  var myAmenities = List<String>.empty(growable: true);
  bool categorySelected = false;
  bool subCategorySelected = false;
  List<dynamic> amenities = [false];
  double _lowerValue = 50;
  double _upperValue = 1800;
  Rx<ListingTypes> listingType = ListingTypes().obs;
  final locationsController = Get.put(LocationsController());
  var category;
  var subCategory;
  var priceTypes;
  var pricingTypes;
  var priceUnits;
  var customField;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Obx(
            () => Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: SizedBox(
                    width: 200,
                    height: 46,
                    child: ElevatedButton.icon(
                      onPressed: () async {
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
                        primary: lightGreen,
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
                        label: Text(locationsController.userLocationName.value
                            .toString()),
                      )
                    : const Offstage(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Price Range",
              style: TextStyle(color: darkGrey, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
            child: RangeSliderFlutter(
              min: 0,
              max: 1000000,
              values: [_lowerValue, _upperValue],
              rangeSlider: true,
              tooltip: RangeSliderFlutterTooltip(
                alwaysShowTooltip: true,
              ),
              textPositionTop: -70,
              handlerHeight: 20,
              trackBar: RangeSliderFlutterTrackBar(
                activeTrackBarHeight: 10,
                inactiveTrackBarHeight: 10,
                activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                inactiveTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
              fontSize: 15,
              textBackgroundColor: Colors.green,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                _lowerValue = lowerValue;
                _upperValue = upperValue;
              },
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Select Listing Type",
              style: TextStyle(color: darkGrey, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
            child: Obx(
              () => ChipsChoice<ListingTypes>.single(
                choiceStyle: const C2ChoiceStyle(color: lightGreen),
                wrapped: true,
                onChanged: (val) {
                  listingType.value = val;
                  print(listingType.value.id.toString());
                },
                value: listingType.value,
                choiceItems: C2Choice.listFrom<ListingTypes, ListingTypes>(
                  source: listingTypeController.listingTypes.value,
                  value: (i, v) => v,
                  label: (i, v) => v.name,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Select A Category",
              style: TextStyle(color: darkGrey, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            child: ChipsChoice<CategoriesModel>.single(
              choiceStyle: const C2ChoiceStyle(color: lightGreen),
              wrapped: true,
              value: category,
              choiceItems: C2Choice.listFrom<CategoriesModel, CategoriesModel>(
                source: categoriesController.categories.value,
                value: (i, v) => v,
                label: (i, v) => v.name,
              ),
              onChanged: (val) async {
                await categoriesController.getSubCategories(val.termId);
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
          categorySelected
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: ChipsChoice<LocationsModel>.single(
                    choiceStyle: const C2ChoiceStyle(color: lightGreen),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Select Pricing Terms",
                            style: TextStyle(color: darkGrey, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ChipsChoice<PriceUnit>.single(
                            choiceStyle: const C2ChoiceStyle(color: lightGreen),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Select Negotiation Term",
                            style: TextStyle(color: darkGrey, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: RadioGroup<PricType>.builder(
                            activeColor: lightGreen,
                            direction: Axis.horizontal,
                            groupValue: priceTypes,
                            onChanged: (value) => setState(() {
                              priceTypes = value;
                            }),
                            items: listingConfigController
                                .listingConfig.value.config.priceTypes,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item.name,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listingConfigController
                                  .listingConfig.value.customFields.length,
                              itemBuilder: ((context, index) {
                                return listingConfigController.listingConfig
                                            .value.customFields[index].type ==
                                        'checkbox'
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              listingConfigController
                                                  .listingConfig
                                                  .value
                                                  .customFields[index]
                                                  .label,
                                              style: const TextStyle(
                                                  color: darkGrey,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: listingConfigController
                                                .listingConfig
                                                .value
                                                .customFields[index]
                                                .options
                                                .choices
                                                .length,
                                            itemBuilder: (context, position) {
                                              amenities.add(false);
                                              return Row(
                                                children: [
                                                  const SizedBox(width: 10),
                                                  Checkbox(
                                                    value: amenities[position],
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        amenities[position] =
                                                            !amenities[
                                                                position];
                                                        if (value!) {
                                                          myAmenities.add(
                                                              "${listingConfigController.listingConfig.value.customFields[index].options.choices[position].id}");
                                                        }
                                                      });
                                                    },
                                                    checkColor: white,
                                                    activeColor: lightGreen,
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
                                                        color: lightGreen),
                                                wrapped: true,
                                                value: selectedFields[index]
                                                    .choice,
                                                choiceItems: C2Choice.listFrom<
                                                    Choice, Choice>(
                                                  source:
                                                      listingConfigController
                                                          .listingConfig
                                                          .value
                                                          .customFields[index]
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
                                                  ChipsChoice<Choice>.single(
                                                    choiceStyle:
                                                        const C2ChoiceStyle(
                                                            color: lightGreen),
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
                                                      print(customField);
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
    );
  }
}
