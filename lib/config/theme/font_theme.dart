import 'package:flutter/material.dart';

class CustomTextTheme {
  final BuildContext context;
  final Color color;

  CustomTextTheme(this.context, this.color);

  TextTheme get textTheme {
    final size = MediaQuery.of(context).size;

    return TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'roboto_medium',
        fontSize: size.height / 37,
        color: color,
      ),
      titleMedium: TextStyle(
        fontSize: size.height / 40,
        color: color,
        fontFamily: 'roboto_medium',
      ),
      labelSmall: TextStyle(
        fontSize: size.height / 50,
        color: color,
        fontFamily: 'roboto_regular',
      ),
    );
  }
}