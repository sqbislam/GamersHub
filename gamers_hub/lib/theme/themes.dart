import 'package:flutter/material.dart';
import 'package:gamers_hub/theme/colors.dart';

var themeLight = ThemeData.dark().copyWith(
    primaryColor: ColorsTheme.background_black,
    backgroundColor: ColorsTheme.background_black,
    scaffoldBackgroundColor: ColorsTheme.background_black,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: ColorsTheme.accent_bg_black,
      minimumSize: Size(100, 50),
      textStyle: TextStyle(fontSize: 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    )));

var themeDark = ThemeData.dark().copyWith(
    primaryColor: ColorsTheme.background_blue,
    backgroundColor: ColorsTheme.background_blue,
    scaffoldBackgroundColor: ColorsTheme.background_blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: ColorsTheme.accent_bg_blue,
      minimumSize: Size(100, 50),
      textStyle: TextStyle(fontSize: 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    )));
