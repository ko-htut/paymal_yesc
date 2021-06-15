//import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';

class MyPrefs {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future clear() async {
    var prefs = await _instance;
    prefs.clear();
  }

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }


  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

}
