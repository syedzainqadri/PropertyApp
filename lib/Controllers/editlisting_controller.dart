import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:realestapp/Models/EditlistingModel.dart';
import 'package:realestapp/Models/selected_fields_model.dart';

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
    print(response.body);
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
    print("Listing id is $listingId");
    print("address is $address");
    print("phone is $phone");
    print("whatsApp is $whatsApp");
    print("email is $email");
    print("website is $website");
    print("title of the listing is $title");
    print("Price is $price");
    print("Images are $images");
    print("Video is $videoUrl");
    print("Category is $categoryId");
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
    print(response.body);
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
    print("Listing id is $listingId");
    print("images to delete are $imagestodelete");
    print("Category is $categoryId");
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
      'category_id': categoryId.toString(),
    });
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    print(response.body);
  }
}

// 'gallery_delete[]': 

