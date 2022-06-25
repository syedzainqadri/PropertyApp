import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget{
  final orderId, title, price, status, method, createdDate;
  const OrderWidget({Key? key,required this.orderId,required this.title,required this.price,required this.status,required this.method,required this.createdDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(orderId.toString()),
        Text(title.toString()),
        Text(price.toString()),
        Text(status.toString()),
        Text(method.toString()),
        Text(createdDate.toString()),
    ],),
    );
  }

}