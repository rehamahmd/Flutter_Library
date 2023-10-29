import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/src/social_auth_controller.dart';
import 'package:flutter_app/models/models.dart';

class SocialAuthProvider extends ChangeNotifier {
  User? user;

  bool authLoading = false;

  initUserLoginData() async {
    user = await SocialAuthController.getUserLoginDataToSharedPref();
    notifyListeners();
  }

  facebookLogin() async {
    authLoading = true;
    notifyListeners();
    user = await SocialAuthController.facebookLogin();
    authLoading = false;
    notifyListeners();
  }

  facebookLogout() async {
    authLoading = true;
    notifyListeners();
    print('jjjjjjjjjjjjjjjjjjjjjjjjj');
    await SocialAuthController.facebookLogout();
    user = null;
    authLoading = false;
    notifyListeners();
  }

  googleLogin() async {
    authLoading = true;
    notifyListeners();
    user = await SocialAuthController.googleLogin();
    authLoading = false;
    notifyListeners();
  }

  googleLogout() async {
    authLoading = true;
    notifyListeners();
    await SocialAuthController.googleLogout();
    user = null;
    authLoading = false;
    notifyListeners();
  }
}
