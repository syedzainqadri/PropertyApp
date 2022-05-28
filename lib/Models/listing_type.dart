import 'dart:convert';

class ListingType {
  late String id, name;

  ListingType.fromJson(response) {
    var data = json.decode(response);
    id = data['id'];
    name = data['name'];
  }
}

