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
    return MaterialApp(
      home: Wrapper()
    );
  }
}
