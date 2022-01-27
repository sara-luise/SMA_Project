import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/components/tag.dart';
import 'package:sma_app/main.dart';

class Matching extends StatelessWidget {
  const Matching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 18),
        child: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              print("right");
            }

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              print("left");
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Sky Clear ",
                      style: TextStyle(color: headerColor, fontSize: 30),
                      softWrap: true,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[200]!.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Image.network(
                        "https://cdn.dribbble.com/users/1577045/screenshots/4914645/media/028d394ffb00cb7a4b2ef9915a384fd9.png?",
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                    "From the day we arrive on the planet And, blinking, step into the sun There's more to see than can ever be seen More to do than can ever be done"
                    "There's far too much to take in here More to find than can ever be found But the sun rolling high Through the sapphire sky Keeps great and small on the endless round"
                    " ---- wie heißt dieses Lied? Von welchem Film ist es?",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
              ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 30,
                        child: Column(
                          children: const [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("25 Jahre",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w300)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("weiblich",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w300)),
                            )
                          ],
                        )),
                    Container(
                      width: 1,
                      height: 100,
                      color: Colors.grey[400],
                    ),
                    const Expanded(
                        flex: 30,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Linz",
                                style: TextStyle(fontWeight: FontWeight.w300)),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
