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
  Checkout? checkout;

  @override
  Widget build(BuildContext context) {
    var orderDetails = Get.find<MembershipController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Details',
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
              Row(
                children: [
                  paymentDetailsController.paymentDetail.value.id == null
                      ? Text(paymentDetailsController.paymentDetail.value.id)
                      : CircularProgressIndicator(),
                ],
              )
            ],
          )),
          Center(child: Text('Payment Result Screen')),
        ],
      ),
    );
  }
}
