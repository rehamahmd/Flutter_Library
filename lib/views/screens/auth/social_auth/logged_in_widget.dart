import 'package:flutter/material.dart';
import 'package:flutter_app/enums/enums.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/providers/src/social_auth_provider.dart';
import 'package:flutter_app/views/screens/auth/social_auth/social_button_widget.dart';

import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  final User user;

  const LoggedInWidget({Key? key, required this.user}) : super(key: key);
  _logout(context) {
    switch (user.userAuthChannel) {
      case SocialAuthChannel.facebook:
        _facebookLogout(context);
        break;
      case SocialAuthChannel.google:
        _googleLogout(context);
        break;
      default:
    }
  }

  _facebookLogout(context) {
    Provider.of<SocialAuthProvider>(context, listen: false).facebookLogout();
  }

  _googleLogout(context) {
    Provider.of<SocialAuthProvider>(context, listen: false).googleLogout();
  }

  @override
  Widget build(BuildContext context) {
    SocialAuthChannel authChannel = user.userAuthChannel ?? SocialAuthChannel.facebook;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Welcome ${user.displayName}'),
        SocialButtonWidget(
          title: 'Logout',
          color: authChannel.color,
          icon: authChannel.iconData,
          onTap: () => _logout(context),
        )
      ],
    );
  }
}
