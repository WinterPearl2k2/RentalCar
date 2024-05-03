import 'dart:convert';

import 'package:rental_car/domain/model/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();
  static const String _token = 'token';

  static late final SharedPreferences _prefs;

  static Future<SharedPreferences> init() async =>
      _prefs = await SharedPreferences.getInstance();

  static void setToken(String accessToken, String refreshToken) {
    _prefs.setString(
      _token,
      jsonEncode(
        Token(
          accessToken: accessToken,
          refreshToken: refreshToken,
        ),
      ),
    );
  }

  static Token getToken() {
    final data = _prefs.getString(_token);
    if(data != null) {
      return Token.fromJson(jsonDecode(data));
    }
    return const Token();
  }

  static clearToken() {
    _prefs.remove(_token);
  }
}
