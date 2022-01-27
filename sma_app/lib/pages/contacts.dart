import 'package:flutter/material.dart';
import 'package:sma_app/components/clipImage.dart';
import 'package:sma_app/models/user.dart';
import 'package:sma_app/services/authservice.dart';
import 'package:sma_app/services/userservice.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: createContactList(context));
  }

  List<Widget> createContactList(BuildContext context){
    List<Widget> widgets = [];
    for(var user in UserService().getUsers()){
      widgets.add(createContactListItem(context, user, "https://images.unsplash.com/photo-1519699047748-de8e457a634e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"));
    }
    return widgets;
  }

  GestureDetector createContactListItem(BuildContext context, SMAUser user, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/chat', arguments: user.id);
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(7),
              child: ClipPath(
                clipper: TriangleClipper(),
                child: Image.network(
                  imagePath,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  user.firstName + " " + user.lastName,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
