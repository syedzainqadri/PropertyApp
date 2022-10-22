// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class SignInModel {
  String token_type = '', token = '';

  SignInModel.fromJson(result) {
    var data = jsonDecode(result);
    token_type = data['token_type'];
    token = data['jwt_token'];
  }
  SignInModel();
}
