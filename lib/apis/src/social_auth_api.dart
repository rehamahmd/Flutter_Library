import 'package:flutter_app/apis/uri_generator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

// https://pub.dev/packages/flutter_facebook_auth
class SocialAuthApi {
  SocialAuthApi._();
  static final _googleSignIn = GoogleSignIn();
// FACEBOOK
  static fetchUserDataFromFB(token) async {
    var url = UriGenerator.getUserDataFromFB(token);
    try {
      var response = await http.get(url);
      return response;
    } catch (err) {
      return err;
    }
  }

  static Future<GoogleSignInAccount?> googleLogin() {
    return _googleSignIn.signIn();
  }

  static Future<GoogleSignInAccount?> googleLogout() {
    return _googleSignIn.signOut();
  }
}
