import 'package:flutter/material.dart';
import 'package:realestapp/color_scheme.dart';

import 'item_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for Listings',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.close),
              suffixIconColor: lightGreen,
              prefixIconColor: lightGreen,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: darkGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: lightGreen,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
           Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, position) {
                      return itemWidget('house1', '1500 SX Street',
                          "10/03/2022", "San Fransico, CA", "12,434,55");
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
