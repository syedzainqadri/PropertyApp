import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/store_controller.dart';

import '../AddListings/Widgets/TextField.dart';
import '../Utils/color_scheme.dart';

class CreateStore extends StatelessWidget {
  final storeController = Get.put(StoreController());
  final titleController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final descriptionController = TextEditingController();
  CreateStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Order History',
          style: TextStyle(color: lightGreen),
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
      ),
      body: Column(
        children: [
          // title  email phone website address description
          TextFieldWidget(
            lable: 'Title',
            controller: titleController,
            leadingIcon: Icons.title,
            obsecure: false,
          ),
          TextFieldWidget(
            lable: 'Email',
            controller: emailController,
            leadingIcon: Icons.email,
            obsecure: false,
          ),
          TextFieldWidget(
            lable: 'Phone',
            controller: phoneController,
            leadingIcon: Icons.phone,
            obsecure: false,
          ),
          TextFieldWidget(
            lable: 'Website',
            controller: websiteController,
            leadingIcon: Icons.web,
            obsecure: false,
          ),
          TextFieldWidget(
            lable: 'Address',
            controller: addressController,
            leadingIcon: Icons.location_pin,
            obsecure: false,
          ),
          TextFieldWidget(
            lable: 'Description',
            controller: descriptionController,
            leadingIcon: Icons.description,
            obsecure: false,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  storeController.createStore(
                      titleController.text,
                      emailController.text,
                      phoneController.text,
                      websiteController.text,
                      addressController.text,
                      descriptionController.text);
                },
                style: ElevatedButton.styleFrom(
                  primary: lightGreen,
                  onSurface: white,
                ),
                child: const Text(
                  'Create Store',
                  style: TextStyle(fontSize: 18),
                ))),
      ),
    );
  }
}
