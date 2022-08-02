import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Models/all_listing_model.dart';
import 'package:lagosabuja/Models/selected_fields_model.dart';

import '../Models/Categories/category_model.dart';
import '../Models/locations_model.dart';

class ListingController extends GetxController {
  var isLoading = false.obs;
  var allListings = AllListings().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getAllListing();
    super.onInit();
  }

  getAllListing() async {
    isLoading.value = true;
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/listings';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    allListings.value = allListingsFromJson(response.body);
    isLoading.value = false;
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
    print("zipcode is $zipCode");
    print("address is $address");
    print("phone is $phone");
    print("whatsApp is $whatsApp");
    print("email is $email");
    print("website is $website");
    print("location is is $locationId");
    print("category id is $categoryId");
    print("location id is $locationId");
    print("title of the listing is $title");
    print("Status of the listing is $status");
    print("Price is $price");
    print("Price type is $priceType");
    print("pricing unit is $priceUnit");
    print("Badges is $badges");
    print("Images are $images");
    print("Video is $videoUrl");
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
    customFields.forEach((element) {
      if (element.id != 0) {
        request.fields.addAll({
          'custom_fields[${element.id}]': element.choice.id.toString(),
        });
      }
    });

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
    print(response.body);
    isLoading.value = false;
  }
}
