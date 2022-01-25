import 'package:flutter/material.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/components/clipImage.dart';
import 'package:sma_app/components/tag.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "Reiner Zufall",
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
          body(
              "Schlafe, mein Prinzchen, es ruhn Schäfchen und Vögelchen nun. Garten und Wiese verstummt, Auch nicht ein Bienchen mehr summt; Luna mit silbernem Schein Gucket zum Fenster herein."
              "Schlafe beim silbernen Schein, Schlafe, mein Prinzchen, schlaf' ein! Schlaf' ein, schlaf 'ein!"),
          header("Tags"),
          Wrap(
            children: [
              tag("Tanzen", Colors.lightGreen[400]!),
              tag("Fußball", Colors.lightGreen[400]!),
              tag("Eislaufen", Colors.lightGreen[400]!),
              tag("Skiifahren", Colors.lightGreen[400]!),
              tag("Volleayball", Colors.lightGreen[400]!),
              tag("lesen", Colors.orange[300]!),
              tag("Klavir spielen", Colors.orange[300]!),
              tag("singen", Colors.orange[300]!),
              tag("klein", Colors.indigo[300]!),
              tag("süß", Colors.indigo[300]!),
              tag("liebenswürdig", Colors.indigo[300]!),
            ],
          ),
          header("Geburtsdatum"),
          body("10. Dezember 1997"),
          header("Wohnort"),
          body("Hagenberg im Mühlkreis"),
          header("Geschlecht"),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: const [
                Icon(Icons.male),
                Text("männlich",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
              ],
            ),
          )
        ],
      ),
    ));
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
