import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/components/matchCard.dart';
import 'package:sma_app/main.dart';
import 'package:sma_app/pages/matching.dart';

class Match extends StatelessWidget {
  const Match({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runAlignment: WrapAlignment.center,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MatchCard(),
            MatchCard(),
            MatchCard(),
            SizedBox(
              width: 150,
              height: 189,
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/matching');
                  },
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide.lerp(
                            BorderSide(
                              style: BorderStyle.solid,
                              color: pmBlue200,
                              width: 1.0,
                            ),
                            BorderSide(
                              style: BorderStyle.solid,
                              color: pmBlue200,
                              width: 1.0,
                            ),
                            1.0),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          pmBlue200.withOpacity(0.3))),
                  child: Icon(
                    Icons.add,
                    color: pmBlue200,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
