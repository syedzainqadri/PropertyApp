import 'dart:convert';

class SignInModel{
  late String token_type,token;

  SignInModel.fromJson(result){
      var data = jsonDecode(result);
    token_type = data['token_type'];
    token = data['jwt_token'];
  }

}