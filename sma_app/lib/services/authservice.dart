import 'package:sma_app/models/user.dart';

class AuthService {
  late User currentUser;
  bool loggedIn = false;

  bool isLoggedIn(){
    return loggedIn;
  }

  Stream<bool> get stuff async* {
    await Future.delayed(Duration(seconds: 1));
    print("Status: " + loggedIn.toString());
    yield loggedIn;
  }

  login(String username, String password){
    loggedIn = true;
  }
}