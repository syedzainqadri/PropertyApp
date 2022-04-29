import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/color_scheme.dart';


class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  @override
  void initState() {
    super.initState();
    firstNameController.text = 'Mark';
    lastNameController.text = 'Sacca';
    emailController.text = 'marksacca21@gmail.com';
    phoneNoController.text = '+27 1312323 523';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.navigate_before,
            color: lightGreen,
            size: 34,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Account Details',
          style: TextStyle(
            color: lightGreen,
          ),
        ),
      ),
      body: Column(
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
                color: mediumGrey,
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
            color: white,
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
                      color: darkGrey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.end,
                      cursorColor: lightGreen,
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
            color: white,
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
                      color: darkGrey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.end,
                      cursorColor: lightGreen,
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
          const SizedBox(height: 15,),
           const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              'PRIVATE DETAILS',
              style: TextStyle(
                color: mediumGrey,
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
            color: white,
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
                      color: darkGrey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      textAlign: TextAlign.end,
                      cursorColor: lightGreen,
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
            color: white,
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
                      color: darkGrey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      textAlign: TextAlign.end,
                      cursorColor: lightGreen,
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
        ],
      ),
    );
  }
}
