import 'package:flutter/material.dart';
import 'package:sma_app/pages/contacts.dart';
import 'package:sma_app/pages/match.dart';
import 'package:sma_app/pages/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: SafeArea(
          child: IndexedStack(
            index: _currentIndex,
            children: const [
              Match(),
              Contacts(),
              Profile(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[400]!))),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedItemColor: Colors.blue[200],
          unselectedItemColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: Theme.of(context).textTheme.caption,
          unselectedLabelStyle: Theme.of(context).textTheme.caption,
          elevation: 0,
          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              label: "Matches",
              icon: Icon(Icons.extension),
            ),
            BottomNavigationBarItem(
              label: "Chat",
              icon: Icon(Icons.question_answer),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
