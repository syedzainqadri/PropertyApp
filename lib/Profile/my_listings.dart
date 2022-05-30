import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AddListings/list_widget.dart';
import '../Utils/color_scheme.dart';

class MyListings extends StatefulWidget {
  const MyListings({Key? key}) : super(key: key);

  @override
  State<MyListings> createState() => _MyListingsState();
}

class _MyListingsState extends State<MyListings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'My Listings',
          style: TextStyle(color: lightGreen),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              color: lightGreen,
              size: 35,
            )),
      ),
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.only(left:18.0),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          shrinkWrap: true,
          children: [
            // listWidget('house1', '1500 Suffix Street', 'San Francisco, CA', true),
            // listWidget('house2', '1500 Suffix Street', 'San Francisco, CA', false),
            // listWidget('house3', '1500 Suffix Street', 'San Francisco, CA', false),
            // listWidget('condo1', '1500 Suffix Street', 'San Francisco, CA', true),
            // listWidget('condo2', '1500 Suffix Street', 'San Francisco, CA', true),
            // listWidget('apartment', '1500 Suffix Street', 'San Francisco, CA', true),
            // listWidget('land', '1500 Suffix Street', 'San Francisco, CA', false),
            // listWidget('townhouse', '1500 Suffix Street', 'San Francisco, CA', false),
            // listWidget('building', '1500 Suffix Street', 'San Francisco, CA', false),
            // listWidget('townhouse1', '1500 Suffix Street', 'San Francisco, CA', true),
            // listWidget('house1', '1500 Suffix Street', 'San Francisco, CA', false),
            // listWidget('land', '1500 Suffix Street', 'San Francisco, CA', false),
            // listWidget('townhouse1', '1500 Suffix Street', 'San Francisco, CA', true),
            // listWidget('land', '1500 Suffix Street', 'San Francisco, CA', false),
          ],
        ),
      ),
    );
  }
}
