import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharounda/Controllers/profile_controller.dart';
import 'package:gharounda/Controllers/user_controller.dart';

import '../Utils/const.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  final ProfileController profileController = Get.put(ProfileController());
  final UserController userController = Get.put(UserController());
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  double height = Get.height;
  double width = Get.width;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    firstNameController.text = userController.userModel.value.firstName;
    lastNameController.text = userController.userModel.value.lastName;
    emailController.text = userController.userModel.value.email;
    phoneNoController.text = userController.userModel.value.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.navigate_before,
            color: kGreen,
            size: 34,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Account Details',
          style: TextStyle(
            color: kGreen,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'PUBLIC INFO',
                style: TextStyle(
                  color: kMediumGrey,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              margin: const EdgeInsets.all(0.0),
              color: kWhite,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'First Name',
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: kMediumGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: kWhite),
                      height: height * 0.06,
                      width: width * 0.5,
                      child: TextFormField(
                        validator: (v) => v!.isEmpty ? "required" : null,
                        textAlign: TextAlign.start,
                        cursorColor: kGreen,
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(0.0),
              elevation: 1.0,
              color: kWhite,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Last Name',
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: kMediumGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: kWhite),
                      height: height * 0.06,
                      width: width * 0.5,
                      child: TextFormField(
                        validator: (v) => v!.isEmpty ? "required" : null,
                        textAlign: TextAlign.start,
                        cursorColor: kGreen,
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'PRIVATE DETAILS',
                style: TextStyle(
                  color: kMediumGrey,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              margin: const EdgeInsets.all(0.0),
              color: kWhite,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: kMediumGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: kWhite),
                      height: height * 0.06,
                      width: width * 0.5,
                      child: TextFormField(
                        validator: (v) => v!.isEmpty ? "required" : null,
                        textAlign: TextAlign.start,
                        cursorColor: kGreen,
                        controller: emailController,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(0.0),
              elevation: 1.0,
              color: kWhite,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Phone Number',
                      style: TextStyle(
                        color: kDarkGrey,
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: kMediumGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: kWhite),
                      height: height * 0.06,
                      width: width * 0.5,
                      child: TextFormField(
                        validator: (v) => v!.isEmpty ? "required" : null,
                        textAlign: TextAlign.start,
                        cursorColor: kGreen,
                        controller: phoneNoController,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await userController.changeProfileDetail(
                            firstNameController.text,
                            lastNameController.text,
                            phoneNoController.text);
                        userController.update();
                        Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kGreen,
                      disabledForegroundColor: kWhite.withOpacity(0.38),
                      disabledBackgroundColor: kWhite.withOpacity(0.12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Update Profile',
                        style: TextStyle(fontSize: 16),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
