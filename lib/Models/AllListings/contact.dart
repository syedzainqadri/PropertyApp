

import 'package:realestapp/Models/AllListings/all_listings_categories.dart';


class ContactModel{
 late String latitude,longitude,zipcode,address,phone,whatsapp_number,email,website,geo_address;
 List<AllListingsCategories> locations = [];
  late bool hide_map;
  ContactModel.fromJson(data){
    latitude = data['latitude'];
    longitude = data['longitude'];
    zipcode = data['zipcode'];
    address = data['address'];
    phone = data['phone'];
    whatsapp_number = data['whatsapp_number'];
    email = data['email'];
    website = data['website'];
    geo_address = data['geo_address'];
       var locObjsJson = data['locations'] as List;
    locations =
        locObjsJson.map((locJson) => AllListingsCategories.fromJson(locJson)).toList();
}
}