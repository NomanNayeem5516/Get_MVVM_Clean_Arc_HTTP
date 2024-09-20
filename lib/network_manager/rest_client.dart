import 'package:get_api_http_clean_aec/models/user_list_in_object.dart';
import 'package:get_api_http_clean_aec/network_manager/http_helper.dart';

import '../models/user_list_in_array.dart';

class RestClient{


  static final HttpHelper _httpHelper=HttpHelper();

  static Future<UserListInObjectModel> getUserListInObject()async{
    Map<String, dynamic> response=await _httpHelper.get(url: "https://reqres.in/api/users?page=2");
    return UserListInObjectModel.fromJson(response);
  }

}