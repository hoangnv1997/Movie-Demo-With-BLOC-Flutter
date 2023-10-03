import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String keyToken = 'keyToken';
  static const String keyAccessToken = 'keyAccessToken';
  static const String keyThemeMode = 'keyThemeMode';
  static const String keyLogged = 'keyLogged';

  static Future<void> saveTokenAndAccessToken(
      {required String token, required String accessToken}) async {
    if (token.isEmpty || accessToken.isEmpty) return;

    await setStringType(keyToken, token);
    await setStringType(keyAccessToken, accessToken);
  }

  static Future<String> getToken() async {
    String token = await getStringType(keyToken);
    return token;
  }

  static Future<void> setThemeMode({required int mode}) async {
    await setIntType(keyThemeMode, mode);
  }

  static Future<int> getThemeMode() async {
    return await getIntType(keyThemeMode);
  }

  static Future<void> setStringType(String key, String input) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, input);
  }

  static Future<String> getStringType(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<void> setIntType(String key, int input) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, input);
  }

  static Future<int> getIntType(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future<void> setBoolType(String key, bool input) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, input);
  }

  static Future<bool> getBoolType(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
