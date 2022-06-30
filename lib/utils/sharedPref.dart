import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

String localUserDataKey = 'userDataKey';
String setProfile = "setProfileKey";

class SharedPref {
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<bool?> readBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  saveBool(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<String?> readParsedValue(String key,String subKey) async {
    final prefs = await SharedPreferences.getInstance();
    var user = prefs.getString(key);
    var parseStringToJson = jsonDecode(user!);
    return parseStringToJson[subKey];
  }

}
