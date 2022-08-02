import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/payment_model.dart';
import 'package:lagosabuja/Models/paymenyByIdModel.dart';

import '../Models/listing_detail_model.dart';

class PaymentDetailsController extends GetxController {
  var box = GetStorage();
  var paymentDetail = PaymentByIdModel().obs;

  getPaymentById(paymentId) async {
    var token = box.read('token');
    var response = await http.get(
      Uri.parse('https://lagosabuja.com/wp-json/rtcl/v1/payments/$paymentId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    paymentDetail.value = paymentByIdModelFromJson(response.body);
  }
}
