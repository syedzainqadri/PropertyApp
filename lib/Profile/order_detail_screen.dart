import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Controllers/PaymentByIdcontroller.dart';
import 'package:lagosabuja/Home/home.dart';
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
          style: TextStyle(color: lightGreen),
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
                      id != null
                          ? Text(
                              id.toString(),
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
                        style: TextStyle(color: lightGreen, fontSize: 14),
                      ),
                      ammount != null
                          ? Text("N ${ammount.toString()}")
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
                      status != null
                          ? Text(status.toString())
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
                        style: TextStyle(color: lightGreen, fontSize: 14),
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
            Divider(
              color: lightGreen,
              thickness: 2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: Center(
                  child: Text(
                instructions,
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
