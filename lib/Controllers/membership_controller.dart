import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/checkout_model.dart';
import 'package:realestapp/Models/membership_model.dart';

class MembershipController extends GetxController {
  var box = GetStorage();
  var membershipPlans = List<Membership>.empty(growable: true).obs;
  var checkoutData = Checkout().obs;

  getMembershipPlans() async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/plans?type=membership"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
      },
    );
    membershipPlans.value = membershipFromJson(response.body);
  }

  membershipCheckout(type, promotionType, gatewayId, planId) async {
    var token = box.read('token');
    print(token);
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
          // 'created_date': DateTime.now(),
        });
    print(planId);
    print(response.body);
    checkoutData.value = checkoutFromJson(response.body);
    print(checkoutData.value.gateway.instructions);
  }
}
