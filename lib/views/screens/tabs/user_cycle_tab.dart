import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/buttons/app_icon_button.dart';
import 'package:flutter_app/views/screens/auth/social_auth/social_auth_index_screen.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/sign_in_screen.dart';

class UserCycleTab extends StatefulWidget {
  const UserCycleTab({Key? key}) : super(key: key);

  @override
  State<UserCycleTab> createState() => _UserCycleTabState();
}

class _UserCycleTabState extends State<UserCycleTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [SignInPage(), SocialAuthIndexScreen()],
    );
  }
}
