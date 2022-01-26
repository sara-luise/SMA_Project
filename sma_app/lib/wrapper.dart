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
    final data = Provider.of<bool>(context);
    print(data);
    if(data){
      return const Home();
    }
    else{
      return const Authenticate();
    }
    return Authenticate();
    // if(authService.isLoggedIn() == true){
    //   return const Home();
    // }
    // else {
    //   return const Authenticate();
    // }
  }
}