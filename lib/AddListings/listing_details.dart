// ignore_for_file: unused_import, must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lagosabuja/Chat/chat_ui.dart';
import 'package:lagosabuja/Controllers/EmailController.dart';
import 'package:lagosabuja/Controllers/favorite_listing_controller.dart';
import 'package:lagosabuja/Controllers/listing_detail_controller.dart';
import 'package:lagosabuja/Utils/constants.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:share_plus/share_plus.dart';
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
  ListingDetails({
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
  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    checkWishlist();
    super.initState();
  }

  int _current = 0;
  final CarouselController sliderController = CarouselController();
  final listingDetailsController = Get.put(ListingDetailsController());
  final sendemailController = Get.put(EmailController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final favListingController = Get.put(FavoriteListingController());
  var isFavorited = false.obs;
  var isLoading = false.obs;
  var formKey = GlobalKey<FormState>();

  checkWishlist() async {
    isLoading.value = true;
    for (int i = 0;
        i < favListingController.favoriteListings.value.data.length;
        i++) {
      print(favListingController.favoriteListings.value.data[i].listingId);
      print(widget.id);
      if (widget.id ==
          favListingController.favoriteListings.value.data[i].listingId) {
        isFavorited.value = true;
      } else if (isFavorited.value == true) {
        break;
      } else {
        isFavorited.value = false;
      }
    }
    print(isFavorited.value);
    Future.delayed(const Duration(seconds: 3))
        .then(((value) => setState(() {})));
    isLoading.value = false;
  }

  double height = Get.height;
  double width = Get.width;

  @override
  Widget build(BuildContext context) {
    var listing = Get.find<ListingDetailsController>().listingDetail.value;
    return Obx(() => isLoading.value == true
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: lightGreen,
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: transparent,
              elevation: 0.0,
              centerTitle: false,
              title: Text(
                widget.title,
                style: const TextStyle(color: lightGreen),
              ),
              leadingWidth: 35,
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.navigate_before,
                    size: 30,
                    color: lightGreen,
                  )),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() =>
                          ChatUi(listingId: widget.id, title: widget.title));
                    },
                    icon: const Icon(
                      Icons.chat_sharp,
                      color: lightGreen,
                    ),
                  ),
                ),
                Obx(
                  () => isFavorited.value == false
                      ? IconButton(
                          onPressed: () async {
                            await favListingController
                                .addToFavorites(widget.id);
                            isFavorited.value = true;
                          },
                          icon: const Icon(Icons.favorite_border_rounded),
                          color: lightGreen,
                        )
                      : IconButton(
                          onPressed: () async {
                            await favListingController
                                .addToFavorites(widget.id);
                            isFavorited.value = false;
                          },
                          icon: const Icon(Icons.favorite_rounded),
                          color: lightGreen,
                        ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                    Share.share(
                        '${widget.title} \n ${widget.price} \n ${widget.images[0]}');
                  },
                  icon: const Icon(Icons.share),
                  color: lightGreen,
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //TODO: show indicator on slider
                  CarouselSlider.builder(
                      itemCount: listingDetailsController
                          .listingDetail.value.images.length,
                      itemBuilder: (context, index, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 3.0, left: 3.0),
                          child: InkWell(
                            onTap: () {
                              //TODO:just do it
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: SizedBox(
                                        height: height * 0.25,
                                        width: width,
                                        child: PinchZoomImage(
                                          image: Image.network(
                                              listingDetailsController
                                                  .listingDetail
                                                  .value
                                                  .images[index]
                                                  .url,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: ImageSliderWidget(
                              image: listingDetailsController
                                  .listingDetail.value.images[index].url,
                              width: width,
                              height: height * 0.26,
                            ),
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
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          })),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        listingDetailsController
                            .listingDetail.value.images.length,
                        (index) => GestureDetector(
                              onTap: () =>
                                  sliderController.animateToPage(_current),
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(
                                            _current == index ? 0.9 : 0.4)),
                              ),
                            )),
                  ),
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
                          "NGN ${listingDetailsController.listingDetail.value.price}",
                          style: const TextStyle(
                            color: lightGreen,
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
                            const Icon(Icons.pin_drop_outlined),
                            Text(
                              listingDetailsController
                                      .listingDetail.value.contact.address
                                      .toString()
                                      .isEmpty
                                  ? "N/A"
                                  : listingDetailsController
                                      .listingDetail.value.contact.address,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )),
                  ),

                  /// new design like zameen.com
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      const SizedBox(
                        //color: Colors.green,
                        width: double.infinity,
                        height: 260,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              //color: Colors.pink,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20),
                            child: SizedBox(
                              height: 200,
                              child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                  ),
                                  itemCount: listingDetailsController
                                          .listingDetail
                                          .value
                                          .customFields
                                          .length -
                                      1,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            listingDetailsController
                                                        .listingDetail
                                                        .value
                                                        .customFields[index]
                                                        .label ==
                                                    "Type"
                                                ? Icons.home_work_outlined
                                                : listingDetailsController
                                                            .listingDetail
                                                            .value
                                                            .customFields[index]
                                                            .label ==
                                                        "Parking"
                                                    ? Icons.car_rental
                                                    : listingDetailsController
                                                                .listingDetail
                                                                .value
                                                                .customFields[
                                                                    index]
                                                                .label ==
                                                            "Bedroom"
                                                        ? Icons.home_outlined
                                                        : listingDetailsController
                                                                    .listingDetail
                                                                    .value
                                                                    .customFields[
                                                                        index]
                                                                    .label ==
                                                                "Bath"
                                                            ? Icons
                                                                .bathtub_outlined
                                                            : listingDetailsController
                                                                        .listingDetail
                                                                        .value
                                                                        .customFields[
                                                                            index]
                                                                        .label ==
                                                                    "Sqft"
                                                                ? Icons
                                                                    .terrain_outlined
                                                                : listingDetailsController
                                                                            .listingDetail
                                                                            .value
                                                                            .customFields[
                                                                                index]
                                                                            .label ==
                                                                        "Purpose"
                                                                    ? Icons
                                                                        .admin_panel_settings_outlined
                                                                    : listingDetailsController.listingDetail.value.customFields[index].label ==
                                                                            "Location"
                                                                        ? Icons
                                                                            .pin_drop_outlined
                                                                        : listingDetailsController.listingDetail.value.customFields[index].label ==
                                                                                "Build Year"
                                                                            ? Icons.calendar_today_outlined
                                                                            : Icons.error_outline_sharp,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              listingDetailsController
                                                  .listingDetail
                                                  .value
                                                  .customFields[index]
                                                  .label,
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Text(
                                                  listingDetailsController
                                                      .listingDetail
                                                      .value
                                                      .customFields[index]
                                                      .value
                                                      .toString()
                                                      .toUpperCase(),
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontSize: 11),
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
                      ),
                      Positioned(
                        top: 7,
                        left: (width / 2) - 60,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                              'Main Features',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: DescriptionTextWidget(
                      text: listingDetailsController
                          .listingDetail.value.description,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 300,
                      //TODO: check zoom functions in google maps
                      child: GoogleMap(
                        zoomControlsEnabled: true,
                        mapToolbarEnabled: true,
                        mapType: MapType.normal,
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
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(
                            color: lightGreen,
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
                            color: lightGreen,
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
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0, top: 8.0),
                        child: SizedBox(
                          height: 200,
                          child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
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
                                        color: lightGreen,
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
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      listingDetailsController.listingDetail
                                          .value.amenities.value[index],
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
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
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0)), //this right here
                                  child: SizedBox(
                                    height: 400,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 10.0,
                                          left: 10.0),
                                      child: Form(
                                        key: formKey,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'Contact US',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 25,
                                                      // fontFamily: 'Noto Nastaliq Urdu',
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: textField('YourName',
                                                    false, nameController,
                                                    onValidate: (v) =>
                                                        v!.isEmpty
                                                            ? "Required"
                                                            : null),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: textField('Email', false,
                                                    emailController,
                                                    onValidate: (v) =>
                                                        v!.isEmpty
                                                            ? "Required"
                                                            : null),
                                              ),
                                              textField('Message', false,
                                                  messageController,
                                                  onValidate: (v) => v!.isEmpty
                                                      ? "Required"
                                                      : null,
                                                  maxLine: 4),
                                              SizedBox(
                                                height: height * 0.03,
                                              ),
                                              defaultButton(
                                                'Send',
                                                () async {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    sendemailController
                                                        .sendEmail(
                                                            widget.id,
                                                            messageController
                                                                .text,
                                                            nameController.text,
                                                            emailController
                                                                .text);
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    },
                    width: width * 0.25,
                    height: height * 0.06,
                    iconColor: lightGreen,
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
          ));
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
