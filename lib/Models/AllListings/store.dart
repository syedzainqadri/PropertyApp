import 'dart:convert';

class StoreModel {
  late String title;
  late int id;
  StoreModel.fromJson(data) {
    id = data['id'];
    title = data['title'];
  }
}
