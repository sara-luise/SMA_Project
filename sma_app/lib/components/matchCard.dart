import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sma_app/colors.dart';
import 'package:sma_app/models/user.dart';
import 'package:sma_app/services/userservice.dart';

class MatchCard extends StatelessWidget {
  final int userId;
  const MatchCard({Key? key, this.userId = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SMAUser user = UserService().getUserById(this.userId);
    return SizedBox(
      width: 140,
      height: 180,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/chat', arguments: user.id);
        },
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
                  user.firstName + " " + user.lastName,
                  style: TextStyle(color: headerColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
