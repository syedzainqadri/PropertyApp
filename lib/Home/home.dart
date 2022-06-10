import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:realestapp/Controllers/user_controller.dart';
import 'package:realestapp/Models/sign_in_model.dart';
import '../AddListings/add_listing.dart';
import '../Categories/categories_page.dart';
import '../Chat/conversation_page.dart';
import '../Controllers/membership_controller.dart';
import '../Profile/profile.dart';
import '../Search/search_page.dart';
import '../Utils/color_scheme.dart';
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
  String title = 'Home';
  late PageController _pageController;
  bool notIntialized = true;
  MembershipController membershipController = Get.put(MembershipController());
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
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: transparent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                title,
                style: const TextStyle(color: lightGreen),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    membershipController.getMembershipPlans();
                    Get.to(const Profile());
                  },
                  child: GetX<UserController>(
                    init: UserController(),
                    builder: (_) {
                      return Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: mediumGrey,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              _.user.value.ppThumbUrl.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              actions: hasAction
                  ? [
                      GestureDetector(
                        onTap: () {
                          Get.to(const AddListing());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            color: lightGreen,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.map,
                          color: lightGreen,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
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
                          title = 'Home';
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
                children: const <Widget>[
                  HomePage(),
                  // CategoriesPage(),
                  ConversationPage(),
                  SearchPage(),
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
                  activeColor: lightGreen,
                  inactiveColor: mediumGrey,
                ),
                BottomNavyBarItem(
                  title: const Text('Categories'),
                  icon: const Icon(Icons.category),
                  activeColor: lightGreen,
                  inactiveColor: mediumGrey,
                ),
                BottomNavyBarItem(
                  title: const Text('Conversation'),
                  icon: const Icon(Icons.chat),
                  activeColor: lightGreen,
                  inactiveColor: mediumGrey,
                ),
                BottomNavyBarItem(
                  title: const Text('Search'),
                  icon: const Icon(Icons.search),
                  activeColor: lightGreen,
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
