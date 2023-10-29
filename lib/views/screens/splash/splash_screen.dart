import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/router/router.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FlareActor(
          "assets/flares/turn_digital_splash.flr",
          fit: BoxFit.fitHeight,
          animation: "splash",
          callback: (animation) {
            context.goNamed(homeScreen);
          },
        ),
      ),
    );
  }
}
