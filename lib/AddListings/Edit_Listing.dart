// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lagosabuja/AddListings/Widgets/TextAreaForForm.dart';
import 'package:lagosabuja/AddListings/Widgets/TextFieldForForm.dart';
import 'package:lagosabuja/AddListings/add_listings.dart';
import 'package:lagosabuja/Controllers/editlisting_controller.dart';
import 'package:lagosabuja/Controllers/my_listings_controller.dart';
import 'package:lagosabuja/Profile/my_listings.dart';
import 'package:lagosabuja/Utils/const.dart';

class EditListingScreen extends StatefulWidget {
  var listingId;
  EditListingScreen({this.listingId, Key? key}) : super(key: key);

  @override
  State<EditListingScreen> createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {
  final EditListingController editListingController = EditListingController();
  final MyListingController myListingController = MyListingController();
  final priceController = TextEditingController();
  final priceStartController = TextEditingController();
  final priceEndController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final websiteController = TextEditingController();
  final videoController = TextEditingController();
  final whatsAppController = TextEditingController();
  var imagesList = [].obs;
  List<XFile>? images = [];
  String? categoryId;

  @override
  void initState() {
    super.initState();
    getListingbyId();
  }

  getListingbyId() async {
    await editListingController.getListing(widget.listingId);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
    await setCategoryId();
    setInitialValues();
  }

  setInitialValues() {
    imagesList.value = editListingController.editListing.value.listing!.images!;
    priceController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.price!);
    priceStartController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.price!);

    priceEndController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.maxPrice!);
    descriptionController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.description!);
    titleController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.title!);
    addressController.value = TextEditingValue(
        text:
            editListingController.editListing.value.listing!.contact!.address!);
    phoneNumberController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.author!.phone!);
    emailController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.author!.email!);
    websiteController.value = TextEditingValue(
        text:
            editListingController.editListing.value.listing!.contact!.website!);
    videoController.value = TextEditingValue(
        text:
            editListingController.editListing.value.listing!.videoUrls!.first!);
    whatsAppController.value = TextEditingValue(
        text: editListingController
            .editListing.value.listing!.contact!.whatsappNumber!);
  }

  setCategoryId() {
    for (int i = 0;
        i < editListingController.editListing.value.listing!.categories!.length;
        i++) {
      categoryId = editListingController
          .editListing.value.listing!.categories![i].termId
          .toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return editListingController.isLoading.value == true
        ? const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              color: kGreen,
            )),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.navigate_before,
                  color: kGreen,
                  size: 34,
                ),
              ),
              centerTitle: true,
              title: Text(
                editListingController.editListing.value.listing!.title!,
                style: const TextStyle(
                  color: kGreen,
                ),
              ),
            ),
            body: Center(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imagesList.length,
                      itemBuilder: (context, index) {
                        var items = imagesList;
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 10),
                          child: Stack(
                            key: Key(UniqueKey().toString()),
                            children: [
                              ClipRRect(
                                child: SizedBox(
                                  height: 100,
                                  child: Image.network(
                                    imagesList[index].url,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -14,
                                right: -14,
                                child: IconButton(
                                    onPressed: () async {
                                      var priceWithSymbols =
                                          priceController.text;
                                      var price = priceWithSymbols.replaceAll(
                                          RegExp('[^A-Za-z0-9]'), '');
                                      await editListingController.deleteImage(
                                        widget.listingId,
                                        imagesList[index].id,
                                        categoryId,
                                        addressController.text,
                                        phoneNumberController.text,
                                        whatsAppController.text,
                                        emailController.text,
                                        websiteController.text,
                                        titleController.text,
                                        price,
                                        descriptionController.text,
                                        images,
                                        videoController.text,
                                      );
                                      setState(() {
                                        items.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  images != null
                      ? SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images!.length,
                            itemBuilder: (context, index) {
                              var items = images;
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 20.0, right: 10),
                                child: Stack(
                                  key: Key(UniqueKey().toString()),
                                  children: [
                                    ClipRRect(
                                      child: SizedBox(
                                          height: 100,
                                          child: imageContainer(
                                              File(images![index].path))),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: -14,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              items!.removeAt(index);
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : const SizedBox(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _getFromGallery();
                      },
                      child: const Text('Add Images'),
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(kGreen),
                          overlayColor: MaterialStateProperty.all(white)),
                    ),
                  ),
                  TitleWidget(
                    text: 'Price',
                    padding: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextFieldWidgetForForm(
                      controller: priceController,
                      leadingIcon: Icons.title,
                      lable: 'Price',
                      obsecure: false,
                    ),
                  ),
                  TitleWidget(
                    text: 'Title',
                    padding: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextFieldWidgetForForm(
                      controller: titleController,
                      leadingIcon: Icons.title,
                      lable: 'Title',
                      obsecure: false,
                    ),
                  ),
                  TitleWidget(
                    padding: 5.0,
                    text: 'Description',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextAreaWidgetForForm(
                      controller: descriptionController,
                      leadingIcon: Icons.description,
                      lable: 'Description',
                      obsecure: false,
                    ),
                  ),
                  TitleWidget(
                    padding: 5.0,
                    text: 'Contact Information',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextFieldWidgetForForm(
                      controller: phoneNumberController,
                      leadingIcon: Icons.phone,
                      lable: 'Phone',
                      obsecure: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextFieldWidgetForForm(
                      controller: addressController,
                      leadingIcon: Icons.house,
                      lable: 'Address',
                      obsecure: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextFieldWidgetForForm(
                      controller: emailController,
                      leadingIcon: Icons.email,
                      lable: 'Email',
                      obsecure: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextFieldWidgetForForm(
                      controller: whatsAppController,
                      leadingIcon: Icons.chat,
                      lable: 'WhatsApp Number',
                      obsecure: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextFieldWidgetForForm(
                      controller: websiteController,
                      leadingIcon: Icons.web_sharp,
                      lable: 'WebSite',
                      obsecure: false,
                    ),
                  ),
                  TitleWidget(
                    text: 'Video Url',
                    padding: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: TextFieldWidgetForForm(
                      controller: videoController,
                      leadingIcon: Icons.play_arrow,
                      lable: 'Video Url',
                      obsecure: false,
                    ),
                  ),
                ],
              ),
            )),
            bottomNavigationBar: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        var priceWithSymbols = priceController.text;
                        var price = priceWithSymbols.replaceAll(
                            RegExp('[^A-Za-z0-9]'), '');
                        await editListingController.updateListing(
                          widget.listingId,
                          addressController.text,
                          phoneNumberController.text,
                          whatsAppController.text,
                          emailController.text,
                          websiteController.text,
                          titleController.text,
                          price,
                          descriptionController.text,
                          images,
                          videoController.text,
                          categoryId,
                        );
                        await myListingController.getMyListing();
                        Get.to(() => MyListings());
                        Get.snackbar('Listing Posted',
                            'Your listing is pending for Approval from Admin',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: kGreen,
                            colorText: white);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kGreen,
                        disabledForegroundColor: white.withOpacity(0.38),
                        disabledBackgroundColor: white.withOpacity(0.12),
                      ),
                      child: const Text(
                        'Update Listing',
                        style: TextStyle(fontSize: 18),
                      ))),
            ),
          );
  }

  _getFromGallery() async {
    List<XFile>? _images = await ImagePicker().pickMultiImage();
    for (int i = 0; i < _images.length; i++) {
      setState(() {
        images!.addAll(_images);
      });
    }
  }

  imageContainer(file) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(
                file,
              ),
              fit: BoxFit.cover),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
