import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sma_app/pages/authentication.dart';
import 'package:sma_app/pages/chat.dart';
import 'package:sma_app/pages/home.dart';
import 'package:sma_app/pages/matching.dart';
import 'package:sma_app/services/authservice.dart';

import 'colors.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    
    return getLandingPage();
  }

  StreamBuilder<User?> getLandingPage(){
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot){
        if(FirebaseAuth.instance.currentUser != null){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: buildPixelMatchTheme(),
            // home: Home()
            initialRoute: '/',
            routes: {
              '/': (context) => const Home(),
              '/matching': (context) => const Matching(),
              '/chat': (context) => const Chat(),
            }
          );
        }
        return Authenticate();
      }
    );
  }
}

ThemeData buildPixelMatchTheme() {
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
  primary: pmBlue200,
  primaryVariant: pmBlue200,
  secondary: pmGrey300,
  secondaryVariant: pmGrey400,
  surface: pmSurfaceWhite,
  background: pmBackgroundWhite,
  error: pmErrorRed,
  onPrimary: pmBlue200,
  onSecondary: pmGrey400,
  onSurface: pmGrey400,
  onBackground: pmGrey400,
  onError: pmSurfaceWhite,
  brightness: Brightness.light,
);
