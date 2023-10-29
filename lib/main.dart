import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/providers/src/listing_provider.dart';
import 'package:flutter_app/providers/src/settings_provider.dart';
import 'package:flutter_app/views/router/router.dart';
import 'package:flutter_app/views/styles/styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final state = LoginStateProvider(await SharedPreferences.getInstance());
  state.checkLoggedIn();

  runApp(MyApp(loginState: state));
}

class MyApp extends StatelessWidget {
  final LoginStateProvider loginState;

  const MyApp({Key? key, required this.loginState}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          lazy: false,
          create: (BuildContext createContext) => ThemeProvider(),
        ),
        ChangeNotifierProvider<ListingProvider>(
          lazy: false,
          create: (BuildContext createContext) => ListingProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          lazy: false,
          create: (BuildContext createContext) => SettingsProvider(),
        ),
        ChangeNotifierProvider(create: (_) => StepperProvider()),
        ChangeNotifierProvider<LoginStateProvider>(
          lazy: false,
          create: (BuildContext createContext) => loginState,
        ),
        ChangeNotifierProvider(create: (_) => SocialAuthProvider()),
        Provider<MyRouter>(
          lazy: false,
          create: (BuildContext createContext) => MyRouter(loginState),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final router = Provider.of<MyRouter>(context, listen: false).router;
          final _themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            builder: (BuildContext context, Widget? child) {
              var t = Provider.of<SettingsProvider>(context).textScaleFactor;
              AppResponsive.setMedia(MediaQuery.maybeOf(context)!, textScaleFactor: t);
              return MediaQuery(data: AppResponsive.mediaQueryData, child: child!);
            },
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: _themeProvider.themeMode,
          );
        },
      ),
    );
  }
}
