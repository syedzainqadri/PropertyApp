import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../Models/locations_model.dart';

class LocationsController extends GetxController {
  var locations = <LocationsModel>[].obs;
  var subLocations = <LocationsModel>[].obs;
  var userLocationId = 0.obs;
  var userLocationName = ''.obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getLocation();
    super.onInit();
  }

  getLocation() async {
    String url = 'https://lagosabuja.com/wp-json/rtcl/v1/locations';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );
    locations.value = locationsModelFromJson(response.body);
  }

  getSubLocation(locationId) async {
    String url =
        'https://lagosabuja.com/wp-json/rtcl/v1/locations?parent_id=$locationId';
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
        'Authorization': 'Bearer $token',
      },
    );

    subLocations.value = locationsModelFromJson(response.body);
  }

  updateLocationName(id, name) {
    userLocationId.value = id;
    userLocationName.value = name;
  }
}
