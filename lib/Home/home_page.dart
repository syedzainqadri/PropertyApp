import 'dart:convert';
import 'package:realestapp/Models/AllListings/all_listings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AddListings/list_widget.dart';
import '../Categories/categories.dart';
import '../Controllers/categories_controller.dart';
import '../Controllers/listings_controller.dart';
import '../Models/Categories/category_model.dart';
import '../Utils/color_scheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ListingController _listingController = ListingController();
  List<AllListings> listings = [];
  getListings() async {
    var response = await _listingController.getAllListing();
    setState(() {
      var data = jsonDecode(response);
      var allListing = data['data'] as List;
     listings = allListing
          .map((listingsJson) => AllListings.fromJson(listingsJson))
          .toList();
    });
  }

  CategoriesController _categoriesController = CategoriesController();
  List<CategoryModel> categories = [];
  getCategories() async {
    var response = await _categoriesController.getAllCategories();
    var data = jsonDecode(response);
    var categoryObjsJson = data as List;
    setState(() {
      categories = categoryObjsJson
          .map((categoryJson) => CategoryModel.fromJson((categoryJson)))
          .toList();
    });
  }

  @override
  void initState() {
    getListings();
    getCategories();
    super.initState();
  }

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
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, position) {
                      return categoryCard(
                          categories[position].icon.url,
                          categories[position].name,
                          categories[position].term_id);
                    }, //listings[position].images[0].urlString.substring(int startIndex, [ int endIndex ])
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Top Listings',
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
             SizedBox(
            height: 500,
            width: double.infinity,
            child: GridView.builder(
              padding: const EdgeInsets.only(left: 18.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listings.length,
              itemBuilder: (context, index) {
                return listWidget(
                    listings[index].images[0].url, listings[index].title, listings[index].contact.locations[0].name, true);
              },
            ),
          ),
        ],
      ),
    );
  }

  categoryCard(image, name, id) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Get.to(Category(
            title: name,
            id: id,
          ));
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
                    image: NetworkImage(image),
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
