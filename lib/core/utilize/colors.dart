import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff6b9dfc);
  static const secondaryColor = Color(0xffa1c6fd);
  static const tertiaryColor = Color(0xff205cf1);
  static const blackColor = Color(0xff1a1d26);

  static const greyColor = Color(0xffd9dadb);

  static final Shader shader = const LinearGradient(
    colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  static const linearGradientBlue = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Color(0xff6b9dfc), Color(0xff205cf1)],
    stops: [0.0, 1.0],
  );
  static const linearGradientPurple = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Color(0xff51087E), Color(0xff6C0BA9)],
    stops: [0.0, 1.0],
  );
}
