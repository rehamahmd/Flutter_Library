import 'package:flutter/material.dart';

import 'package:flutter_app/providers/src/social_auth_provider.dart';
import 'package:flutter_app/views/screens/auth/social_auth/social_button_widget.dart';
import 'package:flutter_app/views/styles/src/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FacebookAuthWidget extends StatelessWidget {
  const FacebookAuthWidget({Key? key}) : super(key: key);

  _facebookLogin(context) {
    Provider.of<SocialAuthProvider>(context, listen: false).facebookLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SocialButtonWidget(
      title: 'Login with Facebook',
      color: AppColors.facebookColor,
      icon: FontAwesomeIcons.facebookF,
      onTap: () => _facebookLogin(context),
    );
  }
}
