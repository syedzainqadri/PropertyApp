import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Models/myListingModel/my_listing_model.dart';

class MyListingController extends GetxController {
  var isLoading = false.obs;
  var myListings = MyListingModel().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getMyListing();
    super.onInit();
  }

  getMyListing() async {
    isLoading.value = true;
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/my/listings';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    var json = jsonDecode(response.body);
    var map = Map.from(json);
    print(map.length);

    myListings.value = myListingModelFromJson(response.body);
    print(myListings.value.data!.length);
    print(myListings.value.pagination!.total);
    isLoading.value = false;
  }
}
