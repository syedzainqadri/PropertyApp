import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/deleteListingController.dart';
import 'package:realestapp/Controllers/listings_controller.dart';
import 'package:realestapp/Controllers/my_listings_controller.dart';
import 'package:realestapp/Profile/Widgets/myLisitngCard.dart';
import '../Utils/color_scheme.dart';

class MyListings extends StatefulWidget {
  const MyListings({Key? key}) : super(key: key);

  @override
  State<MyListings> createState() => _MyListingsState();
}

class _MyListingsState extends State<MyListings> {
  final ListingController listingController = Get.put(ListingController());
  final DeleteListingController deleteListingController =
      Get.put(DeleteListingController());
  final MyListingController myListingController =
      Get.put(MyListingController());
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
      body: Obx(() {
        return myListingController.isLoading.value == true
            ? Center(child: const CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: myListingController.myListings.value.data?.length,
                itemBuilder: (context, index) {
                  var items = myListingController.myListings.value.data;
                  return Dismissible(
                    key: Key(myListingController
                        .myListings.value.data![index].listingId
                        .toString()),
                    onDismissed: (direction) {
                      myListingController.refresh();
                      deleteListingController
                          .deleteListing(items![index].listingId.toString());
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    background: Container(
                      color: Colors.red,
                    ),
                    child: MyListingCard(
                        image: myListingController
                            .myListings.value.data![index].images,
                        title: myListingController
                            .myListings.value.data![index].title
                            .toString(),
                        city: myListingController.myListings.value.data![index]
                            .contact!.locations![0].name
                            .toString(),
                        price: myListingController
                            .myListings.value.data![index].price
                            .toString(),
                        isFovorite: false,
                        description: '',
                        listingId: myListingController
                            .myListings.value.data![index].listingId),
                  );
                },
              );
      }),
    );
  }

  void doNothing(BuildContext context) {}
}
