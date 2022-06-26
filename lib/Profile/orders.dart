<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/order_controller.dart';
import 'package:realestapp/Profile/Widgets/order_widget.dart';

import '../Utils/color_scheme.dart';

class Orders extends StatefulWidget{
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Orders',
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
        itemCount: orderController.orders.value.data.length,
        itemBuilder: (context,index){
          return OrderWidget(orderId: orderController.orders.value.data[index].id, title: orderController.orders.value.data[index].gateway.title, price: orderController.orders.value.data[index].price, status: orderController.orders.value.data[index].status, method: orderController.orders.value.data[index].method,createdDate: orderController.orders.value.data[index].createdDate,);
      }),
    );
  }
}
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/orders_controller.dart';
import 'package:realestapp/Profile/Widgets/order_widget.dart';

import '../Utils/color_scheme.dart';

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
>>>>>>> a190e60bb1ac09e6945e17c6002b2ce5f1d44423
