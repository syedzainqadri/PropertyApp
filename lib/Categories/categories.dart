
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/listings_controller.dart';
import '../AddListings/add_listing.dart';
import '../Home/item_widget.dart';
import '../Models/all_listing_model.dart';
import '../Utils/color_scheme.dart';
import 'filters.dart';

class Category extends StatelessWidget {
  final String title;
  final int id;
  const Category({Key? key, required this.title, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryPage(
        title: title, id: id,
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  final String title;
  final int id;
  const CategoryPage({Key? key, required this.title, required this.id}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  
  final ListingController listingController = Get.put(ListingController());
  int _radioValue = 0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
      }
    });
  }

  bool showFilters = false;
  bool showSort = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
           Get.to(const AddListing());
              },
              child: const Icon(Icons.add),
              foregroundColor: white,
              backgroundColor: lightGreen,
            ),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                widget.title,
                style: const TextStyle(
                  color: lightGreen,
                ),
              ),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(
                  Icons.navigate_before,
                  color: lightGreen,
                  size: 34,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.map,
                    color: lightGreen,
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                const Divider(
                  color: mediumGrey,
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.filter_list,
                          color: lightGreen,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: lightGreen,
                              )),
                          shadowColor: transparent,
                        ),
                        onPressed: () {
                          Get.to(const MyFilters());
                        },
                        label: const Text(
                          'Filters',
                          style: TextStyle(color: lightGreen, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.sort,
                          color: lightGreen,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: lightGreen,
                              )),
                          shadowColor: transparent,
                        ),
                        onPressed: () {
                          setState(() {
                            showSort = true;
                          });
                        },
                        label: const Text(
                          'Sort',
                          style: TextStyle(color: lightGreen, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: mediumGrey,
                  thickness: 0.5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListView.builder(
                      itemCount: listingController.allListings.value.data!.length,
                      itemBuilder: (context, position) {
                        if(listingController.allListings.value.data![position].categories![0].termId==widget.id){
                          
                        return itemWidget(listingController.allListings.value.data![position]);
                        }
                        return const Offstage();
                      },

                    ),
                  ),
                ),
              ],
            ),
          ),
          showSort
              ? Scaffold(
                  backgroundColor: Colors.black54,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).size.height / 1.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 22, right: 22, top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.sort,
                                      color: mediumGrey,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Sort By',
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontSize: 20,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showSort = false;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: mediumGrey,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: mediumGrey,
                            thickness: 0.2,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 28.0, right: 28.0),
                            child: Column(
                              children: [
                                //Popular
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.star_border),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Popular',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    Radio(
                                      toggleable: true,
                                      activeColor: lightGreen,
                                      value: 0,
                                      groupValue: _radioValue,
                                      onChanged: (value) {
                                        _handleRadioValueChange(value as int);
                                      },
                                    ),
                                  ],
                                ),
//Newest
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.time_to_leave),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Newest',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    Radio(
                                      value: 1,
                                      activeColor: lightGreen,
                                      groupValue: _radioValue,
                                      onChanged: (value) {
                                        _handleRadioValueChange(value as int);
                                      },
                                    ),
                                  ],
                                ),

                                //Price (Low to High)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.price_change),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Price (Low to High)',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    Radio(
                                      value: 2,
                                      activeColor: lightGreen,
                                      groupValue: _radioValue,
                                      onChanged: (value) {
                                        _handleRadioValueChange(value as int);
                                      },
                                    ),
                                  ],
                                ),

                                //Price (High to Low)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.price_change_sharp),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Price (High to Low)',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    Radio(
                                      value: 3,
                                      activeColor: lightGreen,
                                      groupValue: _radioValue,
                                      onChanged: (value) {
                                        _handleRadioValueChange(value as int);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                )
              : const Offstage(),
        ],
      ),
    );
  }
}
