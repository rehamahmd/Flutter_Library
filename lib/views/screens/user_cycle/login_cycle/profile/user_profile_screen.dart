import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/profile/profile_view.dart';
import 'package:flutter_app/views/styles/styles.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final User _user =
      User(id: "0", email: "test@test.com", displayName: "test user", phoneNumber: "01234567890");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: RangeMaintainingScrollPhysics(),
          padding: EdgeInsets.all(16 * AppResponsive.scaleFactor),
          children: [
            ProfileView(user: _user),
          ],
        ),
      ),
    );
  }
}
