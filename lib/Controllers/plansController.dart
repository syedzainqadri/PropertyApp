// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Models/checkout_model.dart';
import 'package:gharounda/Models/promotion_Plans.dart';
import 'package:gharounda/Utils/const.dart';

class PlansController extends GetxController {
  var box = GetStorage();
  var promotionPlans = List<PromotionPlanModel>.empty(growable: true).obs;
  var checkoutData = Checkout().obs;
  var paymetId = ''.obs;
  var token = GetStorage().read('token');

  @override
  onInit() {
    super.onInit();
    getPromotionPlans();
  }

  getPromotionPlans() async {
    var response = await http.get(
      Uri.parse(regularPlansUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    promotionPlans.value = promotionPlanModelFromJson(response.body);
  }

  promotionPlanCheckout(type, promotionType, gatewayId, planId) async {
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
