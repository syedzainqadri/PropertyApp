import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/color_scheme.dart';

class AccountSubscription extends StatefulWidget {
  const AccountSubscription({Key? key}) : super(key: key);

  @override
  State<AccountSubscription> createState() => _AccountSubscriptionState();
}

class _AccountSubscriptionState extends State<AccountSubscription> {
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Save Membership',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: lightGreen,
                onSurface: white,
              ),
            ),
          ),
        ),
      ],
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'Upgrade Account',
          style: TextStyle(color: lightGreen),
        ),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.navigate_before,
            color: lightGreen,
            size: 35,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              membershipCard('Free Membership', '10', '30', '0', '0', '0', 0),
              const SizedBox(
                height: 8,
              ),
              membershipCard(
                  'Business Membership', '30', '30', '2', '12', '250', 1),
              const SizedBox(
                height: 8,
              ),
              membershipCard(
                  'Platinium Membership', '60', '50', '10', '30', '750', 2),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  membershipCard(title, regularAds, regularDays, featuredAds, featuredDays,
      price, int radioValue) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Text(
                  title,
                  style: const TextStyle(color: white, fontSize: 18),
                )),
              ),
              Expanded(
                child: Container(
                   decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 194, 250, 225),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Radio(
                        activeColor: lightGreen,
                        value: radioValue,
                        groupValue: _radioValue,
                        onChanged: (value) {
                          _handleRadioValueChange(value as int);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Ads',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Days',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 0.4,
                                color: darkGrey,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Regular'),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(regularAds),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(regularDays),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                color: Colors.black12,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Featured'),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 18.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('$featuredAds'),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text('$featuredDays'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('\$$price'),
                        style: ElevatedButton.styleFrom(
                          primary: lightGreen,
                          onSurface: white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
