import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/AddListings/Widgets/TextAreaForForm.dart';
import 'package:realestapp/AddListings/Widgets/TextFieldForForm.dart';
import 'package:realestapp/AddListings/add_listings.dart';
import 'package:realestapp/Controllers/editlisting_controller.dart';
import 'package:realestapp/Utils/color_scheme.dart';

class EditListingScreen extends StatefulWidget {
  var listingId;
  EditListingScreen({this.listingId, Key? key}) : super(key: key);

  @override
  State<EditListingScreen> createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {
  final EditListingController editListingController = EditListingController();
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

  @override
  void initState() {
    super.initState();
    getListingbyId();
    print(whatsAppController.text);
  }

  getListingbyId() async {
    await editListingController.getListing(widget.listingId);
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
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
            editListingController.editListing.value.listing!.author!.address!);
    phoneNumberController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.author!.phone!);
    emailController.value = TextEditingValue(
        text: editListingController.editListing.value.listing!.author!.email!);
    websiteController.value = TextEditingValue(
        text:
            editListingController.editListing.value.listing!.author!.website!);
    videoController.value = TextEditingValue(
        text:
            editListingController.editListing.value.listing!.videoUrls!.first!);
    whatsAppController.value = TextEditingValue(
        text: editListingController
            .editListing.value.listing!.author!.whatsappNumber!
            .toString());
  }

  @override
  Widget build(BuildContext context) {
    return editListingController.isLoading.value == true
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
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
                  color: lightGreen,
                  size: 34,
                ),
              ),
              centerTitle: true,
              title: Text(
                editListingController.editListing.value.listing!.title!,
                style: TextStyle(
                  color: lightGreen,
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
                                    onPressed: () {
                                      setState(() {
                                        items.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
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
                      leadingIcon: Icons.whatsapp,
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
          );
  }
}
