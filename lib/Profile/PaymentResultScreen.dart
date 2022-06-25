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
          'Order Details',
          style: TextStyle(color: lightGreen),
        ),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => const Home());
          },
          child: const Icon(
            Icons.navigate_before,
            color: lightGreen,
            size: 35,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Card(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Order Date',
                            style: TextStyle(
                                color: lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          orderDetails.paymentDetail.value.createdDate != ""
                              ? Text(
                                  orderDetails.paymentDetail.value.createdDate
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                )
                              : const Text(
                                  'Pending',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Order Id',
                            style: TextStyle(
                                color: lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          orderDetails.paymentDetail.value.id != null
                              ? Text(
                                  orderDetails.paymentDetail.value.id
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              : const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Plan Bought',
                            style: TextStyle(
                                color: lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          orderDetails.paymentDetail.value.plan != null
                              ? Text(
                                  orderDetails.paymentDetail.value.plan.title,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                )
                              : const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Validity',
                            style: TextStyle(
                                color: lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          orderDetails.paymentDetail.value.plan != null
                              ? Text(
                                  "${orderDetails.paymentDetail.value.plan.visible.toString()} Days",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                )
                              : const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                                color: lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          orderDetails.paymentDetail.value.price != null
                              ? Text(
                                  "\$${orderDetails.paymentDetail.value.price.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                )
                              : const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Status',
                            style: TextStyle(
                                color: lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          orderDetails.paymentDetail.value.status != null
                              ? Text(
                                  "${orderDetails.paymentDetail.value.status}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                )
                              : const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Payment Method',
                            style: TextStyle(
                                color: lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          orderDetails.paymentDetail.value.gateway != null
                              ? Text(
                                  orderDetails
                                      .paymentDetail.value.gateway.title,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14),
                                )
                              : const CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Paid Date',
                            style: TextStyle(
                                color: lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          orderDetails.paymentDetail.value.paidDate != ""
                              ? Text(
                                  orderDetails.paymentDetail.value.paidDate,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                )
                              : const Text(
                                  'Pending',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Payment Instructions",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Divider(
                color: Colors.greenAccent,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  orderDetails.paymentDetail.value.gateway.instructions,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const Divider(
                color: Colors.greenAccent,
                thickness: 2,
              ),
              // const Center(child: Text('Payment Result Screen')),
            ],
          ),
        ),
      ),
    );
  }
}
