import 'package:flutter/material.dart';

class ColorsUtil {
  static final fundo = colorHex("F2F2F2");
  static final laranja = colorHex("F4F4F7");

  static Color colorHex(String hex) {
    if (hex == null) {
      return Colors.transparent;
    } else {
      return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
    }
  }
}
