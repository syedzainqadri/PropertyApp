import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/PaymentByIdcontroller.dart';
import 'package:realestapp/Profile/PaymentResultScreen.dart';
import 'package:realestapp/Profile/order_detail_screen.dart';

class OrderWidget extends StatefulWidget {
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

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  final PaymentDetailsController orderDetailsController =
      PaymentDetailsController();

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
          await orderDetailsController
              .getPaymentById(widget.orderId.toString());
          Get.to(() => OrderDetailsScreen(
                id: orderDetailsController.paymentDetail.value.id,
                date: orderDetailsController.paymentDetail.value.createdDate,
                ammount: orderDetailsController.paymentDetail.value.price,
                status: orderDetailsController.paymentDetail.value.status,
                paymentDue: orderDetailsController.paymentDetail.value.paidDate,
                paymentMethod:
                    orderDetailsController.paymentDetail.value.gateway.title,
                instructions: orderDetailsController
                    .paymentDetail.value.gateway.instructions,
              ));
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
                    Text(widget.orderId.toString()),
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
                    Text(widget.title.toString()),
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
                    Text("\$ ${widget.price.toString()}"),
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
                    Text(widget.status.toString()),
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
                    Text(widget.createdDate.toString()),
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
