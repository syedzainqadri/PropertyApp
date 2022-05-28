import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AddListings/list_widget.dart';
import '../Categories/categories.dart';
import '../Utils/color_scheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
        padding: const EdgeInsets.all(12.0),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text(
              'Categories',
              style: TextStyle(
                color: darkGrey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoryCard('house2', 'Houses',1),
                  categoryCard('condo2', 'Condos',2),
                  categoryCard('apartment', 'Apartments',3),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Houses',
              style: TextStyle(
                color: darkGrey,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
        ],
      ),
          ),
          Center(
                child: GridView.count(
                  padding: const EdgeInsets.only(left: 18.0),
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  shrinkWrap: true,
                  children: [
                    listWidget('house1', '1500 Suffix Street', 'San Francisco, CA', true),
                    listWidget('house2', '1500 Suffix Street', 'San Francisco, CA', false),
                    listWidget('condo1', '1500 Suffix Street', 'San Francisco, CA', false),
                    listWidget('house3', '1500 Suffix Street', 'San Francisco, CA', true),
                  ],
                ),
              ),
        ],
      ),
    );
  }

  categoryCard(image, name,id) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Get.to(Category(title: name,id: id,));
        },
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Card(
            elevation: 1.0,
            child: Column(children: [
              Container(
                width: 120,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$image.png'),
                  ),
                ),
              ),
              Center(child: Text(name)),
            ]),
          ),
        ),
      ),
    );
  }
}
