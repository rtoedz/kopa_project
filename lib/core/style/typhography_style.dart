import 'package:flutter/material.dart';

class TypographyStyle {
  static TextStyle get h1 => const TextStyle(
        fontFamily: 'MBCorpoATitle',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle get body => const TextStyle(
        fontFamily: 'MBCorpoSText',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      );

  static TextStyle get light => const TextStyle(
        fontFamily: 'MBCorpoSText',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      );
}
