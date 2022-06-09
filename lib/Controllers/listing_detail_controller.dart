import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/listing_detail_model.dart';

class ListingDetailsController extends GetxController {
  var listingDetail = ListingDetail(
          listingId: 0,
          authorId: 0,
          title: '',
          pricingType: '',
          price: '',
          maxPrice: '',
          priceType: '',
          priceUnits: [],
          priceUnit: '',
          categories: [],
          adType: '',
          status: '',
          images: [],
          createdAt: DateTime(0),
          createdAtGmt: DateTime(0),
          viewCount: 0,
          promotions: [],
          badges: [],
          contact: Contact(
            address: '',
            geoAddress: '',
            email: '',
            hideMap: false,
            latitude: '',
            locations: [],
            longitude: '',
            phone: '',
            website: '',
            whatsappNumber: '',
            zipcode: '',
          ),
          store: Store(id: 0, title: ''),
          url: '',
          description: '',
          videoUrls: [],
          customFields: [],
          related: [],
          review: Review(rating: Rating(average: '', count: 0)))
      .obs;

  getListingById(listingId) async {
    var response = await http.get(
      Uri.parse('https://lagosabuja.com/wp-json/rtcl/v1/listings/$listingId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': '835c5442-20ca-4d51-9e32-fae11c35fd42',
      },
    );
    print(response.body);
    listingDetail.value = listingDetailFromJson(response.body);
  }
}
