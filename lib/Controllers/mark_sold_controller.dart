import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MarkSoldController extends GetxController {
  final token = GetStorage().read('token');

  markListingSold(listingId) async {
    print("Mark as Sold befor hit");
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my/mark-as-sold"),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
      body: {
        'listing_id': listingId,
      }
    );
    print("Mark as Sold after hit");
    print("Mark as Sold response " + response.body);
  }

}
