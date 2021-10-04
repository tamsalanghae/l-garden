import 'package:flutter/material.dart';
import 'package:starter_kit/themes/font.dart';
import 'package:starter_kit/themes/style.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.quickSand,
  brightness: Brightness.light,
  primaryColor: AppColor.accentColor,
  primaryColorBrightness: Brightness.light,
  accentColor: AppColor.accentColor,
  accentColorBrightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: Colors.white,
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.quickSand,
  brightness: Brightness.dark,
  primaryColor: AppColor.accentColor,
  primaryColorBrightness: Brightness.dark,
  accentColor: AppColor.accentColor,
  accentColorBrightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: Colors.black45,
);
