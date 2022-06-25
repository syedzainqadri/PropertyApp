import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/order_model.dart';

class OrdersController extends GetxController {
  var orders = Order().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getAllOrders();
    super.onInit();
  }

  getAllOrders() async {
    print("Orders befor hit");
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/orders"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );

    print("Orders after hit");
    print("Order response " + response.body);
    orders.value = orderFromJson(response.body);
  }
}
