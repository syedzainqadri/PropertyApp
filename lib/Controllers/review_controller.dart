import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gharounda/Models/review_model.dart';
import 'package:gharounda/Utils/const.dart';

class ReviewController extends GetxController {
  var reviewList = Review(
          data: [],
          pagination:
              Pagination(currentPage: 0, perPage: 0, total: 0, totalPages: 0))
      .obs;

  fetchReviews(listingId) async {
    var response = await http.get(
      Uri.parse(listingReviewUrl + listingId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-API-KEY': apiKey,
      },
    );
    var reviews = reviewFromJson(response.body);
    reviewList.value = reviews;
  }
}
