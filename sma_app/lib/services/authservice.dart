import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:sma_app/models/user.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();

  Future signInAnon() async {
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;

      notifyListeners();
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
