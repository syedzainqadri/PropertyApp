import 'dart:convert';
import 'dart:io';
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

  addListing(locationId, categoryId, listingType, title, status, price,
      priceUnit, badges, description, images) async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listing/form';
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTQxMTc3NTgsImV4cCI6MTY1NDIwNDE1OH0.U8MOjYhf5e-6h8D__FQDP7F1OZowkA5k3r9JiRzFWqQ',
      },
      body: <String, dynamic>{
        'locations': locationId.toString(),
        'category_id': categoryId.toString(),
        'listing_type': listingType,
        'title': title,
        'status': status,
        'price': price,
        'price_unit': priceUnit,
        'badges': badges,
        'description': description,
        'gallery[]': images,
      },
    );
    print(response.body);
  }
}
