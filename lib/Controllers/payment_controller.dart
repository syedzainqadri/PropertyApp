import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Models/payment_model.dart';
import 'package:gharounda/Utils/const.dart';

class PaymentController extends GetxController {
  var paymentGateways = List<Payment>.empty(growable: true).obs;

  getPaymentGateways() async {
    var response = await http.get(
      Uri.parse(paymentGatewayUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
      },
    );
    paymentGateways.value = paymentFromJson(response.body);
  }
}
