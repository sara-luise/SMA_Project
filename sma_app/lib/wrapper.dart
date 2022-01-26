import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sma_app/pages/authentication.dart';
import 'package:sma_app/pages/home.dart';
import 'package:sma_app/services/authservice.dart';

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
        if(snapshot.hasData){
          
          return Home();
        }
        else{
          return Authenticate();
        }
      }
    );
  }
}