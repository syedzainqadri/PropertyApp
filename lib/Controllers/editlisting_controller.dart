// ignore_for_file: unused_local_variable, equal_keys_in_map

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/EditlistingModel.dart';

class EditListingController extends GetxController {
  var isLoading = false.obs;
  var editListing = EditListingModel().obs;
  final token = GetStorage().read('token');

  getListing(var listingId) async {
    isLoading.value = true;
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/listing/form?listing_id=$listingId';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    editListing.value = editListingModelFromJson(response.body);
    isLoading.value = false;
  }

  updateListing(
    listingId,
    address,
    phone,
    whatsApp,
    email,
    website,
    title,
    price,
    description,
    images,
    videoUrl,
    categoryId,
  ) async {
    isLoading.value = true;
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/listing/form?listing_id=$listingId';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    for (int i = 0; i < images.length; i++) {
      String fileName = images![i].path.split("/").last;
      var stream = http.ByteStream(images[i].openRead())..cast();
      var length = await images[i].length();
      var multipartFileSign =
          http.MultipartFile('gallery[]', stream, length, filename: fileName);
      request.files.add(multipartFileSign);
    }
    request.headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      'Authorization': 'Bearer $token'
    });
    request.fields.addAll({
      'address': address.toString(),
      'phone': phone.toString(),
      'whatsapp_number': whatsApp.toString(),
      'email': email.toString(),
      'website': website.toString(),
      'title': title.toString(),
      'price': price.toString(),
      'description': description.toString(),
      'video_urls': videoUrl.toString(),
      'category_id': categoryId.toString(),
    });
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    isLoading.value = false;
  }

  deleteImage(
    listingId,
    imagestodelete,
    categoryId,
    address,
    phone,
    whatsApp,
    email,
    website,
    title,
    price,
    description,
    images,
    videoUrl,
  ) async {
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/listing/form?listing_id=$listingId';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      'Authorization': 'Bearer $token'
    });
    request.fields.addAll({
      'gallery_delete[]': imagestodelete.toString(),
      'category_id': categoryId.toString(),
      'address': address.toString(),
      'phone': phone.toString(),
      'whatsapp_number': whatsApp.toString(),
      'email': email.toString(),
      'website': website.toString(),
      'title': title.toString(),
      'price': price.toString(),
      'description': description.toString(),
      'video_urls': videoUrl.toString(),
    });
    var res = await request.send();
    var response = await http.Response.fromStream(res);
  }
}
