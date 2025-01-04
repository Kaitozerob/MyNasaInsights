import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static final SharedHelper _instance = SharedHelper._internal();

  factory SharedHelper() {
    return _instance;
  }

  SharedHelper._internal();

  Future<int> getInt(String key, {int defaultValue = 0}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? defaultValue;
  }

  Future<bool> setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  Future<String?> getString(String key, {String? defaultValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultValue;
  }

  Future<bool> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  Future<bool> getBool(String key, {bool defaultValue = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  Future<List<String>> getStringList(String key, {List<String> defaultValue = const []}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? defaultValue;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, value);
  }

  Future<bool> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}