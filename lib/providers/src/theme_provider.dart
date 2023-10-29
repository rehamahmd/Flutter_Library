import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/shared_preferences_controller.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    loadSharedPreferences();
  }
  // Listeners
  ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;
  // ACTIONS
  Future<void> setThemeMode(ThemeMode value) async {
    _themeMode = value;
    notifyListeners();
    await SharedPreferencesController.setThemeMode(value);
  }

  // get app setting
  Future<void> loadSharedPreferences() async {
    await SharedPreferencesController.initialize();
    _themeMode = SharedPreferencesController.getThemeMode() ?? ThemeMode.system;
    notifyListeners();
  }
}
