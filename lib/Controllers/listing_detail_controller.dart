import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/listing_detail_model.dart';

class ListingDetailsController extends GetxController {
  var listingDetail = ListingByIdModel().obs;

  getListingById(listingId) async {
    var response = await http.get(
      Uri.parse('https://lagosabuja.com/wp-json/rtcl/v1/listings/$listingId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    listingDetail.value = listingByIdModelFromJson(response.body);
    List<Image> image = listingDetail.value.images!;
  }
}
