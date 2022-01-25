import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:intl/intl.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/components/clipImage.dart';
import 'package:sma_app/models/tagable.dart';
import 'package:sma_app/services/userservice.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userservice = UserService();
    final user = userservice.getUserById(0);
    String x = "";
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
                  user.firstName + " "+ user.lastName,
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
          header("Hobbys"),
          generateHobbyTags(),
          header("Eigenschaften"),
          generateAttributeTags(),
          header("Skills"),
          generateSkillTags(),
          header("Geburtsdatum"),
          body(convertDateToLocalString(user.dateOfBirth)),
          header("Wohnort"),
          body(user.hometown),
          header("Geschlecht"),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: const [
                Icon(Icons.male),
                Text("männlich", //TODO: auf user.sex umändern --> geht nicht weil String nullable type und const (Lösung noch zu finden)
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
              ],
            ),
          )
        ],
      ),
    ));
  }

  String convertDateToLocalString(DateTime date){
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }

  Container generateHobbyTags() {
    return createTagList(UserService().getUserById(0).hobbies);
  }

  Container generateAttributeTags() {
    return createTagList(UserService().getUserById(0).attributes);
  }

  Container generateSkillTags() {
    return createTagList(UserService().getUserById(0).skills);
  }

  Container createTagList(List<TagAble> tags){
    return Container(
      alignment: Alignment.topLeft,
      child: Tags(
        alignment: WrapAlignment.center,
        itemCount: tags.length,
        itemBuilder: (index) {
          return ItemTags(
            index: index,
            title: tags[index].value,
            color: Colors.blue,
            activeColor: tags[index].color,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0.0,
            // borderRadius: BorderRadius.all(Radius.circular(7.0)),
            textColor: Colors.white,
            textActiveColor: Colors.white,
            textOverflow: TextOverflow.ellipsis,
          );
        },
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
}
