import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/my_payments_model.dart';

class MyPaymentsController extends GetxController {
  var myPayments = MyPayments().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getAllPayments();
    super.onInit();
  }

  getAllPayments() async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/payments"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    myPayments.value = myPaymentsFromJson(response.body);
  }
}
