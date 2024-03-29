import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static getData({required String key}) {
  return  sharedPreferences!.get(key);
  }

  static Future<bool> setData({required String key, required value}) async {
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    return await sharedPreferences!.setDouble(key, value);
  }
}
