import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/shared_preferences_controller.dart';

class SettingsProvider extends ChangeNotifier {
  double _textScaleFactor = 1.0;
  double get textScaleFactor => _textScaleFactor;
  Future<void> setTextScaleFactor(double value) async {
    SharedPreferencesController.setTextScaleFactor(value);
    _textScaleFactor = value;
    notifyListeners();
  }

  SettingsProvider() {
    loadSharedPreferences();
  }

  Future<void> loadSharedPreferences() async {
    await SharedPreferencesController.initialize();
    _textScaleFactor = SharedPreferencesController.getTextScaleFactor() ?? 1.0;
    notifyListeners();
  }
}
