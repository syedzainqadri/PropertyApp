// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:realestapp/Models/AllListings/categories.dart';


class ContactModel{
 late String latitude,longitude,zipcode,address,phone,whatsapp_number,email,website,geo_address;
late AllListingsCategories locations;
  late bool hide_map;
  ContactModel.fromJson(response){
     var data = json.decode(response);
    latitude = data['latitude'];
    longitude = data['longitude'];
    zipcode = data['zipcode'];
    address = data['address'];
    phone = data['phone'];
    whatsapp_number = data['whatsapp_number'];
    email = data['email'];
    website = data['website'];
    geo_address = data['geo_address'];
    locations = AllListingsCategories.fromJson(data['categories']);
}
}