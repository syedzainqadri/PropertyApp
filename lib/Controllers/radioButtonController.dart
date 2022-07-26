import 'package:get/get.dart';

class RadioButtonController extends GetxController {
  var sortBy = 'price-desc'.obs;
  String get sortByValue => sortBy.value;

  setSortBy(String value) {
    sortBy.value = value;
  }
}
