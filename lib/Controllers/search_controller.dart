import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Models/all_listing_model.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  var searchListings = AllListings().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getSearchedListings('');
    super.onInit();
  }

  getSearchedListings(searchString) async {
    isLoading.value = true;
    String url =
        "https://lagosabuja.com/wp-json/rtcl/v1/listings?search=$searchString";
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    print('Before Hit');

    searchListings.value = allListingsFromJson(response.body);
    isLoading.value = false;
    print(searchString);
    print("search response" + response.body);
  }
}
