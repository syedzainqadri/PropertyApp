import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/OrderByIdModel.dart';
import 'package:realestapp/Models/payment_model.dart';
import 'package:realestapp/Models/paymenyByIdModel.dart';

import '../Models/listing_detail_model.dart';

class OrderDetailsController extends GetxController {
  var box = GetStorage();
  var orderDetail = OrderByIdModel().obs;

  getOrderById(orderId) async {
    var token = box.read('token');
    var response = await http.get(
      Uri.parse('https://lagosabuja.com/wp-json/rtcl/v1/orders/$orderId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    print("this is what the response is: ${response.body}");
    orderDetail.value = orderByIdModelFromJson(response.body);
  }
}
