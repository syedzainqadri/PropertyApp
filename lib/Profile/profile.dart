import 'dart:io';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gharounda/Controllers/profile_controller.dart';
import 'package:gharounda/Controllers/sign_in_controller.dart';
import 'package:gharounda/Profile/orders.dart';
import 'package:gharounda/Profile/payments.dart';
import '../Auth/sign_in.dart';
import '../Controllers/user_controller.dart';
import 'account_details.dart';
import '../Utils/const.dart';
import 'my_favorites.dart';
import 'my_listings.dart';
import 'account_subscriptions.dart';
import 'settings.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileController _profileController = Get.put(ProfileController());

  UserController userController = Get.put(UserController());
  SignInController signInController = Get.put(SignInController());
  bool isLoading = false;
  final signOut = GetStorage();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: kGreen),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.navigate_before,
              size: 35,
              color: kGreen,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  isLoading
                      ? Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kMediumGrey),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: kGreen,
                            ),
                          ),
                        )
                      : Badge(
                          badgeColor: kGreen,
                          badgeContent: const Icon(
                            Icons.camera_alt,
                            color: kWhite,
                          ),
                          position: const BadgePosition(bottom: 1, end: 1),
                          child: GestureDetector(
                            onTap: () async {
                              await uploadPicutre();
                            },
                            child: Obx(() {
                              return Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kMediumGrey),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(userController
                                        .userModel.value.ppThumbUrl
                                        .toString()),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => Text(
                      "${userController.userModel.value.firstName} ${userController.userModel.value.lastName}",
                      style: const TextStyle(
                        color: kDarkGrey,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                profileParameters(
                    "My Listings", Icons.list, kGreen, const MyListings()),
                profileParameters("My Favorites", Icons.favorite, kBrightRed,
                    const MyFavorites()),
                profileParameters("Account Detials", Icons.person, kMediumBlue,
                    const AccountDetails()),
                profileParameters("Upgrade Account", Icons.upgrade, kAmberColor,
                    const AccountSubscription()),
                profileParameters(
                    "Settings", Icons.settings, kMediumGrey, const Settings()),
                profileParameters(
                    "Orders", Icons.shopping_cart, kGreen, Orders()),
                profileParameters(
                    "Payments", Icons.payment, kMediumBlue, MyPayments()),
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    signOut.remove('token');
                    signOut.write('isLoggedIn', false);
                    Get.find<UserController>().onDelete();
                    Get.offAll(const SignIn());
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: kDarkGrey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  uploadPicutre() async {
    setState(() {
      isLoading = true;
    });
    XFile? picture = await ImagePicker().pickImage(source: ImageSource.camera);
    await _profileController.changeProfile(File(picture!.path));
    Get.find<UserController>().getUser();
    setState(() {
      isLoading = false;
    });
  }

  profileParameters(text, icon, color, screen) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 8.0, bottom: 8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(screen);
            },
            child: Row(
              children: [
                Icon(icon, color: color, size: 30),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: const TextStyle(color: kDarkGrey, fontSize: 17),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.4,
          color: kMediumGrey,
        ),
      ],
    );
  }
}
