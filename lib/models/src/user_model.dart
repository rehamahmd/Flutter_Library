import 'package:flutter_app/enums/enums.dart';

class User {
  String? id;
  String? displayName;
  String? userName;
  String? password;
  String? email;
  String? phoneNumber;
  String? token;
  SocialAuthChannel? userAuthChannel;
  User({
    this.id,
    this.displayName,
    this.email,
    this.password,
    this.phoneNumber,
    this.userName,
    this.token,
    this.userAuthChannel,
  });

  Map<String, dynamic> toMap() {
    Map<String, String> map = {};
    if (id != null) map["ID"] = id!;
    if (email != null) map["email"] = email!;
    if (displayName != null) map["name"] = displayName!;
    if (userName != null) map["user_login"] = userName!;
    if (phoneNumber != null) map["phone"] = phoneNumber!;
    if (password != null) map["password"] = password!;
    if (token != null) map["token"] = token!;
    return map;
  }

  fromUser(User? newUser) {
    id = newUser?.id;
    displayName = newUser?.displayName;
    email = newUser?.email;
    password = newUser?.password;
    phoneNumber = newUser?.phoneNumber;
    token = newUser?.token;
    userName = newUser?.userName;
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        id: parsedJson["user"]["id"].toString(),
        displayName: parsedJson["user"]["name"],
        userName: parsedJson["user"]["user_name"],
        email: parsedJson["user"]["email"],
        phoneNumber: parsedJson["user"]["phone"],
        token: parsedJson["token"],
        userAuthChannel: socialLoginChannel(parsedJson['userAuthChannel']));
  }

  factory User.fromSettingJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson["id"].toString(),
      displayName: parsedJson["name"],
      userName: parsedJson["user_name"],
      email: parsedJson["email"],
      phoneNumber: parsedJson["phone"],
      token: parsedJson["token"],
    );
  }
  static socialLoginChannel(userAuthChannelIndex) {
    switch (userAuthChannelIndex) {
      case 0:
        return SocialAuthChannel.facebook;
      case 1:
        return SocialAuthChannel.google;

      default:
    }
  }
}
