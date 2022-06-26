import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/store_model.dart';

class StoreController extends GetxController {
  var myStore = MyStore().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getMyStore();
    super.onInit();
  }

  getMyStore() async {
    print("Store befor hit");
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/store"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );

    print("My Store after hit");
    print("Store Get response " + response.body);
    myStore.value = myStoreFromJson(response.body);
  }

  createStore(title, email, phone, website, address, description) async {
    // title  email phone website address description
    print("Create Store befor hit");
    var response = await http.post(
        Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/store"),
        headers: <String, String>{
          'Accept': 'application/json',
          'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
          'Authorization': 'Bearer $token',
        },
        body: {
          'title': title.toString(),
          'email': email.toString(),
          'phone': phone.toString(),
          'website': website.toString(),
          'address': address.toString(),
          'description': description.toString(),
        });

    print("Create Store after hit");
    print("Create Store response " + response.body);
  }
}
