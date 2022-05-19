// ignore_for_file: non_constant_identifier_names


import 'package:realestapp/Models/AllListings/contact.dart';
import 'package:realestapp/Models/AllListings/store.dart';

import 'categories.dart';
import 'images.dart';
import 'price_units.dart';

class AllListings {
  late String title,
      pricing_type,
      price,
      max_price,
      price_type,
      price_unit,
      ad_type,
      status,
      created_at,
      created_at_gmt;
  late int author_id,listing_id, view_count;
  late PriceUnits price_units;
  late AllListingsCategories categories;
  late List<ImageModel> images;
  late ContactModel contact;
  late StoreModel store;

  AllListings.fromJson(data) {
    // var result = jsonDecode(response);
    // var data= result['data'];
    listing_id = data['listing_id'];
    author_id = data['author_id'];
    title = data['title'];
    pricing_type = data['pricing_type'];
    price = data['price'];
    max_price = data['max_price'];
    price_type = data['price_type'];
    price_unit = data['price_unit'];
    ad_type = data['ad_type'];
    status = data['status'];
    created_at = data['created_at'];
    created_at_gmt = data['created_at_gmt'];
    view_count = data['view_count'];
    price_units = PriceUnits.fromJson(data['price_units']);
    categories = AllListingsCategories.fromJson(data['categories']);
    var imgObjsJson = data['tags'] as List;
    images =
        imgObjsJson.map((imgJson) => ImageModel.fromJson(imgJson)).toList();
        contact = ContactModel.fromJson(data['categories']);
        store =  StoreModel.fromJson(data['store']);
  }
}
