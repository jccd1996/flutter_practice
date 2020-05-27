import 'package:flutter_practice/models/user_response.dart';
import 'package:flutter_practice/utils/user_api_provider.dart';

class UserRepository{
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser(){
    return _apiProvider.getUser();
  }
}