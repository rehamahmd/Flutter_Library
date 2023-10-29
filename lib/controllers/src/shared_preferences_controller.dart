import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static const String themeMode = "theme_mode";
  static const String textScaleFactor = "text_scale_factor";
  static const USER_LOGIN_DATA = 'user_login_data';
}

class SharedPreferencesController {
  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // theme mode
  static ThemeMode? getThemeMode() {
    if (_prefs.containsKey(AppSettings.themeMode)) {
      return ThemeMode.values[_prefs.getInt(AppSettings.themeMode) ?? 0];
    }
  }

  static setThemeMode(ThemeMode value) {
    _prefs.setInt(AppSettings.themeMode, value.index);
  } // text scale factor

  static double? getTextScaleFactor() {
    if (_prefs.containsKey(AppSettings.textScaleFactor)) {
      return _prefs.getDouble(AppSettings.textScaleFactor);
    }
  }

  static setTextScaleFactor(double value) {
    _prefs.setDouble(AppSettings.textScaleFactor, value);
  }

  static Future<void> saveUserLoginData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppSettings.USER_LOGIN_DATA, data);
  }

  static Future<void> removeUserLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(AppSettings.USER_LOGIN_DATA)) {
      return;
    }
    prefs.remove(AppSettings.USER_LOGIN_DATA);
  }

  static Future<String?> getUserLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(AppSettings.USER_LOGIN_DATA)) {
      return null;
    }
    return prefs.getString(AppSettings.USER_LOGIN_DATA)!;
  }
}
