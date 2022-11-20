import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Utils/const.dart';
import '../Models/listing_detail_model.dart';

class ListingDetailsController extends GetxController {
  var listingDetail = ListingsByIdModel().obs;

  getListingById(listingId) async {
    var response = await http.get(
      Uri.parse(listingUrl + listingId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': apiKey,
      },
    );
    listingDetail.value = listingsByIdModelFromJson(response.body);
  }
}
