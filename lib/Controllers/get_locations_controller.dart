import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController {
  getAllLocations() async {
    var response = await http.get(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/locations"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );

    return jsonDecode(response.body);
  }


addListing(locationId, categoryId, listingType, title, status, price, priceUnit,
    badges, description, images) async {
  String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listings';
  var response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Accept': 'application/json',
      'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
    },
    body: <String, String>{
      'locations': locationId,
      'category_id': categoryId,
      'listing_type': listingType,
      'title': title,
      'status': status,
      'price': price,
      'price_unit': priceUnit,
      'badges': badges,
      'description': description,
      'gallery': images,
    },
  );
 print( response.body);
}
}