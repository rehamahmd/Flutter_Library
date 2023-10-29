import 'package:flutter/material.dart';
import 'package:flutter_app/views/common_widgets/appbar/main_appbar.dart';
import 'package:flutter_app/views/router/router.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbarWidget(props: MainAppbarProps(screenTitle: 'FE Library')),
      body: const Center(child: Text("Login Screen")),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_before),
          onPressed: () {
            context.goNamed(homeScreen);
          }),
    );
  }
}
