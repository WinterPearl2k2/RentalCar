import 'dart:convert';

import 'package:rental_car/domain/model/location.dart';
import 'package:rental_car/domain/model/token.dart';
import 'package:rental_car/domain/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();

  static const String _token = 'token';
  static const String _uuid = 'uuid';
  static const String _user = 'user';
  static const String _location = 'location';
  static const String _deviceToken = 'device_token';
  static const String _locationCurrent = 'location_current';
  static const String _nameLocationCurrent = 'name_location_current';

  static late final SharedPreferences _prefs;

  static Future<SharedPreferences> init() async =>
      _prefs = await SharedPreferences.getInstance();

  static void setDeviceToken(String token) {
    _prefs.setString(
      _deviceToken,
      token,
    );
  }

  static String getDeviceToken() {
    final data = _prefs.getString(_deviceToken);
    if (data != null) {
      return data;
    }
    return '';
  }

  static void setUUID(String uuid) {
    _prefs.setString(_uuid, uuid);
  }

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

  static void setUser(String email, String password) {
    _prefs.setString(
      _user,
      jsonEncode(
        User(
          emailUser: email,
          passwordUser: password,
        ),
      ),
    );
  }

  static User getUser() {
    final data = _prefs.getString(_user);
    if (data != null) {
      return User.fromJson(jsonDecode(data));
    }
    return const User();
  }

  static Token getToken() {
    final data = _prefs.getString(_token);
    if (data != null) {
      return Token.fromJson(jsonDecode(data));
    }
    return const Token();
  }

  static String getUUID() {
    final data = _prefs.getString(_uuid);
    if (data != null) {
      return data;
    }
    return '';
  }

  static clearToken() {
    _prefs.remove(_token);
  }

  static clearUUID() {
    _prefs.remove(_uuid);
  }

  static clearUser() {
    _prefs.remove(_user);
  }

  static void setLocation({
    required double latCar,
    required double longCar,
  }) {
    String locationString =
        jsonEncode(Location(latitude: latCar, longitude: longCar));
    _prefs.setString(_location, locationString);
  }

  static Location getLocation() {
    final data = _prefs.getString(_location);
    if (data != null) {
      return Location.fromJson(jsonDecode(data));
    }
    return const Location();
  }

  static void setNameLocationCurrent(String nameLocationCurrent) {
    _prefs.setString(_nameLocationCurrent, nameLocationCurrent);
  }

  static String getNameLocationCurrent() {
    final data = _prefs.getString(_nameLocationCurrent);
    if (data != null) {
      return data;
    }
    return '';
  }

  static void setLocationCurrent({
    required double latCar,
    required double longCar,
  }) {
    String locationString =
        jsonEncode(Location(latitude: latCar, longitude: longCar));
    _prefs.setString(_locationCurrent, locationString);
  }

  static Location getLocationCurrent() {
    final data = _prefs.getString(_locationCurrent);
    if (data != null) {
      return Location.fromJson(jsonDecode(data));
    }
    return const Location();
  }
}
