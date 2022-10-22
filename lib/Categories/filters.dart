// ignore_for_file: invalid_use_of_protected_member, unused_field, unnecessary_null_comparison

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:lagosabuja/Controllers/search_controller.dart';
import 'package:lagosabuja/Utils/full_screen_dialog.dart';
import 'package:lagosabuja/Utils/global_Variable.dart';
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
  final _distanceRangeValues = 30.0.obs;
  var listingType = "".obs;
  final locationsController = Get.put(LocationsController());
  final box = GetStorage();
  var locationId = ''.obs;
  var locationName = 'Select City'.obs;
  var location = Location();
  var latitude = ''.obs;
  var longitude = ''.obs;
  final double _lowerValue = 50;
  final double _upperValue = 18000;
  var startRange = '0'.obs;
  var endRange = '250000'.obs;
  var distance = ''.obs;
  var sortBy = 'date-desc'.obs;
  var sortByName = ''.obs;

  @override
  void initState() {
    super.initState();
    sortBy.value = sortByGlobalValue.value != null
        ? sortByGlobalValue.toString()
        : 'date-desc';
    startRangeController.text = startRangeControllerGlobal.value ?? "5000";
    endRangeController.text = endRangeControllerGlobal.value ?? "250000";
    sortByName.value =
        sortByGlobal.value != null ? sortByGlobal.toString() : 'High to Low';
    listingType.value = iWantTo.toString();
    locationName.value = locationNameGlobal.value != null
        ? locationNameGlobal.toString()
        : "Select City";
    _distanceRangeValues.value = distanceRangeValueGlobal.value ?? 30.0;
    _currentRangeValues = const RangeValues(5000, 15000);
    latitude.value = box.read('latitude') ?? '';
    longitude.value = box.read('longitude') ?? '';
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
            PopupMenuButton<String>(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 30,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Obx(
                              () => Text(
                                sortByName.toString(),
                              ),
                            ),
                          ),
                          const Text("Sort"),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ))),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      const PopupMenuItem<String>(
                          value: "title-asc", child: Text('A to Z')),
                      const PopupMenuItem<String>(
                          value: "title-desc", child: Text('Z to A')),
                      const PopupMenuItem<String>(
                          value: "price-desc", child: Text('High to Low')),
                      const PopupMenuItem<String>(
                          value: "price-asc", child: Text('Low to High')),
                      const PopupMenuItem<String>(
                          value: "date-desc", child: Text('New to Old')),
                      const PopupMenuItem<String>(
                          value: "date-asc", child: Text('Old to New'))
                    ],
                onSelected: (String value) async {
                  sortBy.value = value;
                  sortByGlobalValue.value = value;
                  CustomFullScreenDialog.showDialog();
                  CustomFullScreenDialog.cancelDialog();
                  if (value == 'price-desc') {
                    sortByName.value = 'High to Low';
                    sortByGlobal.value = sortByName.value;
                  } else if (value == 'price-asc') {
                    sortByName.value = 'Low to High';
                    sortByGlobal.value = sortByName.value;
                  } else if (value == 'date-desc') {
                    sortByName.value = 'New to Old';
                    sortByGlobal.value = sortByName.value;
                  } else if (value == 'date-asc') {
                    sortByName.value = 'Old to New';
                    sortByGlobal.value = sortByName.value;
                  } else if (value == 'title-asc') {
                    sortByName.value = 'A to Z';
                    sortByGlobal.value = sortByName.value;
                  } else if (value == 'title-decs') {
                    sortByName.value = 'Z to A';
                    sortByGlobal.value = sortByName.value;
                  }
                }),
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
                    initialLabelIndex: listingType.value == 'buy' ? 1 : 0,
                    cornerRadius: 20.0,
                    activeFgColor: white,
                    inactiveBgColor: lightGrey,
                    inactiveFgColor: darkGrey,
                    totalSwitches: 2,
                    labels: const ['Rent', 'Buy'],
                    activeBgColors: const [
                      [kGreen],
                      [kGreen]
                    ],
                    onToggle: (index) {
                      listingType.value = index == 0 ? "rent" : "buy";
                      iWantTo.value = listingType.value;
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
                          title: const Text(
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
                                      Navigator.pop(context, true);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
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
                                                            locationName.value =
                                                                locationsController
                                                                    .subLocations
                                                                    .value[
                                                                        index]
                                                                    .name;
                                                            locationNameGlobal
                                                                    .value =
                                                                locationName
                                                                    .value;
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50,
                                                            decoration: BoxDecoration(
                                                                color: kGreen,
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
                                          color: kGreen,
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
                              locationName.value == null
                                  ? const Text(
                                      'Select City',
                                      style: TextStyle(color: kGreen),
                                    )
                                  : Text(
                                      locationName.toString(),
                                      style: const TextStyle(color: kGreen),
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
                          activeColor: kGreen,
                          value: _distanceRangeValues.value.toDouble(),
                          max: 300,
                          min: 0,
                          divisions: 10,
                          label: _distanceRangeValues.round().toString(),
                          onChanged: (values) {
                            setState(() {
                              _distanceRangeValues.value = values;
                              distance.value =
                                  _distanceRangeValues.round().toString();
                              distanceRangeValueGlobal.value =
                                  _distanceRangeValues.value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          locationService();
                        },
                        child: Badge(
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
                              border: Border.all(color: kGreen),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.map, color: kGreen),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Map'),
                              ],
                            ),
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
                                cursorColor: kGreen,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0',
                                  suffixIconColor: kGreen,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: mediumGrey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: kGreen)),
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
                                cursorColor: kGreen,
                                decoration: InputDecoration(
                                  hintText: 'Any',
                                  suffixIconColor: kGreen,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: mediumGrey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          const BorderSide(color: kGreen)),
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
                          activeColor: kGreen,
                          values: _currentRangeValues,
                          max: 300000,
                          divisions: 1000,
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
                              startRangeControllerGlobal.value =
                                  startRange.value;
                              endRangeControllerGlobal.value = endRange.value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
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
                  _distanceRangeValues.value = 0.0;
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
                          sortBy);
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
                  style:
                      ElevatedButton.styleFrom(primary: kGreen, elevation: 0.0),
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
        onPrimary: kGreen,
        primary: transparent,
        elevation: 0.0,
        side: const BorderSide(color: kGreen),
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
              color: kGreen,
              size: 18,
            ),
            style: ElevatedButton.styleFrom(
              onPrimary: kGreen,
              primary: transparent,
              elevation: 0.0,
              side: const BorderSide(color: kGreen),
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
              color: kGreen,
              size: 18,
            ),
            style: ElevatedButton.styleFrom(
              onPrimary: kGreen,
              primary: transparent,
              elevation: 0.0,
              side: const BorderSide(color: kGreen),
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
              color: kGreen,
              size: 18,
            ),
            style: ElevatedButton.styleFrom(
              onPrimary: kGreen,
              primary: transparent,
              elevation: 0.0,
              side: const BorderSide(color: kGreen),
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
  }
}
