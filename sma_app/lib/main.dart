import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sma_app/pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: _buildPixelMatchTheme(),
    home: Home(),
  ));
}

ThemeData _buildPixelMatchTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _pixelMatchColorScheme,
    textTheme: _buildPixelMatchTextTheme(base.textTheme),
  );
}

TextTheme _buildPixelMatchTextTheme(TextTheme base) {
  return base.apply(
    fontFamily: 'Rubik',
    displayColor: pmSurfaceWhite,
    bodyColor: Colors.black,
  );
}

ColorScheme _pixelMatchColorScheme = ColorScheme(
  primary: pmBlue50,
  primaryVariant: pmBlue100,
  secondary: pmGrey300,
  secondaryVariant: pmBlue100,
  surface: pmSurfaceWhite,
  background: pmBackgroundWhite,
  error: pmErrorRed,
  onPrimary: pmBlue100,
  onSecondary: pmGrey400,
  onSurface: pmGrey400,
  onBackground: pmGrey400,
  onError: pmSurfaceWhite,
  brightness: Brightness.light,
);

Color pmBlue50 = Colors.blue[50]!;
Color pmGrey300 = Colors.grey[300]!;

Color pmBlue100 = Colors.blue[100]!;
Color pmGrey400 = Colors.grey[400]!;

Color pmErrorRed = Colors.red[900]!;

Color pmSurfaceWhite = Colors.white;
Color pmBackgroundWhite = Colors.grey[50]!;

const defaultLetterSpacing = 0.03;
