class Validator {
  /// private constructor to avoid create class object
  Validator._();

  /// check if string not empty and has value
  static bool hasValue(String? string) {
    if (string == null || string.isEmpty) return false;
    return true;
  }

  /// Return true if email is valid. Otherwise, return false
  static bool isEmail(String? email) {
    RegExp exp = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (exp.hasMatch(email ?? "")) return true;
    return false;
  }

  /// Return true if arabic lang. Otherwise, return false
  static bool isArabic(String string) {
    RegExp exp = new RegExp(r'[\u0600-\u06FF]+');
    if (exp.hasMatch(string)) return true;
    return false;
  }

  // Return true if phone number is valid. Otherwise, return false
  static bool isPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }

    final pattern = r'^(?:[+0]10)?[0-9]{11}$';
    final regExp = RegExp(pattern);

    if (regExp.hasMatch(phoneNumber)) return true;
    return false;
  }

  /// Return true if password is valid. Otherwise, return false
  static bool isValidPassword(String? password) {
    if (password == null) return false;
    if (password.length < 6) return false;
    return true;
  }

  /// Return true if String is valid Numeric. Otherwise, return false
  static bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  /// Return true if String is valid url. Otherwise, return false
  static bool isUrl(String url) {
    if (url.isEmpty) return false;
    final pattern = r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
    final regExp = RegExp(pattern);

    if (regExp.hasMatch(url)) return true;
    return false;
  }

  static bool isExceedMinChars(int minChars, String? value) {
    if (value == null || value.length < minChars) return false;
    return true;
  }

  static bool isExactNumber(String? value, number) {
    if (value == null || value.length != number) return false;
    return true;
  }

  /// Converts fully qualified YouTube Url to video id.
  ///
  /// If not valid youtube url return null if valid return youtube id
  ///
  /// If videoId is passed as url then no conversion is done.
  static String? convertUrlToYouTubeId(String url, {bool trimWhitespaces = true}) {
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }

    return null;
  }
}
