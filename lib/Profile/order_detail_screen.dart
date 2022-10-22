// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Utils/color_scheme.dart';

class OrderDetailsScreen extends StatelessWidget {
  var id;
  var date;
  var ammount;
  var status;
  var paymentDue;
  var paymentMethod;
  var instructions;
  OrderDetailsScreen(
      {this.id,
      this.date,
      this.ammount,
      this.status,
      this.paymentDue,
      this.paymentMethod,
      this.instructions,
      Key? key})
      : super(key: key);
  // final PaymentDetailsController paymentDetailsController =
  //     Get.put(PaymentDetailsController());

  @override
  Widget build(BuildContext context) {
    // var orderDetails = Get.find<PaymentDetailsController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(color: kGreen),
        ),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.navigate_before,
            color: kGreen,
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
                        style: TextStyle(color: kGreen, fontSize: 14),
                      ),
                      id != null
                          ? Text(
                              id.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          : const CircularProgressIndicator(
                              color: kGreen,
                            ),
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
                        style: TextStyle(color: kGreen, fontSize: 14),
                      ),
                      date != null ? Text(date.toString()) : const SizedBox(),
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
                        style: TextStyle(color: kGreen, fontSize: 14),
                      ),
                      ammount != null
                          ? Text("N ${ammount.toString()}")
                          : const CircularProgressIndicator(
                              color: kGreen,
                            ),
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
                        style: TextStyle(color: kGreen, fontSize: 14),
                      ),
                      status != null
                          ? Text(status.toString())
                          : const CircularProgressIndicator(
                              color: kGreen,
                            ),
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
                        style: TextStyle(color: kGreen, fontSize: 14),
                      ),
                      paymentDue != ""
                          ? Text(paymentDue.toString())
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
                        style: TextStyle(color: kGreen, fontSize: 14),
                      ),
                      paymentMethod != null
                          ? Text(paymentMethod.toString())
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
            const Divider(
              color: kGreen,
              thickness: 2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: Center(
                  child: Text(
                instructions,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.w500),
              )),
            ),
            const Divider(
              color: kGreen,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
