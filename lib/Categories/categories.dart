import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lagosabuja/Categories/Widgets/CategoryListingCard.dart';
import 'package:lagosabuja/Controllers/configControllers/config_controller.dart';
import 'package:lagosabuja/Controllers/listings_controller.dart';
import 'package:lagosabuja/main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../AddListings/add_listings.dart';
import '../Profile/account_subscriptions.dart';
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
  final ConfigController configController = Get.put(ConfigController());
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
  var userLoggedIn = false.obs;
  final RefreshController refreshController = RefreshController();

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
              userLoggedIn.value = GetStorage().read('isLoggedIn');
              if (userLoggedIn.value == true) {
                if (configController.config.value.membershipEnabled == true &&
                    configController.newListingConfig.value.eligible == true) {
                  Get.to(AddListing());
                } else if (configController.config.value.membershipEnabled !=
                    true) {
                  Get.snackbar(
                    'No Membership',
                    'You do not have a membership yet kindly select one',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: white,
                  );
                  //TODO: route the user to Membership
                  Get.to(const AccountSubscription());
                } else {
                  Get.snackbar(
                    'Not Eligible',
                    'You are not Eligible to post, Please buy a package',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: white,
                  );
                }
              } else {
                Get.to(const MyHomePage());
              }
              // if (configController.config.value.membershipEnabled == true &&
              //     configController.newListingConfig.value.eligible == true) {
              //   Get.to(AddListing());
              // } else if (configController.config.value.membershipEnabled !=
              //     true) {
              //   Get.snackbar(
              //     'No Membership',
              //     'You do not have a membership yet kindly select one',
              //     snackPosition: SnackPosition.BOTTOM,
              //     backgroundColor: Colors.red,
              //     colorText: white,
              //   );
              //   //TODO: route the user to Membership
              //   Get.to(const AccountSubscription());
              // } else {
              //   Get.snackbar(
              //     'Not Eligible',
              //     'You are not Eligible to post, Please buy a package',
              //     snackPosition: SnackPosition.BOTTOM,
              //     backgroundColor: Colors.red,
              //     colorText: white,
              //   );
              // }
            },
            child: const Icon(Icons.add),
            foregroundColor: white,
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
            backgroundColor: Colors.transparent,
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
                color: mediumGrey,
                thickness: 0.5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SmartRefresher(
                    controller: refreshController,
                    enablePullDown: true,
                    enablePullUp: true,
                    header: const WaterDropHeader(),
                    footer: CustomFooter(builder: ((context, mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = const Text("Pull Up to Load More");
                      } else if (mode == LoadStatus.failed) {
                        body = const Text("Failed to load more");
                      } else if (mode == LoadStatus.canLoading) {
                        body = const Text("Loading...");
                      } else {
                        body = const Text("No More Data");
                      }
                      return SizedBox(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    })),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView.builder(
                      itemCount:
                          listingController.allListings.value.data!.length,
                      itemBuilder: (context, position) {
                        // if (listingController.allListings.value.data![position]
                        //             .categories![0].parent ==
                        //         widget.id ||
                        //     listingController.allListings.value.data![position]
                        //             .categories![0].termId ==
                        //         widget.id) {
                        return CategoryListingCard(
                          image: listingController
                              .allListings.value.data![position].images,
                          title: listingController
                              .allListings.value.data![position].title,
                          city: listingController
                                      .allListings
                                      .value
                                      .data![position]
                                      .contact!
                                      .locations!
                                      .length !=
                                  2
                              ? 'Some Where in,${listingController.allListings.value.data![position].contact!.locations![0].name}'
                              : '${listingController.allListings.value.data![position].contact!.locations![1].name}, ${listingController.allListings.value.data![position].contact!.locations![0].name}',
                          price: listingController
                              .allListings.value.data![position].price,
                          isFovorite: false,
                          description: '',
                          listingId: listingController
                              .allListings.value.data![position].listingId,
                        );
                        // }
                        // return const Offstage();
                      },
                    ),
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

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    listingController.getAllListing(isRefreshed: true);
    refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    listingController.currentPage.value++;
    listingController.getAllListing(isRefreshed: false);
    refreshController.refreshCompleted();
  }
}
