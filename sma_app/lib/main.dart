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
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: pmSurfaceWhite,
        bodyColor: pmGrey400,
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
