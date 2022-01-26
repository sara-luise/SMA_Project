import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sma_app/colors.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmBHH1Yy6AQLSRiSNL5aooH8vsmmgDyWgNmyYIkcG5ieAKJ7FUCDXj1AE9-NrMZ1oew_w&usqp=CAU",
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: LinearProgressIndicator(
                  value: 0.3,
                  minHeight: 2,
                  backgroundColor: Colors.grey[200],
                  color: pmBlue200,
                ),
              ),
              Text(
                "Mini Mouse",
                style: TextStyle(color: headerColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
