import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Utils/const.dart';
import '../Models/all_listing_model.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;
  var searchListings = AllListings().obs;
  final token = GetStorage().read('token');

  @override
  onInit() {
    getSearchedListings('');
    super.onInit();
  }

  getSearchedListings(searchString) async {
    isLoading.value = true;
    String url = listingSearchUrl + searchString;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    searchListings.value = allListingsFromJson(response.body);
    isLoading.value = false;
  }

  getFilteredData(
      type, location, lat, log, range, priceStart, priceEnd, sortBy) async {
    isLoading.value = true;
    var _type = type == '' ? '' : type;
    var _location = location == '' ? '' : location;
    var _lat = lat == '' ? '' : lat;
    var _log = log == '' ? '' : log;
    var _range = range == '' ? '' : range;
    var _priceStart = priceStart == '' ? '' : priceStart;
    var _priceEnd = priceEnd == '' ? '' : priceEnd;
    var _sortBy = sortBy == '' ? '' : sortBy;
    String url = filterSearchUrl +
        "$_priceStart,$_priceEnd&order_by=$_sortBy&listing_type=$_type&locations[]=$_location&latitude=$_lat&longitude=$_log&radius_search=$_range&custom_fields={'_field_4216':[], '_field_4316':[],'_field_4321':[]}";
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    searchListings.value = allListingsFromJson(response.body);
    isLoading.value = false;
  }

  sortListing(String sortedBy) async {
    isLoading.value = true;
    String url = sortSearchUrl + sortedBy;
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-API-KEY': apiKey,
        'Authorization': 'Bearer $token',
      },
    );
    searchListings.value = allListingsFromJson(response.body);
    isLoading.value = false;
  }
}
