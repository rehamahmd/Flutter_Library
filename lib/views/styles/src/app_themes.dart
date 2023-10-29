import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/styles/src/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "almarai",
    primaryColor: AppColors.orange,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.orange,
      primaryVariant: AppColors.deepOrange,
      secondary: AppColors.grey,
      onSecondary: AppColors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "almarai",
    primaryColor: AppColors.orange,
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      textTheme: CupertinoTextThemeData(
          textStyle: ThemeData(brightness: Brightness.dark).textTheme.subtitle2),
    ),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.orange,
      onPrimary: AppColors.white,
      primaryVariant: AppColors.deepOrange,
      secondary: AppColors.grey,
      onSecondary: AppColors.white,
    ),
  );
}
