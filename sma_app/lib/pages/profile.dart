import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/components/clipImage.dart';
import 'package:sma_app/components/tag.dart';
import 'package:sma_app/models/tagable.dart';
import 'package:sma_app/services/authservice.dart';
import 'package:sma_app/services/userservice.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userservice = UserService();
    final user = userservice.currentUser();
    return Container(
        child: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  user.firstName + " " + user.lastName,
                  style: TextStyle(color: headerColor, fontSize: 30),
                  softWrap: true,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(7),
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Image.network(
                        "https://images.unsplash.com/photo-1519699047748-de8e457a634e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        width: 150),
                  ),
                ),
              )
            ],
          ),
          header("eigene Beschreibung"),
          body(user.description),
          header("Tags"),
          subHeader("Hobbys"),
          createTagList(user.hobbies),
          subHeader("Eigenschaften"),
          createTagList(user.attributes),
          subHeader("Skills"),
          createTagList(user.skills),
          header("Geburtsdatum"),
          body(convertDateToLocalString(user.dateOfBirth)),
          header("Wohnort"),
          body(user.hometown),
          header("Geschlecht"),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                Icon(Icons.male),
                Text(user.sex,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: TextButton(
              onPressed: () {
                AuthService().logout();
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: pmBlue200),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: const Text(
                    "log out",
                    style: TextStyle(fontSize: 22),
                  )
                ),
            ),
          ),
        ],
      ),
    ));
  }

  String convertDateToLocalString(DateTime date) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }

  Padding createTagList(List<TagAble> tags) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Wrap(
        children:
            tags.map((tagable) => tag(tagable.value, tagable.color)).toList(),
      ),
    );
  }

  Padding body(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
    );
  }

  Padding header(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
      child: Text(
        text,
        style: TextStyle(color: headerColor, fontSize: 20),
      ),
    );
  }

  Padding subHeader(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
      child: Text(
        text,
        style: TextStyle(color: headerColor, fontSize: 15),
      ),
    );
  }
}
