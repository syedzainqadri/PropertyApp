import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/PaymentByIdcontroller.dart';
import 'package:realestapp/Home/home.dart';
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
          'Payment Details',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Card(
                child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Id',
                        style: TextStyle(color: lightGreen, fontSize: 14),
                      ),
                      orderDetails.paymentDetail.value.id != null
                          ? Text(
                              orderDetails.paymentDetail.value.id.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : const CircularProgressIndicator(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Date',
                        style: TextStyle(color: lightGreen, fontSize: 14),
                      ),
                      orderDetails.paymentDetail.value.createdDate != null
                          ? Text(orderDetails.paymentDetail.value.createdDate
                              .toString())
                          : const SizedBox(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Amount',
                        style: TextStyle(color: lightGreen, fontSize: 14),
                      ),
                      orderDetails.paymentDetail.value.price != null
                          ? Text(
                              "\$ ${orderDetails.paymentDetail.value.price.toString()}")
                          : const CircularProgressIndicator(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Status',
                        style: TextStyle(color: lightGreen, fontSize: 14),
                      ),
                      orderDetails.paymentDetail.value.status != null
                          ? Text(orderDetails.paymentDetail.value.status
                              .toString())
                          : const CircularProgressIndicator(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Payment Date',
                        style: TextStyle(color: lightGreen, fontSize: 14),
                      ),
                      orderDetails.paymentDetail.value.paidDate != ""
                          ? Text(orderDetails.paymentDetail.value.paidDate
                              .toString())
                          : const Text('Payment Pending'),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Payment Method',
                        style: TextStyle(color: lightGreen, fontSize: 14),
                      ),
                      orderDetails.paymentDetail.value.gateway != null
                          ? Text(orderDetails.paymentDetail.value.gateway.title
                              .toString())
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Center(
                  child: Text(
                'Payment Instruction',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )),
            ),
            Divider(
              color: lightGreen,
              thickness: 2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: Center(
                  child: Text(
                orderDetails.paymentDetail.value.gateway.instructions,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
              )),
            ),
            Divider(
              color: lightGreen,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
