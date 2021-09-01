import 'dart:convert';

import 'package:sample_app/utitlities/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreference {

  /*
  #~~~~~~~~~~ This is used to save and get object data  in shared preference
  static Future<bool> setUserData(userData) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(user_data, userData);
  }

  static Future<LoginResponse> getUserData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var userData = sharedPreferences.getString(Constant.user_data);
    try {
      return LoginResponse.fromJson(json.decode(userData));
    } catch (e) {
      print('SHARED_PREFERENCE~~~~~~~~~~$e');
      return null;
    }
  }*/

}
