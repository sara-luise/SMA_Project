import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/pages/authentication.dart';
import 'package:sma_app/pages/chat.dart';
import 'package:sma_app/pages/home.dart';
import 'package:sma_app/pages/matching.dart';
import 'package:sma_app/services/authservice.dart';
import 'package:sma_app/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Pixxle());
} 

class Pixxle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasData){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: buildPixelMatchTheme(),
            initialRoute: '/',
            routes: {
              '/': (context) => const Home(),
              '/matching': (context) => const Matching(),
              '/chat': (context) => const Chat(),
            }
          );
        }
        else if(snapshot.hasError){
          return Center(child: Text("Something Went Wrong!"));
        }
        else{
          return Authenticate();
        }
      },
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
