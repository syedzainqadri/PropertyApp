import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lagosabuja/Utils/const.dart';
import '../Models/Categories/category_model.dart';
import '../Models/locations_model.dart';

class CategoriesController extends GetxController {
  var categories = <CategoriesModel>[].obs;
  var subCategories = <LocationsModel>[].obs;
  @override
  onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    String url = categoriesUrl;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    if (response.statusCode == 200) {
      categories.value = categoriesFromJson(response.body);
    } else {}
  }

  getSubCategories(categoryId) async {
    String url = subCategoriesUrl + '$categoryId';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    if (response.statusCode == 200) {
      subCategories.value = locationsModelFromJson(response.body);
    } else {}
  }
}
