import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DeleteListingController extends GetxController {
  final token = GetStorage().read('token');

  deleteListing(listingId) async {
    print("Delete befor hit");
    var response = await http.delete(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/listings?listing_id=$listingId"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    print("Delete after hit");
    print("Delete response " + response.body);
  }

}
