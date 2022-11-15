import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/my_payments_model.dart';
import 'package:lagosabuja/Utils/const.dart';

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
      Uri.parse(paymentUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    myPayments.value = myPaymentsFromJson(response.body);
  }
}
