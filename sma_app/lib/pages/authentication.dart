import 'package:flutter/material.dart';
import 'package:sma_app/services/authservice.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({ Key? key }) : super(key: key);

  @override
  AuthenticateState createState() => AuthenticateState();
}

class AuthenticateState extends State<Authenticate> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  AuthService authService = AuthService();

  return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Pixxle',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30
                ),
              )
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'LogIn',
                style: TextStyle(fontSize: 20),
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.blue),
                  labelText: 'Benutzername',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.blue),
                  labelText: 'Password'
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Passwort vergessen',
                style: TextStyle(
                  color: Colors.blue
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text(
                    'Anmelden',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  ),
                  onPressed: () async {
                    print(usernameController.text);
                    print(passwordController.text);
                    // authService.login(usernameController.text, passwordController.text);
                    await authService.signInAnon();
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Noch keinen Account?'),
                TextButton(
                  child: const Text(
                    'Registrieren',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
                    ),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )
      )
    );
  }
}

