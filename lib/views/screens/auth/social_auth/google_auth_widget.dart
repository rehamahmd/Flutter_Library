import 'package:flutter/material.dart';
import 'package:flutter_app/providers/src/social_auth_provider.dart';
import 'package:flutter_app/views/screens/auth/social_auth/social_button_widget.dart';
import 'package:flutter_app/views/styles/styles.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class GoogleAuthWidget extends StatelessWidget {
  const GoogleAuthWidget({Key? key}) : super(key: key);

  _googleLogin(context) {
    Provider.of<SocialAuthProvider>(context, listen: false).googleLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SocialButtonWidget(
      title: 'Login with Google',
      color: AppColors.googleColor,
      icon: FontAwesomeIcons.googlePlusG,
      onTap: () => _googleLogin(context),
    );
  }
}
