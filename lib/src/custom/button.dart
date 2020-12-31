import 'package:flutter/material.dart';

Widget customButton(String text, Function function) {
  return MaterialButton(
    child: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
    color: Colors.blue,
    onPressed: function,
  );
}
