import 'dart:convert';

import 'package:sample_app/models/request_model/SignUpRequest.dart';
import 'package:sample_app/utitlities/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreference {

 // #~~~~~~~~~~ This is used to save and get object data  in shared preference
  static Future<bool> setUserData(userData) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(user_data, userData);
  }

  static Future<SignUpRequest?> getUserData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var userData = sharedPreferences.getString(user_data);
    try {
      return SignUpRequest.fromJson(json.decode(userData!));
    } catch (e) {
      print('SHARED_PREFERENCE~~~~~~~~~~$e');
      return null;
    }
  }

}
