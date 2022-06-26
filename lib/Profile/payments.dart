import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/my_payment_controller.dart';
import 'package:realestapp/Profile/Widgets/order_widget.dart';

import '../Utils/color_scheme.dart';

class MyPayments extends StatelessWidget {
  final myPaymentsController = Get.put(MyPaymentsController());
  MyPayments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Payments History',
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
      body: ListView.builder(
          itemCount: myPaymentsController.myPayments.value.data.length,
          itemBuilder: (context, index) {
            return OrderWidget(
              orderId: myPaymentsController.myPayments.value.data[index].id,
              title: myPaymentsController
                  .myPayments.value.data[index].gateway.title,
              price: myPaymentsController.myPayments.value.data[index].price,
              status: myPaymentsController.myPayments.value.data[index].status,
              method: myPaymentsController.myPayments.value.data[index].method,
              createdDate:
                  myPaymentsController.myPayments.value.data[index].createdDate,
            );
          }),
    );
  }
}
