import 'package:get/get.dart';

class UserModel {
  String firstName = '';
  String lastName = '';
  String categoryId = '';
  String email = '';
  String userName = '';
  String phone = '';
  String picture = '';
  bool isAdmin = false;
  int id = 0;

  UserModel.fromJson(data) {
    firstName = data['first_name'];
    lastName = data['last_name'];
    id = data['id'];
    email = data['email'];
    userName = data['username'];
    phone = data['phone'];
    picture = data['pp_thumb_url'];
    isAdmin = data['isAdmin'];
  }
  UserModel();
}
