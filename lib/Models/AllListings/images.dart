import 'dart:convert';

import 'package:get/get.dart';

class ImageModel {
  late String title, caption, url, alt, src, srcset_sizes;
  late int ID, src_w, src_h;
  late bool srcset;
   ImageModel.fromJson(data){
     
     title = data['title'];
    caption = data['caption'];
     url = data['url'];
    alt = data['alt'];
    src = data['src'];
    srcset_sizes = data['srcset_sizes'];
    src_w = data['src_w'];
    src_h = data['src_h'];
    ID = data['ID'];
    srcset = data['srcset'];
   }
}
