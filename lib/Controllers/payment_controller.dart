import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/payment_model.dart';

class PaymentController extends GetxController {
  var paymentGateways = List<Payment>.empty(growable: true).obs;

  getPaymentGateways() async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/payment-gateways"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    paymentGateways.value = paymentFromJson(response.body);
  }
}
