import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/checkout_model.dart';
import 'package:realestapp/Models/membership_model.dart';
import 'package:realestapp/Models/promotion_Plans.dart';

class PlansController extends GetxController {
  var box = GetStorage();
  var promotionPlans = List<PromotionPlanModel>.empty(growable: true).obs;
  var checkoutData = Checkout().obs;
  var paymetId = ''.obs;
  var token = GetStorage().read('token');

  onInit() {
    getPromotionPlans();
  }

  getPromotionPlans() async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/plans?type=regular"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    promotionPlans.value = promotionPlanModelFromJson(response.body);
  }

  PromotionPlanCheckout(type, promotionType, gatewayId, planId) async {
    var response = await http.post(
        Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/checkout"),
        headers: <String, String>{
          'Accept': 'application/json',
          'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
          'Authorization': 'Bearer $token',
        },
        body: <String, dynamic>{
          'type': type,
          'promotion_type': promotionType,
          'gateway_id': gatewayId,
          'plan_id': planId.toString(),
        });
    checkoutData.value = checkoutFromJson(response.body);
    paymetId.value = checkoutData.value.id.toString();
  }
}
