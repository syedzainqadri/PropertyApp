import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/all_listing_model.dart';

import '../Models/Categories/category_model.dart';
import '../Models/locations_model.dart';

class ListingController extends GetxController {
  var allListings = AllListings().obs;
  var myListings = AllListings().obs;
  var favoriteListings = AllListings().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getAllListing();
    getMyListing();
    getMyFavorites();
    super.onInit();
  }

  getListingTypes() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listing-types';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
  }

  getAllListing() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listings';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    allListings.value = allListingsFromJson(response.body);
  }

  getMyListing() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/my/listings';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    myListings.value = allListingsFromJson(response.body);
  }

  getMyFavorites() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/my/favourites';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );

    favoriteListings.value = allListingsFromJson(response.body);
  }

  addListing(locationId, categoryId, listingType, title, status, price,
      priceUnit, badges, description, images) async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listing/form';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    for (int i = 0; i < images.length; i++) {
      String fileName = images![i].path.split("/").last;
      var stream = http.ByteStream(images[i].openRead())..cast();
      var length = await images[i].length();
      var multipartFileSign =
          http.MultipartFile('gallery[]', stream, length, filename: fileName);
      request.files.add(multipartFileSign);
    }

    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['X-API-KEY'] = '835c5442-20ca-4d51-9e32-fae11c35fd42';
    request.headers['Authorization'] = 'Bearer $token';

    request.fields['locations'] = locationId.toString();
    request.fields['category_id'] = categoryId.toString();
    request.fields['listing_type'] = listingType;
    request.fields['title'] = title;
    request.fields['status'] = status;
    request.fields['price'] = price;
    request.fields['price_unit'] = priceUnit;
    request.fields['badges'] = badges;
    request.fields['description'] = description;

    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print(response.body);
  }

  addToFavorites(listingId) async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/my/favourites';
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
      body: <String, dynamic>{
        'listing_id': listingId.toString(),
      },
    );

print(response.body+'*****************');
  }
}
