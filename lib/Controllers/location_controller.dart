import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Utils/const.dart';
import '../Models/locations_model.dart';

class LocationsController extends GetxController {
  var locations = <LocationsModel>[].obs;
  var subLocations = <LocationsModel>[].obs;
  var userLocationId = 0.obs;
  var userLocationName = ''.obs;
  final token = GetStorage().read('token');
  RxBool isLoading = true.obs;
  List locationDist = [];

  @override
  onInit() {
    locationDist = ["5km", "10km", "15km", "20km", "30km", "40km", "50km"];
    getLocation();
    super.onInit();
  }

  getLocation() async {
    isLoading.value = false;
    String url = locationUrl;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    isLoading.value = false;
    locations.value = locationsModelFromJson(response.body);
  }

  getSubLocation(locationId) async {
    isLoading.value = true;
    String url = locationByIdUrl + locationId.toString();
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    isLoading.value = false;
    subLocations.value = locationsModelFromJson(response.body);
  }

  updateLocationName(id, name) {
    userLocationId.value = id;
    userLocationName.value = name;
  }
}
