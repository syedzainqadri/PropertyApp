import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/payment_model.dart';
import 'package:realestapp/Models/paymenyByIdModel.dart';

import '../Models/listing_detail_model.dart';

class PaymentDetailsController extends GetxController {
  var paymentDetail = PaymentByIdModel().obs;

  getPaymentById(paymentId) async {
    var response = await http.get(
      Uri.parse('https://lagosabuja.com/wp-json/rtcl/v1/listings/$paymentId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    print(response.body);
    paymentDetail.value = paymentByIdModelFromJson(response.body);
  }
}
