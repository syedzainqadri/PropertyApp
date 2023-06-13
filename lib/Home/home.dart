import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lagosabuja/Controllers/configControllers/config_controller.dart';
import 'package:lagosabuja/Controllers/user_controller.dart';
import 'package:lagosabuja/main.dart';
import '../AddListings/add_listings.dart';
import '../Categories/categories_page.dart';
import '../Chat/conversation_page.dart';
import '../Controllers/membership_controller.dart';
import '../Profile/account_subscriptions.dart';
import '../Profile/profile.dart';
import '../Search/search_page.dart';
import '../Utils/const.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool hasAction = true;
  String title = 'LagusAbuja';
  late PageController _pageController;
  bool notIntialized = true;
  final MembershipController membershipController =
      Get.put(MembershipController());
  final ConfigController configController = Get.put(ConfigController());
  final userController = Get.find<UserController>();

  var userLoggedIn = false.obs;
  @override
  void initState() {
    setState(() {
      notIntialized = false;
    });
    _pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return notIntialized
        ? const Center(
            child: CircularProgressIndicator(
              color: kGreen,
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: transparent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                title,
                style: const TextStyle(
                    color: kGreen, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                child:
                    Obx(() => userController.userModel.value.ppThumbUrl != null
                        ? GestureDetector(
                            onTap: () async {
                              userLoggedIn.value =
                                  GetStorage().read('isLoggedIn');
                              print(userLoggedIn);
                              if (userLoggedIn.value == true) {
                                await membershipController.getMembershipPlans();
                                Get.to(const Profile());
                              } else {
                                Get.to(const MyHomePage());
                              }
                            },
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: mediumGrey,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(userController
                                        .userModel.value.ppThumbUrl
                                        .toString()),
                                  ),
                                )),
                          )
                        : GestureDetector(
                            onTap: () async {
                              userLoggedIn.value =
                                  GetStorage().read('isLoggedIn');
                              print(userLoggedIn);
                              if (userLoggedIn.value == true) {
                                await membershipController.getMembershipPlans();
                                Get.to(const Profile());
                              } else {
                                Get.to(const MyHomePage());
                              }
                            },
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: mediumGrey,
                                  ),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(profiePicute),
                                  ),
                                )),
                          )),
              ),
              actions: hasAction
                  ? [
                      GestureDetector(
                        onTap: () {
                          userLoggedIn.value = GetStorage().read('isLoggedIn');
                          if (userLoggedIn.value == true) {
                            if (configController
                                        .config.value.membershipEnabled ==
                                    true &&
                                configController
                                        .newListingConfig.value.eligible ==
                                    true) {
                              Get.to(AddListing());
                            } else if (configController
                                    .config.value.membershipEnabled !=
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
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: kGreen,
                            radius: 30,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : [],
            ),
            body: SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                  index == 0
                      ? setState(() {
                          title = 'LagusAbuja';
                          hasAction = true;
                        })
                      : index == 1
                          ? setState(() {
                              title = 'Categories';
                              hasAction = false;
                            })
                          : index == 2
                              ? setState(() {
                                  title = 'Conversations';
                                  hasAction = false;
                                })
                              : setState(() {
                                  title = 'Search';
                                  hasAction = false;
                                });
                },
                children: <Widget>[
                  HomePage(),
                  const CategoriesPage(),
                  const ConversationPage(),
                  const SearchPage(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: _currentIndex,
              onItemSelected: (index) {
                setState(() => _currentIndex = index);
                _pageController.jumpToPage(index);
              },
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  title: const Text('Home'),
                  icon: const Icon(Icons.home),
                  activeColor: kGreen,
                  inactiveColor: mediumGrey,
                ),
                BottomNavyBarItem(
                  title: const Text('Categories'),
                  icon: const Icon(Icons.category),
                  activeColor: kGreen,
                  inactiveColor: mediumGrey,
                ),
                BottomNavyBarItem(
                  title: const Text('Conversation'),
                  icon: const Icon(Icons.chat),
                  activeColor: kGreen,
                  inactiveColor: mediumGrey,
                ),
                BottomNavyBarItem(
                  title: const Text('Search'),
                  icon: const Icon(Icons.search),
                  activeColor: kGreen,
                  inactiveColor: mediumGrey,
                ),
              ],
            ),
          );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  itemWidget(image, street, date, location, price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/$image.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        street,
                        style: const TextStyle(
                          color: darkGrey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Added on $date',
                        style: const TextStyle(
                          color: mediumGrey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      color: darkGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      color: darkGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
