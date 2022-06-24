import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewFeatures extends StatelessWidget {
  var count;
  var title;
  var value;
  GridViewFeatures({this.count, this.title, this.value, Key? key})
      : super(key: key);
  double width = Get.width;
  double height = Get.height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20),
      child: SizedBox(
        height: 150,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5 / 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: count,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow//BoxShadow
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.home,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * .04,
                    ),
                    Column(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Expanded(
                          child: Text(
                            '$value'.toUpperCase(),
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
