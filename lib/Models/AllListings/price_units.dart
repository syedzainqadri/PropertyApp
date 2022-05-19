import 'dart:convert';

import 'package:get/get.dart';

class PriceUnits{
  late String id,name;
  PriceUnits.fromJson(data){
    id =  data['id'];
    name =  data['name'];
  }
}