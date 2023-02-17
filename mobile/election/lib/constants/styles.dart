import 'package:flutter/material.dart';

class Styles {
  static const EdgeInsetsGeometry pagePadding =
      EdgeInsets.fromLTRB(10, 10, 10, 10);

  static ThemeData themeData = ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 48.0)),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      backgroundColor: const MaterialStatePropertyAll(Color(0XFF082585)),
    )),
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 18,
    color: Color(0XFF082585),
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subTitleStyle = TextStyle(
    fontSize: 16,
    color: Color(0XFF3F3F3F),
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
