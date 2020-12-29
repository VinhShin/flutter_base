import 'package:shared_preferences/shared_preferences.dart';

const String keyAccessToken = 'key_accessToken';
const String keyRefreshToken = 'key_refresh_Token';
const String keyIntroPageHasShown = 'key_intro_page_has_shown';
const String keyLanguage = 'language';
const String keyDarkTheme = 'darkTheme';
const String keyFirstSeen = 'key_first_seen';

class SharedManager {
  static SharedPreferences _sharedPreferences;

  SharedManager() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> putString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  String getString(String key) => _sharedPreferences.getString(key);

  Future<bool> putInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  int getInt(String key) => _sharedPreferences.getInt(key);

  Future<bool> putBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);

  bool getBool(String key) => _sharedPreferences.getBool(key);

  Future clear() => _sharedPreferences.clear();
}