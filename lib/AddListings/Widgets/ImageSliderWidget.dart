import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Categories/categories.dart';

class ImageSliderWidget extends StatelessWidget {
  var image;
  var width;
  var height;

  ImageSliderWidget({@required this.image, this.width, this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
      ],
    );
  }
}
