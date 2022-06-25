import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/OrderDetailsController.dart';
import 'package:realestapp/Home/home.dart';
import 'package:realestapp/Utils/color_scheme.dart';

class OrderDetailScreen extends StatelessWidget {
  OrderDetailScreen({Key? key}) : super(key: key);
  final OrderDetailsController orderDetailsController =
      Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
    var orderDetails = Get.find<OrderDetailsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(color: lightGreen),
        ),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => Home());
          },
          child: const Icon(
            Icons.navigate_before,
            color: lightGreen,
            size: 35,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
              child: Column(
            children: [
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order Id',
                      style: TextStyle(color: lightGreen, fontSize: 14),
                    ),
                    orderDetails.orderDetail.value != null
                        ? Text(orderDetails.orderDetail.value.id.toString())
                        : const CircularProgressIndicator(),
                  ],
                ),
              )
            ],
          )),
          Center(child: Text('Payment Result Screen')),
        ],
      ),
    );
  }
}
