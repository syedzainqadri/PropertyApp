import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharounda/Categories/Widgets/CategoryListingCard.dart';
import 'package:gharounda/Controllers/listings_controller.dart';
import '../AddListings/add_listings.dart';
import '../Utils/const.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  final int id;
  const CategoryPage({Key? key, required this.title, required this.id})
      : super(key: key);

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
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(const AddListing());
            },
            child: const Icon(Icons.add),
            foregroundColor: kWhite,
            backgroundColor: kGreen,
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              widget.title,
              style: const TextStyle(
                color: kGreen,
              ),
            ),
            elevation: 0.0,
            backgroundColor: kTransparent,
            leading: IconButton(
              icon: const Icon(
                Icons.navigate_before,
                color: kGreen,
                size: 34,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Column(
            children: [
              const Divider(
                color: kMediumGrey,
                thickness: 0.5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                    itemCount: listingController.allListings.value.data!.length,
                    itemBuilder: (context, position) {
                      if (listingController.allListings.value.data![position]
                                  .categories![0].parent ==
                              widget.id ||
                          listingController.allListings.value.data![position]
                                  .categories![0].termId ==
                              widget.id) {
                        return CategoryListingCard(
                          image: listingController
                              .allListings.value.data![position].images,
                          title: listingController
                              .allListings.value.data![position].title,
                          city:
                              '${listingController.allListings.value.data![position].contact!.locations![1].name}, ${listingController.allListings.value.data![position].contact!.locations![0].name}',
                          price: listingController
                              .allListings.value.data![position].price,
                          isFovorite: false,
                          description: '',
                          listingId: listingController
                              .allListings.value.data![position].listingId,
                        );
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
                backgroundColor: kBlackColor,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height / 1.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: kWhite,
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
                                    color: kMediumGrey,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Sort By',
                                    style: TextStyle(
                                      color: kDarkGrey,
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
                                  color: kMediumGrey,
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
                          color: kMediumGrey,
                          thickness: 0.2,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 28.0, right: 28.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                    activeColor: kGreen,
                                    value: 0,
                                    groupValue: _radioValue,
                                    onChanged: (value) {
                                      _handleRadioValueChange(value as int);
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                    activeColor: kGreen,
                                    groupValue: _radioValue,
                                    onChanged: (value) {
                                      _handleRadioValueChange(value as int);
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                    activeColor: kGreen,
                                    groupValue: _radioValue,
                                    onChanged: (value) {
                                      _handleRadioValueChange(value as int);
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                    activeColor: kGreen,
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
    );
  }
}
