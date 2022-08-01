import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:realestapp/AddListings/select_city.dart';
import 'package:realestapp/Categories/Widgets/select_country.dart';
import 'package:realestapp/Controllers/search_controller.dart';
import 'package:realestapp/Search/search_page.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../Controllers/location_controller.dart';
import '../Utils/color_scheme.dart';

class MyFilters extends StatefulWidget {
  const MyFilters({Key? key}) : super(key: key);

  @override
  State<MyFilters> createState() => _MyFiltersState();
}

class _MyFiltersState extends State<MyFilters> {
  final SearchController _searchController = Get.put(SearchController());
  final TextEditingController startRangeController = TextEditingController();
  final TextEditingController endRangeController = TextEditingController();
  RangeValues _currentRangeValues = const RangeValues(0, 30);
  var _distanceRangeValues = 0.0;
  var listingType = "".obs;
  final locationsController = Get.put(LocationsController());
  final box = GetStorage();
  var locationId = ''.obs;
  var locationName = ''.obs;
  var location = Location();
  var latitude = ''.obs;
  var longitude = ''.obs;
  double _lowerValue = 50;
  double _upperValue = 18000;
  var startRange = '0'.obs;
  var endRange = '250000'.obs;
  var distance = ''.obs;
  var sortBy = 'date-desc'.obs;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startRangeController.text = "5000";
    endRangeController.text = "15000";

    _currentRangeValues = RangeValues(5000, 15000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Filters',
          style: TextStyle(
            color: darkGrey,
          ),
        ),
        elevation: 0.0,
        backgroundColor: transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            color: darkGrey,
            size: 34,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: mediumGrey,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Toggle

            divide(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.verified,
                        color: mediumGrey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'I want to',
                        style: TextStyle(color: darkGrey),
                      ),
                    ],
                  ),
                  ToggleSwitch(
                    minWidth: 65.0,
                    initialLabelIndex: 1,
                    cornerRadius: 20.0,
                    activeFgColor: white,
                    inactiveBgColor: lightGrey,
                    inactiveFgColor: darkGrey,
                    totalSwitches: 2,
                    labels: const ['Rent', 'Buy'],
                    activeBgColors: const [
                      [lightGreen],
                      [lightGreen]
                    ],
                    onToggle: (index) {
                      listingType.value = index == 0 ? "rent" : "buy";
                      print(listingType.value);
                    },
                  ),
                ],
              ),
            ),
            divide(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12, top: 5, bottom: 5),
              child: InkWell(
                onTap: (() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Select State',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          content: SizedBox(
                            height: 500,
                            width: 300,
                            child: ListView.builder(
                                itemCount: locationsController.locations.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      locationsController.getSubLocation(
                                          locationsController
                                              .locations.value[index].termId);
                                      box.write(
                                          'country',
                                          locationsController
                                              .locations.value[index].termId);
                                      print(box.read("country"));
                                      Navigator.pop(context, true);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Select City',
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              content: SizedBox(
                                                height: 500,
                                                width: 300,
                                                child: Obx(
                                                  () => ListView.builder(
                                                      itemCount:
                                                          locationsController
                                                              .subLocations
                                                              .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () async {
                                                            locationsController.updateLocationName(
                                                                await locationsController
                                                                    .subLocations
                                                                    .value[
                                                                        index]
                                                                    .termId,
                                                                await locationsController
                                                                    .subLocations
                                                                    .value[
                                                                        index]
                                                                    .name);
                                                            Navigator.pop(
                                                                context, true);
                                                            locationId.value =
                                                                locationsController
                                                                    .subLocations
                                                                    .value[
                                                                        index]
                                                                    .termId
                                                                    .toString();
                                                            print(locationId
                                                                .value);
                                                            locationName.value =
                                                                locationsController
                                                                    .subLocations
                                                                    .value[
                                                                        index]
                                                                    .name;
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    lightGreen,
                                                                border: Border.all(
                                                                    color:
                                                                        white,
                                                                    style: BorderStyle
                                                                        .solid)),
                                                            child: Center(
                                                              child: Text(
                                                                locationsController
                                                                    .subLocations
                                                                    .value[
                                                                        index]
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    const TextStyle(
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
                                          });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: lightGreen,
                                          border: Border.all(
                                              color: white,
                                              style: BorderStyle.solid)),
                                      child: Center(
                                        child: Text(
                                          locationsController
                                              .locations.value[index].name,
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
                      });
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: mediumGrey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'City',
                                style: TextStyle(color: darkGrey),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              locationName.value == ''
                                  ? Text(
                                      'Select City',
                                      style: TextStyle(color: lightGreen),
                                    )
                                  : Text(
                                      locationName.toString(),
                                      style: const TextStyle(color: lightGreen),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.navigate_next,
                      color: mediumGrey,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            //Search Locations

            divide(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12, top: 5, bottom: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.map,
                        color: mediumGrey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Select Locations',
                        style: TextStyle(color: darkGrey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Slider(
                          inactiveColor: lightGrey,
                          activeColor: lightGreen,
                          value: _distanceRangeValues,
                          max: 300,
                          min: 0,
                          divisions: 10,
                          label: _distanceRangeValues.round().toString(),
                          onChanged: (values) {
                            setState(() {
                              _distanceRangeValues = values;
                              distance.value =
                                  _distanceRangeValues.round().toString();
                            });
                            print(distance.value);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Badge(
                        badgeContent: const Icon(
                          Icons.location_pin,
                          color: brightRed,
                        ),
                        badgeColor: transparent,
                        elevation: 0.0,
                        position: const BadgePosition(top: -16.0, end: -8.0),
                        child: Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: lightGreen),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.map, color: lightGreen),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Map'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  //Price Range
                  divide(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12, top: 5, bottom: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.tag,
                                  color: mediumGrey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Price Range',
                                  style: TextStyle(color: darkGrey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: startRangeController,
                                cursorColor: lightGreen,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0',
                                  suffixIconColor: lightGreen,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: mediumGrey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: lightGreen)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'TO',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: endRangeController,
                                cursorColor: lightGreen,
                                decoration: InputDecoration(
                                  hintText: 'Any',
                                  suffixIconColor: lightGreen,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: mediumGrey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: lightGreen)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        RangeSlider(
                          inactiveColor: lightGrey,
                          activeColor: lightGreen,
                          values: _currentRangeValues,
                          max: 30000,
                          divisions: 100,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString(),
                            _currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                              startRange.value =
                                  _currentRangeValues.start.round().toString();
                              endRange.value =
                                  _currentRangeValues.end.round().toString();
                              startRangeController.text = startRange.value;
                              endRangeController.text = endRange.value;
                            });
                            print(startRange.value);
                            print(endRange.value);
                          },
                        ),
                      ],
                    ),
                  ),
                  //Bedrooms
                  /// sortings
                  //divide(),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 12.0, right: 12, top: 5, bottom: 5),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: const [
                  //               FaIcon(
                  //                 FontAwesomeIcons.sort,
                  //                 color: mediumGrey,
                  //               ),
                  //               SizedBox(
                  //                 width: 8,
                  //               ),
                  //               Text(
                  //                 'Sort By',
                  //                 style: TextStyle(color: darkGrey),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //       Obx(() => Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Row(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Radio(value: "price-desc", groupValue: sortBy.value, onChanged: (v){sortBy.value=v.toString();}),
                  //               Text('Low to High')
                  //             ],
                  //           ),
                  //           Row(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Radio(value: "price-asc", groupValue: sortBy.value, onChanged: (v){sortBy.value=v.toString();}),
                  //               Text('High to Low')
                  //             ],
                  //           ),
                  //
                  //           Row(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Radio(value: "date-desc", groupValue: sortBy.value, onChanged: (v){sortBy.value=v.toString();}),
                  //               Text('New to Old')
                  //             ],
                  //           ),
                  //
                  //           Row(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Radio(value: "date-asc", groupValue: sortBy.value, onChanged: (v){sortBy.value=v.toString();}),
                  //               Text('Old to New')
                  //             ],
                  //           ),
                  //           // SizedBox(
                  //           //   width: MediaQuery.of(context).size.width / 2.5,
                  //           //   height: 60,
                  //           //   child: ElevatedButton(
                  //           //     onPressed: () {
                  //           //       sortBy.value = 'price-desc';
                  //           //     },
                  //           //     child: const Text('Low to High'),
                  //           //     style: ElevatedButton.styleFrom(
                  //           //         primary: lightGreen, elevation: 0.0),
                  //           //   ),
                  //           // ),
                  //           // SizedBox(
                  //           //   width: 20,
                  //           // ),
                  //           // SizedBox(
                  //           //   width: MediaQuery.of(context).size.width / 2.5,
                  //           //   height: 60,
                  //           //   child: ElevatedButton(
                  //           //     onPressed: () {
                  //           //       sortBy.value = 'price-asc';
                  //           //     },
                  //           //     child: const Text('High to Low'),
                  //           //     style: ElevatedButton.styleFrom(
                  //           //         primary: lightGreen, elevation: 0.0),
                  //           //   ),
                  //           // ),
                  //         ],
                  //       ),),
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // divide(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        color: transparent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  startRange.value = 0.toString();
                  endRange.value = 0.toString();
                  setState(() {
                    _currentRangeValues = const RangeValues(0, 30);
                  });
                  startRangeController.text = startRange.value;
                  endRangeController.text = endRange.value;
                  locationId.value = '';
                  locationName.value = '';
                  distance.value = '';
                  longitude.value = '';
                  latitude.value = '';
                  _distanceRangeValues = 0.0;
                  sortBy.value = '';
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(color: mediumGrey, fontSize: 16),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    if (locationId.value != '') {
                      await _searchController.getFilteredData(
                          listingType,
                          locationId,
                          latitude,
                          longitude,
                          distance,
                          startRange,
                          endRange,
                          '');
                      Get.back();
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please select a location',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: white,
                      );
                    }
                  },
                  child: const Text('Apply Filters'),
                  style: ElevatedButton.styleFrom(
                      primary: lightGreen, elevation: 0.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  divide() {
    return const Divider(
      thickness: 0.4,
      color: darkGrey,
    );
  }

  labelButtons(title) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title),
      style: ElevatedButton.styleFrom(
        onPrimary: lightGreen,
        primary: transparent,
        elevation: 0.0,
        side: const BorderSide(color: lightGreen),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  roundButton(title) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title),
      style: ElevatedButton.styleFrom(
        onPrimary: darkGrey,
        primary: lightGrey,
        elevation: 0.0,
        shape: const CircleBorder(),
      ),
    );
  }

  tabContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('All'),
            icon: const Icon(
              Icons.location_on,
              color: lightGreen,
              size: 18,
            ),
            style: ElevatedButton.styleFrom(
              onPrimary: lightGreen,
              primary: transparent,
              elevation: 0.0,
              side: const BorderSide(color: lightGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('Residential Plot'),
            icon: const Icon(
              Icons.location_on,
              color: lightGreen,
              size: 18,
            ),
            style: ElevatedButton.styleFrom(
              onPrimary: lightGreen,
              primary: transparent,
              elevation: 0.0,
              side: const BorderSide(color: lightGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('Commercial Plot'),
            icon: const Icon(
              Icons.location_on,
              color: lightGreen,
              size: 18,
            ),
            style: ElevatedButton.styleFrom(
              onPrimary: lightGreen,
              primary: transparent,
              elevation: 0.0,
              side: const BorderSide(color: lightGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
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
    var _latitude = currentLocation.latitude.toString();
    var _longitude = currentLocation.longitude.toString();
    box.write('longitude', _longitude);
    box.write('latitude', _latitude);
    longitude.value = _longitude;
    latitude.value = _latitude;
    print(_latitude);
    print(_longitude);

    print(currentLocation.toString());
  }
}
