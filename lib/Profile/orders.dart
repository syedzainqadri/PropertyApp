import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Controllers/orders_controller.dart';
import 'package:lagosabuja/Profile/Widgets/order_widget.dart';

import '../Utils/const.dart';

class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);

  final orderController = Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Order History',
          style: TextStyle(color: kGreen),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              size: 35,
              color: kGreen,
            )),
      ),
      body: ListView.builder(
          itemCount: orderController.orders.value.data.length,
          itemBuilder: (context, index) {
            return OrderWidget(
              orderId: orderController.orders.value.data[index].id,
              title: orderController.orders.value.data[index].gateway.title,
              price: orderController.orders.value.data[index].price,
              status: orderController.orders.value.data[index].status,
              method: orderController.orders.value.data[index].method,
              createdDate: orderController.orders.value.data[index].createdDate,
            );
          }),
    );
  }
}
