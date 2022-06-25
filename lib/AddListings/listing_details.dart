// ignore_for_file: unused_import, must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:realestapp/Chat/chat_ui.dart';
import 'package:realestapp/Controllers/EmailController.dart';
import 'package:realestapp/Controllers/listing_detail_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/review_model.dart';
import '../Utils/color_scheme.dart';
import 'Widgets/BottomSheetButton.dart';
import 'Widgets/DescriptionTextWidget.dart';
import 'Widgets/ImageSliderWidget.dart';
import 'Widgets/TextArea.dart';
import 'Widgets/TextField.dart';

class ListingDetails extends StatefulWidget {
  var title;
  var id;
  var price;
  var images;
  var description;
  ListingDetails({
    this.description,
    this.id,
    this.price,
    this.title,
    this.images,
    Key? key,
  }) : super(key: key);

  @override
  State<ListingDetails> createState() => _ListingDetailsState();
}

class _ListingDetailsState extends State<ListingDetails> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
  }

  final listingDetailsController = Get.put(ListingDetailsController());
  final sendemailController = Get.put(EmailController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  double height = Get.height;
  double width = Get.width;

  @override
  Widget build(BuildContext context) {
    var listing = Get.find<ListingDetailsController>().listingDetail.value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: lightGreen),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              size: 35,
              color: lightGreen,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(ChatUi(listingId: widget.id, title: widget.title));
              },
              icon: const Icon(
                Icons.chat_sharp,
                color: lightGreen,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount:
                    listingDetailsController.listingDetail.value.images.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 3.0, left: 3.0),
                    child: ImageSliderWidget(
                      image: listingDetailsController
                          .listingDetail.value.images[index].url,
                      width: width,
                      height: height * 0.26,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: height * 0.26,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInCirc,
                  pauseAutoPlayOnManualNavigate: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    listingDetailsController.listingDetail.value.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$\ ${listingDetailsController.listingDetail.value.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.pin_drop_outlined),
                      Text(
                        listingDetailsController
                            .listingDetail.value.contact.address,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.greenAccent,
                      thickness: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Text(
                      'Features'.toUpperCase(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.greenAccent,
                      thickness: 3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
              child: SizedBox(
                height: height * 0.3,
                child: Card(
                  elevation: 1,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: listingDetailsController
                              .listingDetail.value.customFields.length -
                          1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      offset: const Offset(
                                        3.0,
                                        3.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                    ), //BoxShadow//BoxShadow
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.garage,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  listingDetailsController.listingDetail.value
                                      .customFields[index].label,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      '${listingDetailsController.listingDetail.value.customFields[index].value.toString()}'
                                          .toUpperCase(),
                                      maxLines: 1,
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.clip,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: DescriptionTextWidget(
                text: listingDetailsController.listingDetail.value.description,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        double.parse(listingDetailsController
                            .listingDetail.value.contact.latitude
                            .toString()),
                        double.parse(listingDetailsController
                            .listingDetail.value.contact.longitude
                            .toString())),
                    zoom: 14.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.greenAccent,
                      thickness: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Text(
                      'Ameneties'.toUpperCase(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.greenAccent,
                      thickness: 3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 20),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
                  child: SizedBox(
                    height: 200,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2.5,
                          // crossAxisSpacing: 5,
                          // mainAxisSpacing: 5
                        ),
                        itemCount: listingDetailsController
                            .listingDetail.value.amenities.value.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      offset: const Offset(
                                        3.0,
                                        3.0,
                                      ),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.0,
                                    ), //BoxShadow//BoxShadow
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                listingDetailsController
                                    .listingDetail.value.amenities.value[index],
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.greenAccent,
                      thickness: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Text(
                      'Rating'.toUpperCase(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.greenAccent,
                      thickness: 3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 30),
              child: SizedBox(
                height: 100,
                child: RatingBarIndicator(
                  rating: double.parse(listingDetailsController
                      .listingDetail.value.review.rating.average),
                  direction: Axis.horizontal,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 50.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: height * 0.09,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomSheetButton(
              onTap: () {
                launch(
                    "tel://${listingDetailsController.listingDetail.value.contact.phone}");
              },
              width: width * 0.25,
              height: height * 0.06,
              iconColor: Colors.blue,
              buttonColor: Colors.blue[200],
              buttonText: 'Call',
              icon: Icons.phone,
            ),
            BottomSheetButton(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: SizedBox(
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: Text(
                                    'Contact US',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 25,
                                        // fontFamily: 'Noto Nastaliq Urdu',
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: TextFieldWidget(
                                      lable: 'YourName',
                                      controller: nameController,
                                      leadingIcon: Icons.person,
                                      obsecure: false),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: TextFieldWidget(
                                      lable: 'Email',
                                      controller: emailController,
                                      leadingIcon: Icons.email,
                                      obsecure: false),
                                ),
                                TextAreaWidget(
                                    lable: 'Message',
                                    controller: messageController,
                                    leadingIcon: Icons.message,
                                    obsecure: false),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Center(
                                  child: BottomSheetButton(
                                    onTap: () {
                                      sendemailController.sendEmail(
                                          widget.id,
                                          messageController.text,
                                          nameController.text,
                                          emailController.text);
                                    },
                                    width: width * 0.25,
                                    height: height * 0.06,
                                    iconColor: Colors.green,
                                    buttonColor: Colors.greenAccent,
                                    buttonText: 'Send',
                                    icon: Icons.email,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              width: width * 0.25,
              height: height * 0.06,
              iconColor: Colors.green,
              buttonColor: Colors.greenAccent,
              buttonText: 'Email',
              icon: Icons.email,
            ),
            BottomSheetButton(
              onTap: () {
                launch(
                    'https://wa.me/${listingDetailsController.listingDetail.value.contact.whatsappNumber}?text=Hello');
              },
              width: width * 0.25,
              height: height * 0.06,
              iconColor: Colors.pink,
              buttonColor: Colors.pink[200],
              buttonText: 'Chat',
              icon: Icons.whatsapp,
            ),
          ],
        ),
      ),
    );
  }
}

review(Data review) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 16.0),
    child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: mediumGrey),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        review.authorAvatarUrls.entries.first.value),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.authorName,
                    style: const TextStyle(fontSize: 16, color: darkGrey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    review.date.toString().substring(0, 10),
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 14,
                        color: mediumGrey,
                        overflow: TextOverflow.clip),
                  ),
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              RatingBar.builder(
                ignoreGestures: true,
                initialRating: review.rating.toDouble(),
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: lightGreen,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          Text(
            review.content.raw,
            style: const TextStyle(fontSize: 16, color: darkGrey),
          ),
        ],
      ),
    ),
  );
}
