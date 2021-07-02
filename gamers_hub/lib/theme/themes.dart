import 'package:flutter/material.dart';
import 'package:gamers_hub/theme/colors.dart';

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

var themeLight = ThemeData.dark().copyWith(
    primaryColor: ColorsTheme.background_black,
    backgroundColor: ColorsTheme.background_black,
    scaffoldBackgroundColor: ColorsTheme.background_black,
    accentColor: ColorsTheme.accent_bg_black,
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
    accentColor: ColorsTheme.accent_bg_blue,
    errorColor: Colors.red[900],
    cardColor: shrineBackgroundWhite,
    primaryIconTheme: _customIconTheme(ThemeData.dark().iconTheme),
    textTheme: _buildShrineTextTheme(ThemeData.dark().textTheme),
    primaryTextTheme: _buildShrineTextTheme(ThemeData.dark().primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(ThemeData.dark().accentTextTheme),
    iconTheme: _customIconTheme(ThemeData.dark().iconTheme),
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

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: defaultLetterSpacing,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18,
          letterSpacing: defaultLetterSpacing,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: defaultLetterSpacing,
        ),
        bodyText2: base.bodyText2!.copyWith(
          letterSpacing: defaultLetterSpacing,
        ),
        subtitle1: base.subtitle1!.copyWith(
          letterSpacing: defaultLetterSpacing,
        ),
        headline4: base.headline4!.copyWith(
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: Colors.white,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
