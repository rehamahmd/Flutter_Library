import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialAuthChannel { facebook, google }

extension SocialAuthChannelExtension on SocialAuthChannel {
  IconData? get iconData {
    switch (this) {
      case SocialAuthChannel.facebook:
        return FontAwesomeIcons.facebookF;
      case SocialAuthChannel.google:
        return FontAwesomeIcons.googlePlusG;

      default:
        return null;
    }
  }

  Color get color {
    switch (this) {
      case SocialAuthChannel.facebook:
        return AppColors.facebookColor;
      case SocialAuthChannel.google:
        return AppColors.googleColor;

      default:
        return AppColors.black;
    }
  }
}
