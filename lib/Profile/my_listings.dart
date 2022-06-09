import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/listings_controller.dart';

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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          padding: const EdgeInsets.only(left:18.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: Get.find<ListingController>().allListings.value.data?.length,
          itemBuilder: (context,index){
            return listWidget(Get.find<ListingController>().myListings.value.data![index].images, Get.find<ListingController>().myListings.value.data![index].title.toString(),  Get.find<ListingController>().myListings.value.data![index].contact!.locations![0].name.toString(),Get.find<ListingController>().myListings.value.data![index].price.toString(),false,'',Get.find<ListingController>().myListings.value.data![index].listingId);
          },
        ),
      ),
    );
  }
}
