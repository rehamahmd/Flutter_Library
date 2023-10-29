import 'dart:convert';
import 'package:flutter_app/apis/apis.dart';
import 'package:flutter_app/controllers/src/shared_preferences_controller.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthController {
  static const NAME = 'SocialAuthController';

  // FACEBOOK
  static Future<User?> facebookLogin() async {
    try {
      final LoginResult facebookLoginResult = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );

      if (facebookLoginResult.status == LoginStatus.failed ||
          facebookLoginResult.status == LoginStatus.cancelled) {
        print(facebookLoginResult.status);
        return null;
      } else if (facebookLoginResult.status == LoginStatus.success) {
        if (facebookLoginResult.accessToken != null) {
          AccessToken accessToken = facebookLoginResult.accessToken!;

          var graphResponse = await SocialAuthApi.fetchUserDataFromFB(accessToken.token);
          var profile = json.decode(graphResponse.body);

          var userjson = {
            "user": {
              "id": profile['id'],
              "name": profile['name'],
              "email": profile['email'],
            },
            'userAuthChannel': SocialAuthChannel.facebook.index
          };
          await saveUserLoginDataToSharedPref(userjson);
          User user = User.fromJson(userjson);
          return user;
        }
        return null;
      }
    } catch (error) {
      print(error);
    }
  }

  static facebookLogout() async {
    await FacebookAuth.instance.logOut();
    await removeUserLoginDataToSharedPref();
    return;
  }

  static Future<User?> googleLogin() async {
    GoogleSignInAccount? googleUser;
    try {
      googleUser = await SocialAuthApi.googleLogin();
      if (googleUser != null) {
        var userjson = {
          "user": {
            "name": googleUser.displayName,
            "email": googleUser.email,
            'image': googleUser.photoUrl,
          },
          'userAuthChannel': SocialAuthChannel.google.index
        };

        await saveUserLoginDataToSharedPref(userjson);
        User user = User.fromJson(userjson);
        return user;
      } else {
        return null;
      }
    } catch (onError, stackTrace) {
      return null;
    }
  }

  static googleLogout() async {
    await SocialAuthApi.googleLogout();
    await removeUserLoginDataToSharedPref();
  }

  static saveUserLoginDataToSharedPref(userjson) async {
    String userString = json.encode(userjson);
    await SharedPreferencesController.saveUserLoginData(userString);
  }

  static removeUserLoginDataToSharedPref() async {
    await SharedPreferencesController.removeUserLoginData();
  }

  static getUserLoginDataToSharedPref() async {
    User? user;
    String? userString = await SharedPreferencesController.getUserLoginData();
    // if (userString != null) {
    //   var userJson = json.decode(userString);
    //   user = User.fromJson(userJson);
    // }
    return user;
  }
}
