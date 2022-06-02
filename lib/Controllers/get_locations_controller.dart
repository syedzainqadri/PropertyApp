import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:realestapp/Models/listing_type.dart';

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
      priceUnit, badges, description,images) async {
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
    request.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw';

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
}














//   addListing(locationId, categoryId, listingType, title, status, price,
//       priceUnit, badges, description, images) async {
//     String url = 'https://lagosabuja.com/wp-json/rtcl/v1//listing/form';
//     // var response = await http.post(
//     //   Uri.parse(url),
//     //   headers: <String, String>{
//     //     'Authorization':  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',

//     //     'Accept': 'application/json',
//     //     'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
//     //   },
//     //   body: <String, dynamic>{
//     //     'locations': locationId.toString(),
//     //     'category_id': categoryId.toString(),
//     //     'listing_type': listingType,
//     //     'title': title,
//     //     'status': status,
//     //     'price': price,
//     //     'price_unit': priceUnit,
//     //     'badges': badges,
//     //     'description': description,
//     //     "'gallery'[]": images,
//     //   },);
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.headers['Content-Type'] = 'application/json; charset=UTF-8';
//     request.headers['X-API-KEY'] = '835c5442-20ca-4d51-9e32-fae11c35fd42';
//     request.headers['Authorization'] =
//         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw';

//     request.fields['locations'] = locationId.toString();
//     request.fields['category_id'] = categoryId.toString();
//     request.fields['listing_type'] = listingType;
//     request.fields['title'] = title;
//     request.fields['status'] = status;
//     request.fields['price'] = price;
//     request.fields['price_unit'] = priceUnit;
//     request.fields['badges'] = badges;
//     request.fields['description'] = description;

//     request.files.add(http.MultipartFile.fromBytes(
//         'gallery[]', File(images[0]!.path).readAsBytesSync(),
//         filename: images[0]!.path));
//     var res = await request.send();
//     print( res);
//   }
// }
