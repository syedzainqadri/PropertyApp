import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/order_model.dart';
import 'package:lagosabuja/Utils/const.dart';

class OrdersController extends GetxController {
  var orders = Order().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getAllOrders();
    super.onInit();
  }

  getAllOrders() async {
    var response = await http.get(
      Uri.parse(ordersUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    orders.value = orderFromJson(response.body);
  }
}
