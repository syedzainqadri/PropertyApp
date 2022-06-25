import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/OrderDetailsController.dart';
import 'package:realestapp/Controllers/PaymentByIdcontroller.dart';
import 'package:realestapp/Profile/PaymentResultScreen.dart';
import 'package:realestapp/Profile/order_detail_screen.dart';

class OrderWidget extends StatelessWidget {
  final orderId, title, price, status, method, createdDate;
  OrderWidget(
      {Key? key,
      required this.orderId,
      required this.title,
      required this.price,
      required this.status,
      required this.method,
      required this.createdDate})
      : super(key: key);
  final OrderDetailsController orderDetailsController =
      OrderDetailsController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 20,
        right: 20,
      ),
      child: InkWell(
        onTap: () async {
          await orderDetailsController.getOrderById(orderId.toString());
          Get.to(() => OrderDetailScreen());
        },
        child: Card(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order Number :',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(orderId.toString()),
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
                      'Payment Method :',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(title.toString()),
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
                      'Order Ammount :',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text("\$ ${price.toString()}"),
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
                      'Order Status :',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(status.toString()),
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
                      'Time Created :',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(createdDate.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
