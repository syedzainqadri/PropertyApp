import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestapp/Controllers/membership_controller.dart';
import 'package:realestapp/Controllers/plansController.dart';
import 'package:realestapp/Models/membership_model.dart';
import 'package:realestapp/Models/promotion_Plans.dart';
import 'package:realestapp/Profile/payment_details.dart';
import '../Controllers/payment_controller.dart';
import '../Utils/color_scheme.dart';

class PromotionPlans extends StatefulWidget {
  const PromotionPlans({Key? key}) : super(key: key);

  @override
  State<PromotionPlans> createState() => _PromotionPlansState();
}

class _PromotionPlansState extends State<PromotionPlans> {
//  int _radioValue = 0;
  final PlansController plansController = Get.put(PlansController());
  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    var _promotions = Get.find<PlansController>();
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'Buy Promotion',
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
        child: Obx(
          () => ListView.builder(
              itemCount: plansController.promotionPlans.length,
              itemBuilder: ((context, index) =>
                  promotionCard(_promotions.promotionPlans.value[index]))),
        ),
      ),
    );
  }

  promotionCard(PromotionPlanModel promotionPlans) {
    return GestureDetector(
      onTap: () async {
        await paymentController.getPaymentGateways();
        Get.to(PaymentDetails(
          price: promotionPlans.price,
          title: promotionPlans.title,
          type: promotionPlans.type,
          id: promotionPlans.id,
        ));
      },
      child: Padding(
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
                    promotionPlans.title,
                    style: const TextStyle(color: white, fontSize: 18),
                  )),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Days',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 0.4,
                                  color: darkGrey,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Featured'),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          // Text(promotionPlans
                                          //     .promotion.regular.featured.ads
                                          //     .toString()),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          // Text(promotionPlans.promotion.regular
                                          //     .featured.validate
                                          //     .toString()),
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
                                      const Text('Bump Up'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 18.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: const [
                                            // Text(promotionPlans
                                            //     .promotion.regular.bumpUp.ads
                                            //     .toString()),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            // Text(promotionPlans.promotion
                                            //     .regular.bumpUp.validate
                                            //     .toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Top'),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          // Text(promotionPlans
                                          //     .promotion.regular.top.ads
                                          //     .toString()),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          // Text(promotionPlans
                                          //     .promotion.regular.top.validate
                                          //     .toString()),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await paymentController.getPaymentGateways();
                            Get.to(PaymentDetails(
                              price: promotionPlans.price,
                              title: promotionPlans.title,
                              type: promotionPlans.type,
                              id: promotionPlans.id,
                            ));
                          },
                          //TODO: curency symbol is NGN
                          child: Text('\$${promotionPlans.price}'),
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
      ),
    );
  }
}
