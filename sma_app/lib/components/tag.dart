import 'package:flutter/material.dart';

Container tag(String text, Color tagColor) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
    decoration: BoxDecoration(
        color: tagColor.withOpacity(0.1),
        border: Border.all(color: tagColor),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    child: Container(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: TextStyle(
          color: tagColor,
          fontSize: 14,
        ),
      ),
    ),
  );
}
