import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String loggedInKey = 'LoggedIn';

// TODO
class LoginStateProvider extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _loggedIn = false;

  LoginStateProvider(this.prefs) {
    loggedIn = prefs.getBool(loggedInKey) ?? false;
  }

  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    prefs.setBool(loggedInKey, value);
    notifyListeners();
  }

  void checkLoggedIn() {
    loggedIn = prefs.getBool(loggedInKey) ?? false;
  }
}
