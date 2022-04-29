import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'color_scheme.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues _currentRangeValues = const RangeValues(0, 30);
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
                'Done',
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
                    onToggle: (index) {},
                  ),
                ],
              ),
            ),
            //City

            divide(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12, top: 5, bottom: 5),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'City',
                            style: TextStyle(color: darkGrey),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Johannesburg',
                            style: TextStyle(color: lightGreen),
                          ),
                        ],
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
                        child: TextField(
                          cursorColor: lightGreen,
                          decoration: InputDecoration(
                            iconColor: lightGreen,
                            suffixIcon: const Icon(Icons.search),
                            hintText: 'Search Locations',
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

//Property Types
            divide(),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.location_city,
                          color: mediumGrey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Property Types',
                          style: TextStyle(color: darkGrey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          const TabBar(
                            labelColor: lightGreen,
                            indicatorColor: lightGreen,
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(
                                text: 'Homes',
                              ),
                              Tab(
                                text: 'Plots',
                              ),
                              Tab(
                                text: 'Commercial',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                tabContent(),
                                tabContent(),
                                tabContent(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Price',
                                  style: TextStyle(color: darkGrey),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: darkGrey,
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
                              child: TextField(
                                cursorColor: lightGreen,
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
                              child: TextField(
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
                          max: 100,
                          divisions: 100,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString(),
                            _currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  //Area Range
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
                                  FontAwesomeIcons.rulerVertical,
                                  color: mediumGrey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Area Range',
                                  style: TextStyle(color: darkGrey),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Marla',
                                  style: TextStyle(color: darkGrey),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: darkGrey,
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
                              child: TextField(
                                cursorColor: lightGreen,
                                decoration: InputDecoration(
                                  hintText: '3',
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
                              child: TextField(
                                cursorColor: lightGreen,
                                decoration: InputDecoration(
                                  hintText: '3',
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
                          max: 100,
                          divisions: 100,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString(),
                            _currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            labelButtons('3 Marla'),
                            labelButtons('5 Marla'),
                            labelButtons('7 Marla'),
                            labelButtons('8 Marla'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Bedrooms
                  divide(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 12.0, right: 12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.bed,
                              color: mediumGrey,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Bedrooms',
                              style: TextStyle(color: darkGrey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          children: [
                            roundButton('1'),
                            roundButton('2'),
                            roundButton('3'),
                            roundButton('4'),
                            roundButton('5'),
                            roundButton('6'),
                            roundButton('7'),
                            roundButton('8'),
                            roundButton('9'),
                            roundButton('10+'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Bsthroom
                  divide(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 12.0, right: 12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.bath,
                              color: mediumGrey,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Bathrooms',
                              style: TextStyle(color: darkGrey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          children: [
                            roundButton('1'),
                            roundButton('2'),
                            roundButton('3'),
                            roundButton('4'),
                            roundButton('5'),
                            roundButton('6'),
                            roundButton('7'),
                            roundButton('8'),
                            roundButton('9'),
                            roundButton('10+'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  divide(),
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
              const Text(
                'Reset',
                style: TextStyle(color: mediumGrey, fontSize: 16),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Show 1000+ Ads'),
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
}
