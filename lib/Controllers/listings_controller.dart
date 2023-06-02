// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/all_listing_model.dart';
import 'package:lagosabuja/Models/selected_fields_model.dart';

class ListingController extends GetxController {
  var isLoading = false.obs;
  var allListings = Alllistings().obs;
  final token = GetStorage().read('token');
  var listOne = List.empty(growable: true).obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

  @override
  onInit() {
    getAllListing(isRefreshed: true);
    super.onInit();
  }

  getAllListing({bool isRefreshed = false}) async {
    if (isRefreshed) {
      isLoading.value = true;
      currentPage.value = 1;
    }
    if (currentPage.value >= totalPages.value) {
      currentPage.value = totalPages.value;
      isLoading.value = true;
      String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listings';
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        },
      );
      print('<====== body is ======>');
      print(response.body);
      allListings.value = alllistingsFromJson(response.body);
      print('<====== total is ======>');
      print(allListings.value.pagination!.total);
      listOne.value = allListings.value.data!;
      totalPages.value = allListings.value.pagination!.totalPages;
      isLoading.value = false;
    } else if (currentPage <= 1) {
      currentPage.value = 1;
      isLoading.value = true;
      String url =
          'https://lagosabuja.com/wp-json/rtcl/v1/listings?page=$currentPage';
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        },
      );
      allListings.value = alllistingsFromJson(response.body);
      listOne.value = allListings.value.data!;
      isLoading.value = false;
    } else {
      isLoading.value = true;
      String url =
          'https://lagosabuja.com/wp-json/rtcl/v1/listings?page=$currentPage';
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        },
      );
      allListings.value = alllistingsFromJson(response.body);
      listOne.value = allListings.value.data!;
      isLoading.value = false;
    }
  }

  addListing(
      zipCode,
      address,
      phone,
      whatsApp,
      email,
      website,
      locationId,
      categoryId,
      listingType,
      title,
      status,
      price,
      priceType,
      priceUnit,
      badges,
      description,
      images,
      latitude,
      longitude,
      videoUrl,
      List<SelectedFieldsModel> customFields,
      amenities) async {
    isLoading.value = true;
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
    for (var element in customFields) {
      if (element.id != 0) {
        request.fields.addAll({
          'custom_fields[${element.id}]': element.choice.id.toString(),
        });
      }
    }

    request.headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      'Authorization': 'Bearer $token'
    });
    request.fields.addAll({
      'zipcode': zipCode.toString(),
      'address': address.toString(),
      'phone': phone.toString(),
      'whatsapp_number': whatsApp.toString(),
      'email': email.toString(),
      'website': website.toString(),
      'locations': locationId.toString(),
      'category_id': categoryId.toString(),
      'listing_type': listingType.toString(),
      'title': title.toString(),
      'status': status.toString(),
      'price': price.toString(),
      'price_type': priceType.toString(),
      'price_unit': priceUnit.toString(),
      'badges': badges.toString(),
      'description': description.toString(),
      'custom_fields[4216]': amenities.toString(),
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'video_urls': videoUrl.toString(),
    });
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    isLoading.value = false;
  }
}
