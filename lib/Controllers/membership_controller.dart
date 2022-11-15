import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/checkout_model.dart';
import 'package:lagosabuja/Models/membership_model.dart';
import 'package:lagosabuja/Utils/const.dart';

class MembershipController extends GetxController {
  var box = GetStorage();
  var membershipPlans = List<Membership>.empty(growable: true).obs;
  var checkoutData = Checkout().obs;
  var paymetId = ''.obs;

  getMembershipPlans() async {
    var response = await http.get(
      Uri.parse(membershipPlansUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
      },
    );
    membershipPlans.value = membershipFromJson(response.body);
  }

  membershipCheckout(type, promotionType, gatewayId, planId) async {
    var token = box.read('token');
    var response =
        await http.post(Uri.parse(checkoutUrl), headers: <String, String>{
      'Accept': 'application/json',
      'X-API-KEY': apiKey,
      'Authorization': 'Bearer $token',
    }, body: <String, dynamic>{
      'type': type,
      'promotion_type': promotionType,
      'gateway_id': gatewayId,
      'plan_id': planId.toString(),
    });
    checkoutData.value = checkoutFromJson(response.body);
    paymetId.value = checkoutData.value.id.toString();
  }
}
