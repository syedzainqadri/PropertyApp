import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/PaymentByIdcontroller.dart';
import 'package:realestapp/Controllers/membership_controller.dart';
import 'package:realestapp/Home/home_page.dart';
import 'package:realestapp/Models/checkout_model.dart';
import 'package:realestapp/Profile/payment_details.dart';
import 'package:realestapp/Utils/color_scheme.dart';

class PaymentResultScreen extends StatelessWidget {
  PaymentResultScreen({Key? key}) : super(key: key);
  final PaymentDetailsController paymentDetailsController =
      Get.put(PaymentDetailsController());

  @override
  Widget build(BuildContext context) {
    var orderDetails = Get.find<PaymentDetailsController>();
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
            Get.to(() => HomePage());
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
                    orderDetails.paymentDetail.value.id != null
                        ? Text(orderDetails.paymentDetail.value.id.toString())
                        : const CircularProgressIndicator(),
                  ],
                ),
              )
            ],
          )),
          const Center(child: Text('Payment Result Screen')),
        ],
      ),
    );
  }
}
