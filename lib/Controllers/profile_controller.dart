import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/sign_in_model.dart';

class ProfileController extends GetxController {
  changeProfile(firstName, lastName, image) async {
    
    String picture = base64Encode(image.readAsBytesSync());
    var myBody = jsonEncode(<String, dynamic>{
      'image': picture,
      'first_name': firstName,
      'last_name': lastName,
    });
    var response = await http.post(
      Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkiLCJuYW1lIjoiemFpbnN5ZWQiLCJpYXQiOjE2NTE4NzYxODQsImV4cCI6MTY1MTk2MjU4NH0.m9irHZq07FM9fewh3h1OrJOq6ISLmnfb5pvSlCLxsCw',
      },
      body: myBody,
    );

    print(response.body + '*********');

    // var request = http.MultipartRequest(
    //     'POST', Uri.parse("https://lagosabuja.com/wp-json/rtcl/v1/my"));
    // request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    // request.headers['X-API-KEY'] = '835c5442-20ca-4d51-9e32-fae11c35fd42';
    // request.fields['first_name'] = firstName;
    // request.fields['last_name'] = lastName;
    // var picture = http.MultipartFile.fromBytes(
    //     'image', (await rootBundle.load(image)).buffer.asUint8List(),
    //     filename: 'profile_picture');
    // request.files.add(picture);
    // var response = await request.send();
    // var responseData = await response.stream.toBytes();
    // var result = String.fromCharCodes(responseData);
    // print(result);
    // print(response.body+'*********');
    // List<int> imageBytes = uploadimage.readAsBytesSync();
    //   String baseimage = base64Encode(imageBytes);
    //   //convert file image to Base64 encoding
    //   var response = await http.post(
    //           uploadurl,
    //           body: {
    //              'image': baseimage,
    //           }
    //   );
  }
}
