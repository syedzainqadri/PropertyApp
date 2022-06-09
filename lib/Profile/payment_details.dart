import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/membership_controller.dart';
import 'package:realestapp/Controllers/payment_controller.dart';
import 'package:realestapp/Models/payment_model.dart';

import '../Utils/color_scheme.dart';

class PaymentDetails extends StatefulWidget {
  final String title, price, type;
  final int id;
  const PaymentDetails(
      {Key? key,
      required this.title,
      required this.price,
      required this.type,
      required this.id})
      : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  MembershipController membershipController = Get.put(MembershipController());
  PaymentController paymentController = Get.put(PaymentController());
  var _radioValue = 0;
  String gatewayId = '';
  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
            Get.back();
          },
          child: const Icon(
            Icons.navigate_before,
            color: lightGreen,
            size: 35,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          membershipCard(widget.title, widget.price),
          const SizedBox(
            height: 25,),
          Row(
            children:const [
               SizedBox(
            width: 28,),
           Text('Select Payment Method',
          style: TextStyle(color: lightGreen,fontSize: 22),
          ),
            ],
          ),
          const SizedBox(
            height: 10,),
                    SizedBox(
            height: 250,
            child: ListView.builder(
                itemCount: paymentController.paymentGateways.length,
                itemBuilder: (context, index) {
                  return paymentTypes(
                      paymentController.paymentGateways.value[index]);
                }),
          ),
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                membershipController.membershipCheckout(
                    widget.type, widget.type, gatewayId, widget.id);
              },
              child: const Text(
                'Checkout',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: lightGreen,
                onSurface: white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  membershipCard(title, price) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Center(
                    child: Text(
                  'Payment Detail',
                  style: TextStyle(color: white, fontSize: 18),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Selected Package',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 65, 65),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 32, 32, 32),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 0.4,
                color: Color.fromARGB(255, 88, 101, 107),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Package Price',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 65, 65),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      price,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 32, 32, 32),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 0.4,
                color: Color.fromARGB(255, 88, 101, 107),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sub Total',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 65, 65),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      price,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: lightGreen,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  paymentTypes(Payment payment) {
    return GestureDetector(
      onTap: () {
        setState(() {
          gatewayId = payment.id;
        });
      },
      child: Row(
        children: [
          const SizedBox(
            width: 25,),
          Radio(
            value: 1,
            activeColor: lightGreen,
            groupValue: _radioValue,
            onChanged: (value) {
              _handleRadioValueChange(value);
            },
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            payment.title,
            style: const TextStyle(
                color: Color.fromARGB(255, 40, 40, 40), fontSize: 19),
          ),
        ],
      ),
    );
  }

  // paymentsCard(title, price) {
  //   return Padding(
  //     padding: const EdgeInsets.all(18.0),
  //     child: SizedBox(
  //       width: double.infinity,
  //       height: 200,
  //       child: Card(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Container(
  //               height: 40,
  //               width: double.infinity,
  //               decoration: const BoxDecoration(
  //                 color: lightGreen,
  //                 borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(20),
  //                   topRight: Radius.circular(20),
  //                 ),
  //               ),
  //               child: const Center(
  //                   child: Text(
  //                 'Payment Detail',
  //                 style: TextStyle(color: white, fontSize: 18),
  //               )),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child:
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}