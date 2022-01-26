import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sma_app/models/user.dart';

class AuthService {
  late User currentUser;
  bool loggedIn = false;

  bool isLoggedIn() {
    return loggedIn;
  }

  login(String username, String password) {
    loggedIn = true;
  }


  Future signInAnon() async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      User? user = userCredential.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
