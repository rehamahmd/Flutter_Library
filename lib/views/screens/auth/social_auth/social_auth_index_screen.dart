import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/providers/src/social_auth_provider.dart';
import 'package:flutter_app/views/common_widgets/loaders/app_loading.dart';
import 'package:flutter_app/views/screens/auth/social_auth/facebook_auth_widget.dart';
import 'package:flutter_app/views/screens/auth/social_auth/google_auth_widget.dart';
import 'package:flutter_app/views/screens/auth/social_auth/logged_in_widget.dart';

import 'package:provider/provider.dart';

class SocialAuthIndexScreen extends StatefulWidget {
  const SocialAuthIndexScreen({Key? key}) : super(key: key);

  @override
  State<SocialAuthIndexScreen> createState() => _SocialAuthIndexScreenState();
}

class _SocialAuthIndexScreenState extends State<SocialAuthIndexScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<SocialAuthProvider>(context, listen: false).initUserLoginData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<SocialAuthProvider, dynamic>(
        selector: (_, provider) => {"user": provider.user, "authLoading": provider.authLoading},
        builder: (_, data, __) {
          User? user = data['user'];

          bool authLoading = data['authLoading'];
          if (authLoading) return const AppLoading();
          if (user != null) return LoggedInWidget(user: user);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FacebookAuthWidget(),
              GoogleAuthWidget(),
            ],
          );
        });
  }
}
