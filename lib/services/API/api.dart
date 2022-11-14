import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class api {
  late SharedPreferences pref;
  var baseUrl;
  var dio = Dio();

  getSharedPrefernces() async {
    pref = await SharedPreferences.getInstance();
    return pref;
  }

  Future<dynamic> login(String phone_number) async {
    try {
      //create a map to store the data
      var data = {
        "phone_number": phone_number,
      };
      //make a post request to the server

      var response = await dio.post(
        "${baseUrl}/api/login",
        data: data,
      );
      //if the response is successful
      if (response.statusCode == 200) {
        //store the token in shared preferences
        await pref.setString("token", response.data["token"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("$e");
      return false;
    }
  }
}
