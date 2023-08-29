import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFFdc3545);
  static const secondaryColor = Color.fromRGBO(16, 69, 115, 1);
  static const tertiaryColor = Color(0xFFF8F8F8);
  static const backGroundColor = tertiaryColor;
  static const borderColor = Color(0xFF757575);
  static const textColor = Color(0xFF303030);
  static const textColorAccent = Color(0xFFC5C5C5);
  static const hintTextColor = borderColor;
  static const errorColor = Color(0XFFFF6363);
  static const primeYello = Color(0xFFFFCE50);
  static const extraWhiteLight = Color.fromARGB(255, 255, 255, 255);
  static const extraLightWhite = Color.fromRGBO(239, 239, 239, 1);
  static const textGreyColor = Color.fromRGBO(117, 117, 117, 1);
  static const lightGreyColor = Color.fromRGBO(73, 73, 73, 0.06);
  static const accepted = Color.fromRGBO(0, 167, 67, 1);
  static const rejected = Color.fromRGBO(255, 59, 59, 1);
  static Color shadowColor = const Color(0xFF494949).withOpacity(0.06);

  static final shimmerBase = Colors.grey.withOpacity(0.20);
  static const Color shimmerHighlight = Color(0xFFE1E1E1);
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}