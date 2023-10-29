import 'package:flutter/material.dart';
import 'package:flutter_app/providers/src/login_state_provider.dart';
import 'package:flutter_app/views/screens/login/login_screen.dart';
import 'package:flutter_app/views/screens/sliders/slider_1/slider_1_view.dart';
import 'package:flutter_app/views/screens/sliders/slider_7/slider_7.dart';
import 'package:flutter_app/views/screens/maps/two_location_view.dart';
import 'package:flutter_app/views/screens/splash/splash_screen.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/forget_password_screen.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/profile/user_profile_screen.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/sign_in_screen.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/sign_up_screen.dart';
import 'package:flutter_app/views/screens/user_cycle/login_cycle/verify_email_screen.dart';
import 'package:flutter_app/views/screens/stepper/stepper_screen.dart';
import 'package:flutter_app/views/screens/splash/splash_screen.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_app/views/screens/sliders/slider_1/slider_1.dart';
import 'package:flutter_app/views/screens/sliders/slider_6/slider_6.dart';
import 'package:flutter_app/views/screens/splash/splash_screen.dart';
import 'package:flutter_app/views/screens/sliders/slider_2/slider_2.dart';
import 'package:flutter_app/views/screens/sliders/slider_3/slider_3.dart';
import 'package:flutter_app/views/screens/splash/splash_screen.dart';
import 'package:flutter_app/views/screens/sliders/slider_4/slider_4.dart';
import 'package:flutter_app/views/screens/splash/splash_screen.dart';
import 'package:flutter_app/views/screens/sliders/slider_5/slider_5.dart';
import 'package:flutter_app/views/screens/splash/splash_screen.dart';
import 'package:flutter_app/views/ui_dummy_data/sliders_data.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/views/screens/sliders/slider_8/slider_8.dart';
import 'package:flutter_app/views/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/views/screens/sliders/slider_9/slider_9.dart';
import 'package:flutter_app/views/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/error/error_screen.dart';
import '../screens/home/home_screen.dart';

const String rootScreen = 'root';
const String errorScreen = 'error';
const String loginScreen = 'login';
const String homeScreen = 'home';
const String slider1Screen = 'slider1';
const String slider2Screen = 'slider2';
const String slider3Screen = 'slider3';
const String slider4Screen = 'slider4';
const String slider5Screen = 'slider5';
const String slider6Screen = 'slider6';
const String slider7Screen = 'slider7';
const String slider8Screen = 'slider8';
const String slider9Screen = 'slider9';
const String twoLocationView = 'twoLocationView';
const String signInScreen = 'signIn';
const String signupScreen = 'signUp';
const String forgetPasswordScreen = 'forgetPassword';
const String userProfileScreen = 'userProfile';
const String verifyEmailScreen = 'verifyEmail';
const String stepperScreen = 'stepper';

class MyRouter {
  final LoginStateProvider loginState;

  MyRouter(this.loginState);

  late final router = GoRouter(
    refreshListenable: loginState,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: rootScreen,
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        name: loginScreen,
        path: '/login',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        name: homeScreen,
        path: '/home',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: HomeScreen(),
        ),
      ),

      GoRoute(
        name: slider1Screen,
        path: '/slider1',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
            appBar: AppBar(automaticallyImplyLeading: true),
            body: SliderOneView(),
          ),
        ),
      ),
      GoRoute(
        name: slider2Screen,
        path: '/slider2',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: true),
              body: SliderTwo(props: SliderTwoProps())),
        ),
      ),
      GoRoute(
        name: slider3Screen,
        path: '/slider3',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: true),
              body: SliderThree(props: SliderThreeProps())),
        ),
      ),
      GoRoute(
        name: slider4Screen,
        path: '/slider4',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: true),
              body: SliderFour(props: SliderFourProps())),
        ),
      ),
      GoRoute(
        name: slider5Screen,
        path: '/slider5',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
            appBar: AppBar(automaticallyImplyLeading: true),
            body: const SliderFive(),
          ),
        ),
      ),
      GoRoute(
        name: slider6Screen,
        path: '/slider6',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: true),
              body: SliderSix(props: SliderSixProps())),
        ),
      ),
      GoRoute(
        name: slider7Screen,
        path: '/slider7',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(appBar: AppBar(automaticallyImplyLeading: true), body: SliderSeven()),
        ),
      ),
      GoRoute(
        name: slider8Screen,
        path: '/slider8',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: true),
              body: SliderEight(props: SliderEightProps())),
        ),
      ),
      GoRoute(
        name: slider9Screen,
        path: '/slider9',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Scaffold(
              appBar: AppBar(automaticallyImplyLeading: true),
              body: SliderNine(props: SliderNineProps())),
        ),
      ),
      // GoRoute(
      //   name: twoLocationView,
      //   path: '/twoLocationView',
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: state.pageKey,
      //     child: TwoLocationView(),
      //   ),
      // ),
      GoRoute(
        name: signInScreen,
        path: '/signIn',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        name: signupScreen,
        path: '/signUp',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        name: forgetPasswordScreen,
        path: '/forgetPassword',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: ForgetPasswordScreen(
            email: state.params['email']!,
          ),
        ),
      ),
      GoRoute(
        name: userProfileScreen,
        path: '/userProfile',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: UserProfile(),
        ),
      ),
      GoRoute(
          name: verifyEmailScreen,
          path: '/verifyEmail',
          pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: VerifyEmailPage(),
              )),
      GoRoute(
        name: stepperScreen,
        path: '/stepper',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: StepperScreen(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: const ErrorScreen(),
    ),

    // redirect to the login page if the user is not logged in
    redirect: (state) {},
  );
}
