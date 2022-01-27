import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double startWidth = size.width / 5;
    double smallRadius = 3;
    double bigRadius = 5;

    path.moveTo(startWidth, smallRadius);
    path.quadraticBezierTo(
        size.width - startWidth, size.height / 8, size.width, size.height / 2);
    path.quadraticBezierTo(
        size.width - startWidth, 8 * size.height / 9, startWidth, size.height);
    path.quadraticBezierTo(0, size.height / 2, startWidth, smallRadius);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
