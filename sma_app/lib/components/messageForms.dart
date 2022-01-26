import 'package:flutter/material.dart';

double startTriangle = 35.5;
double heightTriangle = 6;
double radius = 4;

class UserMessageForm extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    //Triangle top
    path.moveTo(size.width - startTriangle, heightTriangle);
    path.lineTo(size.width - (startTriangle - heightTriangle), 0);
    path.lineTo(
        size.width - (startTriangle - heightTriangle * 2), heightTriangle);
    //East Triangle
    path.lineTo(size.width - radius, heightTriangle);
    path.quadraticBezierTo(
        size.width, heightTriangle, size.width, heightTriangle + radius);
    path.lineTo(size.width, size.height - (heightTriangle + radius));
    path.quadraticBezierTo(size.width, size.height - heightTriangle,
        size.width - radius, size.height - heightTriangle);
    path.lineTo(size.width - (startTriangle - heightTriangle * 2),
        size.height - heightTriangle);
    //Trianle bottom
    path.lineTo(size.width - (startTriangle - heightTriangle), size.height);
    path.lineTo(size.width - startTriangle, size.height - heightTriangle);
    //westTriangle
    path.lineTo(radius, size.height - heightTriangle);
    path.quadraticBezierTo(0, size.height - heightTriangle, 0,
        size.height - (heightTriangle + radius));
    path.lineTo(0, heightTriangle + radius);
    path.quadraticBezierTo(0, heightTriangle, radius, heightTriangle);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WritingPartnerMessageForm extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    //Triangle top
    path.moveTo(startTriangle - heightTriangle * 2, heightTriangle);
    path.lineTo(startTriangle - heightTriangle, 0);
    path.lineTo(startTriangle, heightTriangle);
    //East Triangle
    path.lineTo(size.width - radius, heightTriangle);
    path.quadraticBezierTo(
        size.width, heightTriangle, size.width, heightTriangle + radius);
    path.lineTo(size.width, size.height - (heightTriangle + radius));
    path.quadraticBezierTo(size.width, size.height - heightTriangle,
        size.width - radius, size.height - heightTriangle);
    path.lineTo(startTriangle, size.height - heightTriangle);
    //Trianle bottom
    path.lineTo(startTriangle - heightTriangle, size.height);
    path.lineTo(
        startTriangle - heightTriangle * 2, size.height - heightTriangle);
    //westTriangle
    path.lineTo(radius, size.height - heightTriangle);
    path.quadraticBezierTo(0, size.height - heightTriangle, 0,
        size.height - (heightTriangle + radius));
    path.lineTo(0, heightTriangle + radius);
    path.quadraticBezierTo(0, heightTriangle, radius, heightTriangle);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
