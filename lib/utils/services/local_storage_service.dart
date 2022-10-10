import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<String> getDataLocal(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String localData = prefs.getString(key) ?? "";
    return localData;
  }

  Future<void> setDataLocal(String key, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data is Map<String, dynamic> ? jsonEncode(data) : data);
  }
}
