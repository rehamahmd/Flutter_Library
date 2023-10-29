import 'package:flutter/material.dart';

class AppResponsive {
  AppResponsive._();

  static late MediaQueryData _mediaQueryData;

  static late double _scaleFactor;

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  static double get scaleFactor => _scaleFactor;

  static Size get size => _mediaQueryData.size;

  /// call when app initialized to save MediaQueryData and set [scaleFactor]
  static setMedia(MediaQueryData media, {double textScaleFactor = 1.0}) {
    _scaleFactor = media.size.shortestSide / (360) > 1.5 ? 1.5 : media.size.shortestSide / (360);

    _mediaQueryData =
        media.copyWith(textScaleFactor: media.textScaleFactor * scaleFactor * textScaleFactor);
  }

  static double getSize(double originalSize) => originalSize * _scaleFactor;
}
