
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/store_controller.dart';

import '../Utils/color_scheme.dart';

class MyStoreScreen extends StatelessWidget {
  final storeController = Get.put(StoreController());
  MyStoreScreen({Key? key}) : super(key: key);

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
          Text(storeController.myStore.value.id.toString()),
          Text(storeController.myStore.value.email.toString()),
          Text(storeController.myStore.value.address.toString()),
          Text(storeController.myStore.value.description.toString()),
          Text(storeController.myStore.value.email.toString()),
          Text(storeController.myStore.value.phone.toString()),
          Text(storeController.myStore.value.website.toString()),
        ],
      ),
    );
  }
}
